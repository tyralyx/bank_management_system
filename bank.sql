CREATE TABLE "account" (
    "account_number" varchar(11) NOT NULL PRIMARY KEY,
    "account_type" varchar(20) NOT NULL,
    "balance" number(20,2) NOT NULL,
    "branch_id" number NOT NULL,
    FOREIGN KEY "branch_id" REFERENCES "branch"("branch_id")
);

CREATE TABLE "customer" (
    "cust_id" number NOT NULL PRIMARY KEY,
    "name" varchar(100) NOT NULL,
    "phone" int(10) NOT NULL,
    "address" varchar(100) NOT NULL
);

CREATE TABLE "bank" (
    "code" number GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" varchar2(100) NOT NULL,
    "address" varchar(100) NOT NULL
);

CREATE TABLE "branch" (
    "branch_id" number GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" varchar2(100) NOT NULL,
    "address" varchar2(100) NOT NULL,
    "code" number NOT NULL,
    FOREIGN KEY "name" REFERENCES "bank"("name"),
    FOREIGN KEY "code" REFERENCES "bank"("code")
);

CREATE TABLE "loan" (
    "loan_id" number NOT NULL PRIMARY KEY,
    "loan_type" varchar2(50) NOT NULL,
    "amount" number(20,2) NOT NULL,
    "branch_id" number NOT NULL,
    FOREIGN KEY "branch_id" REFERENCES "branch"("branch_id")
);

CREATE TABLE "customer_account" (
    "account_number" number,
    "cust_id" number,
    FOREIGN KEY "account_number" REFERENCES "account"("account_number"),
    FOREIGN KEY "cust_id" REFERENCES "customer"("cust_id"),
    PRIMARY KEY ("account_number","cust_id")
);

CREATE TABLE "customer_loan" (
    "cust_id" number,
    "loan_id" number,
    FOREIGN KEY "loan_id" REFERENCES "loan"("loan_id"),
    FOREIGN KEY "cust_id" REFERENCES "customer"("cust_id"),
    PRIMARY KEY ("cust_id","loan_id")
)