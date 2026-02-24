CREATE TABLE IF NOT EXISTS "usuarios" (
	"id" serial NOT NULL UNIQUE,
	"nome" varchar(50) NOT NULL,
	"genero" varchar(15) NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"email" varchar(50) NOT NULL UNIQUE,
	"telefone" varchar(255) NOT NULL,
	"senha" varchar(255) NOT NULL,
	"nivel" varchar(10) NOT NULL DEFAULT 'cliente',
	"data_nasc" date NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "produtos" (
	"id" serial NOT NULL UNIQUE,
	"nome" varchar(255) NOT NULL,
	"valor" varchar(255) NOT NULL,
	"descricao" varchar(255) NOT NULL,
	"desconto" bigint DEFAULT '0',
	"estoque" bigint NOT NULL,
	"categoria_id" bigint NOT NULL,
	"tamanhos" varchar(255) NOT NULL,
	"cores" varchar(255) NOT NULL,
	"altura" varchar(255) NOT NULL,
	"largura" varchar(255) NOT NULL,
	"comprimento" varchar(255) NOT NULL,
	"peso" varchar(255) NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "categoria" (
	"id" serial NOT NULL UNIQUE,
	"nome" varchar(50) NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "produto_imagens" (
	"id" serial NOT NULL UNIQUE,
	"url" varchar(255) NOT NULL,
	"produto_id" bigint NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "tamanhos" (
	"id" serial NOT NULL UNIQUE,
	"nome" varchar(255) NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "pedidos" (
	"id" serial NOT NULL UNIQUE,
	"usuario_id" bigint NOT NULL,
	"status" varchar(255) NOT NULL,
	"valor_total" varchar(255) NOT NULL,
	"valor_desc" varchar(255) NOT NULL DEFAULT '0',
	"logradouro" varchar(255) NOT NULL,
	"numero" varchar(255) NOT NULL,
	"complemento" varchar(255),
	"bairro" varchar(255) NOT NULL,
	"cidade" varchar(255) NOT NULL,
	"estado" varchar(255) NOT NULL,
	"cep" varchar(255) NOT NULL,
	"cod_rastreio" varchar(100),
	"previsao_entrega" date NOT NULL,
	"cupom_id" bigint DEFAULT '0',
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "cupons" (
	"id" serial NOT NULL UNIQUE,
	"nome" varchar(50) NOT NULL,
	"quantidade" bigint NOT NULL,
	"validade" date NOT NULL,
	"valor_desc" bigint NOT NULL DEFAULT '0',
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "banner" (
	"id" serial NOT NULL UNIQUE,
	"url_banner" varchar(255) NOT NULL,
	"validade" date NOT NULL,
	"link" varchar(255),
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "pedido_produto" (
	"id" serial NOT NULL UNIQUE,
	"id_produto" bigint NOT NULL,
	"id_pedido" bigint NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "avaliacoes" (
	"id" serial NOT NULL UNIQUE,
	"nota" bigint NOT NULL,
	"descricao" varchar(255),
	"usuario_id" bigint NOT NULL,
	"produto_id" bigint NOT NULL,
	PRIMARY KEY ("id")
);


ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk6" FOREIGN KEY ("categoria_id") REFERENCES "categoria"("id");

ALTER TABLE "produto_imagens" ADD CONSTRAINT "produto_imagens_fk2" FOREIGN KEY ("produto_id") REFERENCES "produtos"("id");

ALTER TABLE "pedidos" ADD CONSTRAINT "pedidos_fk1" FOREIGN KEY ("usuario_id") REFERENCES "usuarios"("id");

ALTER TABLE "pedidos" ADD CONSTRAINT "pedidos_fk14" FOREIGN KEY ("cupom_id") REFERENCES "cupons"("id");


ALTER TABLE "pedido_produto" ADD CONSTRAINT "pedido_produto_fk1" FOREIGN KEY ("id_produto") REFERENCES "produtos"("id");

ALTER TABLE "pedido_produto" ADD CONSTRAINT "pedido_produto_fk2" FOREIGN KEY ("id_pedido") REFERENCES "pedidos"("id");
ALTER TABLE "avaliacoes" ADD CONSTRAINT "avaliacoes_fk3" FOREIGN KEY ("usuario_id") REFERENCES "usuarios"("id");

ALTER TABLE "avaliacoes" ADD CONSTRAINT "avaliacoes_fk4" FOREIGN KEY ("produto_id") REFERENCES "produtos"("id");