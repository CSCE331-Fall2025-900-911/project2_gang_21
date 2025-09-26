CREATE TABLE IF NOT EXISTS "MenuItem" (
  "id" INT PRIMARY KEY,
  "name" VARCHAR,
  "price" DECIMAL
);

CREATE TABLE IF NOT EXISTS "Order" (
  "id" INT PRIMARY KEY,
  "date" DATETIME,
  "price" DECIMAL,
  "employeeId" INT,
  "customerId" INT
    CONSTRAINT "FK_Order_employeeId"
        FOREIGN KEY ("employeeId") 
            REFERENCES "Employee"("id"),
    CONSTRAINT "FK_Order_customerId"
        FOREIGN KEY ("customerId")
            REFERENCES "Customer"("id")
);

CREATE TABLE IF NOT EXISTS "OrderItem" (
  "id" INT PRIMARY KEY,
  "menuItemId" INT,
  "orderId" INT,
  "name" VARCHAR,
  "size" VARCHAR,
  "notes" VARCHAR,
  "tea" VARCHAR,
  "sugar" INT,
  "ice" INT,
  CONSTRAINT "FK_OrderItem_menuItemId"
    FOREIGN KEY ("menuItemId")
      REFERENCES "MenuItem"("id"),
  CONSTRAINT "FK_OrderItem_orderId"
    FOREIGN KEY ("orderId")
      REFERENCES "Order"("id")
);

CREATE TABLE IF NOT EXISTS "Customer" (
  "id" INT PRIMARY KEY,
  "email" VARCHAR,
  "points" INT
);

CREATE TABLE IF NOT EXISTS "Employee" (
  "id" INT PRIMARY KEY,
  "isManager" BOOLEAN
);

CREATE TABLE IF NOT EXISTS "Inventory" (
  "id" INT PRIMARY KEY,
  "quantity" DECIMAL,
  "name" VARCHAR,
);

CREATE TABLE IF NOT EXISTS "Topping" (
  "id" INT PRIMARY KEY,
  "name" VARCHAR,
  "price" DECIMAL
);


CREATE TABLE IF NOT EXISTS "OrderItem_Topping" {
  "orderId" INT,
  "toppingId" INT,
  PRIMARY KEY ("orderId", "toppingId"),
  CONSTRAINT "FK_OrderItem_orderId"
    FOREIGN KEY "orderId"
      REFERENCES "OrderItem"("id"),
  CONSTRAINT "FK_OrderItem_toppingId"
    FOREIGN KEY "toppingId"
      REFERENCES "Topping"("id")
}

CREATE TABLE IF NOT EXISTS "Recipe" {
  "id" INT PRIMARY KEY,
  "menuItemId" INT,
  "inventoryId" INT,
  "quantity" DECIMAL,
  "unit" VARCHAR,
  CONSTRAINT "FK_Recipe_menuItemId"
    FOREIGN KEY "menuItemId"
      REFERENCES "MenuItem"("id"),
  CONSTRAINT "FK_Recipe_inventoryId"
    FOREIGN KEY "inventoryId"
      REFERENCES "Inventory"("id")
}