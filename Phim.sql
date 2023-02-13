create database Phim;
use Phim;


create table BANG_NGUOI_DUNG (
ID_NGUOI_DUNG int  not null primary key,
HO_TEN varchar (255) not null,
SO_DIEN_THOAI varchar (255) not null,
GIOI_TINH varchar (255) not null
);

insert into BANG_NGUOI_DUNG (ID_NGUOI_DUNG, HO_TEN, SO_DIEN_THOAI, GIOI_TINH) values
('1','Vũ Đình Duẩn', '988539548', 'Nam'),
('2', 'Nguyễn Khắc Hùng', '34362368', 'Nam' ),
('3', 'Nguyễn Thị Phượng', '25353636', 'Nữ'),
('4', 'Trần Thị Thu Phương', '38373737', 'Nữ');

select * from `BANG_NGUOI_DUNG`;

create table BANG_PHIM (
ID_PHIM varchar(255) not null primary key,
TEN_PHIM varchar(255) not null,
THE_LOAI varchar(255) not null,
DANH_MUC varchar(255) not null,
NGAY_SAN_XUAT datetime  not null,
GIA_PHIM varchar(255) not null
);


insert into BANG_PHIM (ID_PHIM, TEN_PHIM, THE_LOAI, DANH_MUC, NGAY_SAN_XUAT, GIA_PHIM) values
('M1', 'Nhà Bà Nữ', 'Tình cảm', '18+', '2023-1-22', '60.000VND'),
('M2', 'Avartar', 'Phiêu lưu', '16+', '2009-12-17', '50.000VND'),
('M3', 'Chị chị em em', 'Tình cảm',	'18+', '2019-12-20', '40.000VND');

select * from `BANG_PHIM`;

create table BANG_DANH_MUC (
ID_DANH_MUC varchar(255) not null primary key,
TEN_DANH_MUC varchar(255) not null
);

insert into BANG_DANH_MUC (ID_DANH_MUC, TEN_DANH_MUC) VALUES
('T1',	'13+'),
('T2',	'14+'),
('T3',	'16+'),
('T4',	'18+'),
('T5',	'12-');

select * from `BANG_DANH_MUC`;


create table BANG_THUE_PHIM (
ID_VE_THUE varchar(255) not null primary key,
ID_NGUOI_DUNG INT,
THOI_GIAN_THUE date,
NGUOI_THUE varchar(255),
ID_PHIM varchar(255),
SO_TIEN varchar(255) not null,
THOI_GIAN_TRA datetime not null
 );

insert into BANG_THUE_PHIM (ID_VE_THUE,ID_NGUOI_DUNG,THOI_GIAN_THUE, NGUOI_THUE, ID_PHIM, SO_TIEN, THOI_GIAN_TRA ) values 
('L1', 1, '2023-1-20', 'Phuong', 'M1', '100000', '2023-8-20 15:50'),
('L2', 2, '2023-1-20', 'Duan', 'M1', '250000', '2023-8-20 13:33'),
('L3', 3, '2023-1-20', 'Chuong', 'M2', '3000000', '2023-8-20 14:20');

select * from `BANG_THUE_PHIM`;

select  HO_TEN, TEN_PHIM, THE_LOAI,  SO_TIEN, THOI_GIAN_THUE, THOI_GIAN_TRA
from BANG_NGUOI_DUNG
inner join BANG_THUE_PHIM on BANG_NGUOI_DUNG.ID_NGUOI_DUNG = BANG_THUE_PHIM.ID_NGUOI_DUNG
inner join BANG_PHIM on BANG_THUE_PHIM.ID_PHIM = BANG_PHIM.ID_PHIM
WHERE SO_TIEN <= 300000
AND THE_LOAI != 'Phiêu lưu';

select  HO_TEN, THOI_GIAN_TRA,TEN_PHIM, THE_LOAI
from BANG_NGUOI_DUNG
inner join BANG_THUE_PHIM on BANG_NGUOI_DUNG.ID_NGUOI_DUNG = BANG_THUE_PHIM.ID_NGUOI_DUNG
inner join BANG_PHIM on BANG_THUE_PHIM.ID_PHIM = BANG_PHIM.ID_PHIM


-- 1. Lấy ra 3 người thuê nhiều phim nhất. Thông tin những người thuê phim đó là gì?----			
SELECT BANG_NGUOI_DUNG.HO_TEN, COUNT(*) AS SO_LUOT_THUE
FROM BANG_THUE_PHIM
INNER JOIN BANG_NGUOI_DUNG ON BANG_THUE_PHIM.ID_NGUOI_DUNG = BANG_NGUOI_DUNG.ID_NGUOI_DUNG
GROUP BY BANG_NGUOI_DUNG.ID_NGUOI_DUNG
ORDER BY SO_LUOT_THUE DESC
LIMIT 3;

-- 2. Tính tổng doanh thu số tiền của một bộ phim trong 2 ngày
SELECT SUM(SO_TIEN) AS TOTAL_REVENUE FROM BANG_THUE_PHIM 
INNER JOIN BANG_PHIM ON BANG_THUE_PHIM.ID_PHIM = BANG_PHIM.ID_PHIM
WHERE BANG_PHIM.TEN_PHIM = 'Nhà Bà Nữ'
AND BANG_THUE_PHIM.THOI_GIAN_THUE BETWEEN '2023-1-20' AND '2023-1-25';

SELECT * FROM BANG_PHIM;