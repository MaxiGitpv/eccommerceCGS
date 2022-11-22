CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "gender" varchar NOT NULL,
  "birthday_date" date NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "phone" varchar,
  "dni" varchar,
  "address" varchar,
  "role" uuid NOT NULL,
  "profile_img" varchar,
  "created_at" timestamp DEFAULT 'now()',
  "updated_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "users_images" (
  "id" uuid PRIMARY KEY,
  "url" varchar NOT NULL,
  "user_id" uuid NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "user_id" uuid NOT NULL
);

CREATE TABLE "products" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "score" float NOT NULL,
  "price" money NOT NULL,
  "discount" money NOT NULL,
  "order_id" uuid NOT NULL,
  "role_id" varchar NOT NULL,
  "cart_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "updated_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "carts" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "product_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "updated_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "purchases" (
  "id" uuid PRIMARY KEY,
  "cart_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "count" int NOT NULL,
  "order_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "updated_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "orders" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "purchase_id" uuid NOT NULL,
  "product_id" uuid NOT NULL,
  "pendingOrder" bool DEFAULT false,
  "canceledOrder" bool DEFAULT false,
  "created_at" timestamp DEFAULT 'now()',
  "updated_at" timestamp DEFAULT 'now()'
);

ALTER TABLE "users_images" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

CREATE TABLE "products_orders" (
  "products_id" uuid,
  "orders_product_id" uuid,
  PRIMARY KEY ("products_id", "orders_product_id")
);

ALTER TABLE "products_orders" ADD FOREIGN KEY ("products_id") REFERENCES "products" ("id");

ALTER TABLE "products_orders" ADD FOREIGN KEY ("orders_product_id") REFERENCES "orders" ("product_id");


CREATE TABLE "products_carts" (
  "products_id" uuid,
  "carts_product_id" uuid,
  PRIMARY KEY ("products_id", "carts_product_id")
);

ALTER TABLE "products_carts" ADD FOREIGN KEY ("products_id") REFERENCES "products" ("id");

ALTER TABLE "products_carts" ADD FOREIGN KEY ("carts_product_id") REFERENCES "carts" ("product_id");


ALTER TABLE "purchases" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "purchases" ADD FOREIGN KEY ("cart_id") REFERENCES "carts" ("id");

CREATE TABLE "orders_purchases" (
  "orders_id" uuid,
  "purchases_order_id" uuid,
  PRIMARY KEY ("orders_id", "purchases_order_id")
);

ALTER TABLE "orders_purchases" ADD FOREIGN KEY ("orders_id") REFERENCES "orders" ("id");

ALTER TABLE "orders_purchases" ADD FOREIGN KEY ("purchases_order_id") REFERENCES "purchases" ("order_id");


ALTER TABLE "roles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");