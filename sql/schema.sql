-- PROVINSI
CREATE TABLE "provinces" (
  "id" char(2) NOT NULL,
  "name" TEXT NOT NULL,
  PRIMARY KEY ("id")
);

-- KABUPATEN
CREATE TABLE "regencies" (
  "id" char(4) NOT NULL,
  "province_id" char(2) NOT NULL REFERENCES provinces(id),
  "name" TEXT NOT NULL,
  "packet_id" INT NOT NULL DEFAULT 1 REFERENCES packets(id),
  PRIMARY KEY ("id")
);
CREATE INDEX regencies_province_id_idx ON regencies(province_id);

-- KECAMATAN
CREATE TABLE "districts" (
  "id" char(6) NOT NULL,
  "regency_id" char(4) NOT NULL REFERENCES regencies(id),
  "name" TEXT NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX districts_regency_id_idx ON districts(regency_id);

-- DESA/KELURAHAN
CREATE TABLE "villages" (
  "id" char(10) NOT NULL,
  "district_id" char(6) NOT NULL REFERENCES districts(id),
  "name" TEXT NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX villages_district_id_idx ON villages(district_id);