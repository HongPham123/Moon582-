USE [master]
GO
/****** Object:  Database [BOOKSTORE_DATABASE]    Script Date: 5/22/2019 10:06:45 PM ******/
CREATE DATABASE [BOOKSTORE_DATABASE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BOOKSTORE_DATABASE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BOOKSTORE_DATABASE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BOOKSTORE_DATABASE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BOOKSTORE_DATABASE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BOOKSTORE_DATABASE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET ARITHABORT OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET RECOVERY FULL 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET  MULTI_USER 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BOOKSTORE_DATABASE', N'ON'
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET QUERY_STORE = OFF
GO
USE [BOOKSTORE_DATABASE]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BOOKSTORE_DATABASE]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 5/22/2019 10:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Author_ID] [int] IDENTITY(1,1) NOT NULL,
	[authorName] [nvarchar](150) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Author_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors_Books]    Script Date: 5/22/2019 10:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors_Books](
	[Author_ID] [int] NOT NULL,
	[Book_ID] [int] NOT NULL,
	[bookRole] [varchar](150) NULL,
 CONSTRAINT [PK_Author_Book] PRIMARY KEY CLUSTERED 
(
	[Author_ID] ASC,
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 5/22/2019 10:06:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[Bill_ID] [int] IDENTITY(1,1) NOT NULL,
	[date_set] [datetime] NULL,
	[customerName] [nvarchar](150) NULL,
	[customerAddress] [nvarchar](150) NULL,
	[phoneNumber] [nchar](10) NULL,
	[isPayment] [bit] NULL,
	[isDelivered] [bit] NULL,
	[delivery_date] [datetime] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 5/22/2019 10:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Book_ID] [int] IDENTITY(1,1) NOT NULL,
	[isbn] [varchar](max) NULL,
	[bookName] [nvarchar](200) NULL,
	[description] [nvarchar](max) NULL,
	[price] [int] NULL,
	[image] [varchar](200) NULL,
	[quantityExists] [int] NULL,
	[sellNumber] [int] NULL,
	[saleOffPrice] [int] NULL,
	[statusSaleOff] [bit] NULL,
	[category_id] [int] NULL,
	[language_id] [int] NULL,
	[supplier_id] [int] NULL,
	[star] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 5/22/2019 10:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](150) NULL,
	[categoryNameForeign] [nvarchar](150) NULL,
	[theme_id] [int] NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/22/2019 10:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [nvarchar](100) NULL,
	[customerEmail] [varchar](150) NULL,
	[customerPhone] [varchar](10) NULL,
	[customerAddress] [nvarchar](200) NULL,
	[sex] [bit] NULL,
	[dayOfBirth] [date] NULL,
	[password] [varchar](max) NULL,
	[avatar] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailBills]    Script Date: 5/22/2019 10:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailBills](
	[Bill_ID] [int] NOT NULL,
	[Book_ID] [int] NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_DetailBills] PRIMARY KEY CLUSTERED 
(
	[Bill_ID] ASC,
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 5/22/2019 10:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Language_ID] [int] IDENTITY(1,1) NOT NULL,
	[languageName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Language_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 5/22/2019 10:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[Promotion_ID] [nchar](10) NOT NULL,
	[date_from] [datetime] NULL,
	[date_to] [datetime] NULL,
	[contentPromotion] [ntext] NULL,
	[percentPromotion] [int] NULL,
 CONSTRAINT [PK_Promotion] PRIMARY KEY CLUSTERED 
(
	[Promotion_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/22/2019 10:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 5/22/2019 10:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Supplier_ID] [int] IDENTITY(1,1) NOT NULL,
	[supplierName] [nvarchar](150) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Themes]    Script Date: 5/22/2019 10:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Themes](
	[Theme_ID] [int] IDENTITY(1,1) NOT NULL,
	[themeName] [nvarchar](50) NULL,
	[themeNameForeign] [nvarchar](50) NULL,
	[description] [ntext] NULL,
 CONSTRAINT [PK_Themes] PRIMARY KEY CLUSTERED 
(
	[Theme_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/22/2019 10:06:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](100) NULL,
	[password] [varchar](max) NULL,
	[avatar] [varchar](50) NULL,
	[email] [varchar](150) NULL,
	[phoneNumber] [varchar](10) NULL,
	[sex] [bit] NULL,
	[address] [nvarchar](150) NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([Bill_ID], [date_set], [customerName], [customerAddress], [phoneNumber], [isPayment], [isDelivered], [delivery_date], [total]) VALUES (11, CAST(N'2019-05-12T23:45:22.530' AS DateTime), N'Nguyễn Công Thành', N'Bình Dương', N'0123456789', 1, 0, NULL, 17)
INSERT [dbo].[Bills] ([Bill_ID], [date_set], [customerName], [customerAddress], [phoneNumber], [isPayment], [isDelivered], [delivery_date], [total]) VALUES (12, CAST(N'2019-05-12T23:46:54.520' AS DateTime), N'Nguyễn Công Thành', N'Bình Dương', N'0123456789', 1, 0, NULL, 11)
INSERT [dbo].[Bills] ([Bill_ID], [date_set], [customerName], [customerAddress], [phoneNumber], [isPayment], [isDelivered], [delivery_date], [total]) VALUES (13, CAST(N'2019-05-13T05:47:17.777' AS DateTime), N'Nguyễn Công Thành', N'Bình Dương', N'0123456789', 1, 0, NULL, 11)
INSERT [dbo].[Bills] ([Bill_ID], [date_set], [customerName], [customerAddress], [phoneNumber], [isPayment], [isDelivered], [delivery_date], [total]) VALUES (14, CAST(N'2019-05-13T09:29:02.240' AS DateTime), N'Nguyễn Công Thành', N'binh duong', N'0971508895', 1, 0, NULL, 22)
INSERT [dbo].[Bills] ([Bill_ID], [date_set], [customerName], [customerAddress], [phoneNumber], [isPayment], [isDelivered], [delivery_date], [total]) VALUES (15, CAST(N'2019-05-16T21:17:06.770' AS DateTime), N'Nguyễn Công Thành', N'Bình Dương', N'0123456789', 1, 0, NULL, 22)
INSERT [dbo].[Bills] ([Bill_ID], [date_set], [customerName], [customerAddress], [phoneNumber], [isPayment], [isDelivered], [delivery_date], [total]) VALUES (17, CAST(N'2019-05-16T21:26:53.957' AS DateTime), N'Nguyễn Công Thành', N'Bình Dương', N'0123456789', 1, 0, NULL, 9)
SET IDENTITY_INSERT [dbo].[Bills] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (1, NULL, N'Nhà Giả Kim', N'Nhà Giả Kim (Tái Bản 2017)

NHÀ GIẢ KIM là cuốn sách được in nhiều nhất chỉ sau Kinh Thánh. Cuốn sách của Paulo Coelho có sự hấp dẫn ra sao khiến độc giả không chỉ các xứ dùng ngôn ngữ Bồ Đào Nha mà các ngôn ngữ khác say mê như vậy?

Tiểu thuyết NHÀ GIẢ KIM của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.

“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.” - Trích NHÀ GIẢ KIM', 6, N'8935235213746.jpg', 10, 1, 3, 1, 1, 1, 1, 4)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (2, NULL, N'DEMIAN: CÂU CHUYỆN TUỔI TRẺ CỦA EMIL SINCLAIR', N'Demian: Câu Chuyện Tuổi Trẻ Của Emil Sinclair - Tặng Kèm Vỏ Bọc Sách + Booklet Quotes Demian (Số Lượng Có Hạn)

"Chú chim non đấu tranh thoát khỏi quả trứng.

Quả trứng là thế giới.

Ai muốn được sinh ra,

Trước hết, phải phá hủy một thế giới"

Giống như chúng ta, nếu muốn trưởng thành, nếu muốn được sống thật sự thì phải dám bước ra khỏi ngưỡng cửa an toàn của bản thân.

Câu chuyện kể về Emil Sinclair, một cậu bé được sinh ra trong một gia đình trung lưu và bước tới ngưỡng tuổi trưởng thành. Cậu có những nhận thức đầu tiên về sự tồn tại của “hai thế giới”, đang băn khoăn giữa ánh sáng và bóng tối, giữa thiện và ác. Đây là câu chuyện của một người trẻ, đại diện cho biết bao người trẻ tuổi khác, bước lên hành trình đi tìm bản ngã của mình.

“DEMIAN: CÂU CHUYỆN TUỔI TRẺ CỦA EMIL SINCLAIR” là cuốn sách khơi gợi cảm hứng cho MV ''Blood, Sweat & Tears'' và còn là mạch nguồn xuyên suốt album ''WINGS'' của BTS. Trong chương trình Culture Plaza của đài KBS vào ngày 17/10/2016 các thành viên BTS đã chia sẻ suy nghĩ về tác phẩm này. 

RM: “Chúng tôi cảm thấy có những nét tương đồng giữa cuốn sách và những điều mà nhóm muốn nhắn gửi nên chúng tôi đã sử dụng rất nhiều những chất liệu của tác phẩm trong jacket photos và MV”.

Và suốt từ năm 2016 đến 2018, BTS đã liên tiếp phát hành chuỗi Album “Love Yourself” – tất cả đều được lấy cảm hứng từ cuốn sách này DEMIAN: CÂU CHUYỆN TUỔI TRẺ CỦA EMIL SINCLAIR”', 5, N'untitled-1_28_6.jpg', 10, 1, 3, 1, 1, 1, 1, 4)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (3, NULL, N'999 LÁ THƯ GỬI CHO CHÍNH MÌNH', N'999 Lá Thư Gửi Cho Chính Mình – Mong Bạn Trở Thành Phiên Bản Hoàn Hảo Nhất

“999 lá thư gửi cho chính mình” là một tác phẩm đặc biệt đầy cảm hứng đến từ tác giả văn học mạng nổi tiếng Miêu Công Tử, mang một màu sắc riêng biệt qua những lời thư nhỏ nhắn nhủ đến người đọc về giá trị cuộc sống, tình yêu, tuổi trẻ, tương lai… v.v.. đã làm lay động trái tim của hàng vạn độc giả trẻ. Cầm trên tay cuốn sách “999 lá thư gửi cho chính mình” – bạn sẽ hiểu rằng: tuổi trẻ của chúng ta dù có mong manh đến đâu thì cũng sẽ thành công vượt qua mọi khó khăn một cách mạnh mẽ ngoài sức tưởng tượng. Một ngày nào đó, bạn sẽ cảm nhận được hạnh phúc, tự tin của chính bản thân và học được cách mỉm cười trước những nỗi đau của quá khứ. Bạn sẽ biết cách nói lời cảm ơn với những ai đã rời bỏ bạn, hiểu ra rằng họ không phải người thích hợp để cùng đồng hành với bạn trên đoạn đường chông gai đi tới tương lai. Đôi lúc bạn có thể yếu đuối mỏi mệt rơi nước mắt, thế nhưng khi bất chợt nhìn lại, bạn sẽ thấy thì ra mình đã rất mạnh mẽ, dũng cảm đi hết cả một quãng đường dài.

“999 lá thư gửi cho chính mình” – Mong bạn trở thành phiên bản hoàn hảo nhất. Cái gọi là vẻ đẹp nội tâm luôn luôn tốt hơn vẻ bề ngoài hào nhoáng, hy vọng bạn sẽ mãi luôn kiên cường, dũng cảm đứng ở nơi ánh sáng chiếu rọi, sống tốt một cuộc sống mà mình hằng mong ước.', 10, N'b1_13.jpg', 10, 1, 1, 1, 1, 1, 2, 4)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (4, NULL, N'KHI NHÌN THẤY LỜI NÓI DỐI TÔI ĐÃ YÊU EM THẬT LÒNG ', N'Khi Nhìn Thấy Lời Nói Dối Tôi Đã Yêu Em Thật Lòng - Tặng kèm 1 Bookmark (Số Lượng Có Hạn)

Từ khi còn nhỏ, Fujikura Hijiri đã có năng lực nhìn thấy ánh sáng rực rỡ tỏa ra từ những người cậu yêu quý. Tuy nhiên, đó lại là sự khởi đầu cho một cuộc sống cô độc, luôn trốn tránh với mọi người của cậu - bởi vì đó là ánh sáng của sự dối trá.

Sự xuất hiện của Futaba Haruka - một nữ sinh mới chuyển đến, một cô gái trung thực, nhiệt tình và rất yêu mèo đã làm thay đổi hoàn toàn cuộc sống u ám đó, giúp cậu có đủ can đảm để đối diện với sự thật đằng sau thứ ánh sáng giả tạo ấy, tìm lại được niềm tin và tình yêu đã bị đánh mất từ lâu.

Thế nhưng, chính cô gái ấy cũng đang tỏa ra thứ ánh sáng lấp lánh đẹp đẽ đó…', 10, N'untitled-8_3_20.jpg', 10, 1, 3, 1, 1, 1, 1, 5)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (5, NULL, N'CHUYỆN TÌNH THANH XUÂN BI HÀI CỦA TÔI QUẢ NHIÊN LÀ SAI LẦM - TẬP 6', N'Chuyện tình thanh xuân bi hài của tôi quả nhiên là sai lầm. (tên gốc: Yahari Ore no Seishun Rabukome wa Machigatteiru., gọi tắt là Oregairu), là một trong những series light novel ăn khách nhất trong vòng 20 năm trở lại đây, bộ truyện được viết bởi tác giả trẻ Wataru WATARI, do họa sĩ Ponkan8 vẽ minh họa và được xuất bản bởi NXB nổi tiếng Shogakukan.

Chuyện tình thanh xuân bi hài của tôi quả nhiên là sai lầm. đã dành giải light novel hay nhất của bảng xếp hạng uy tín Kono light novel ga sugoi! trong 3 năm liên tiếp là 2014, 2015 và 2016. Bên cạnh đó, nam chính và nữ chính của series này là Hachiman và Yokin oshita cũng đoạt giải nam nữ chính được yêu thích nhất trong các năm đó. Họa sĩ minh họa Ponkan8 với những bức tranh minh họa đẹp và sinh động của mình cũng được bình chọn là họa sĩ minh họa được yêu thích nhất trong năm 2015. Đến thời điểm hiện tại, series đã phát hành được 12 tập, nhưng số sách bán ra đã vượt mốc 7 triệu bản, một con số mà những đầu sách nổi tiếng như Cô gái văn chương hay Sói & Gia vị cũng chưa từng làm được.

Lễ Hội văn hóa.

Cách để trốn được các công việc phiền phức là… bị gọi cũng không trả lời, thể hiện ra mặt sự khó chịu của mình!? Hachiman sử dụng toàn bộ kỹ năng của một kẻ cô đơn để trốn tránh công việc chuẩn bị lễ hội.

Tuy nhiên, cậu đã bị bắt làm thành viên của ban tổ chức lễ hội trong một lần trốn tiết sinh hoạt.

Học kỳ mới đã bắt đầu, thế nhưng Hachiman có gì đó hơi lạ lùng. Cả trong lớp lẫn câu lạc bộ… Thắc mắc của cậu đối với Yukinoshita vẫn còn đó, thế nhưng cậu lại không đặt câu hỏi.

Yukinoshita và Hachiman, cả hai người không thể tiến lên phía trước cũng như không thể quay đầu lại. Liệu sẽ có sự thay đổi nào cho khoảng cách vẫn không thể rút ngắn này không?

Đây là tập 6 của series đang rất được ưa chuộng.', 10, N'untitled-5_1_64.jpg', 10, 1, 3, 1, 2, 1, 1, 5)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (6, NULL, N'CHUYỆN TÌNH THANH XUÂN BI HÀI CỦA TÔI QUẢ NHIÊN LÀ SAI LẦM - TẬP 5', N'Chuyện Tình Thanh Xuân Bi Hài Của Tôi Quả Nhiên Là Sai Lầm - Tập 5 - Tặng Kèm 1 Bookmark + Poster (Số Lượng Có Hạn)
Chuyện tình thanh xuân bi hài của tôi quả nhiên là sai lầm. (tên gốc: Yahari Ore no Seishun Rabukome wa Machigatteiru., gọi tắt là Oregairu), là một trong những series light novel ăn khách nhất trong vòng 20 năm trở lại đây, bộ truyện được viết bởi tác giả trẻ Wataru WATARI, do họa sĩ Ponkan8 vẽ minh họa và được xuất bản bởi NXB nổi tiếng Shogakukan.

Chuyện tình thanh xuân bi hài của tôi quả nhiên là sai lầm. đã dành giải light novel hay nhất của bảng xếp hạng uy tín Kono light novel ga sugoi! trong 3 năm liên tiếp là 2014, 2015 và 2016. Bên cạnh đó, nam chính và nữ chính của series này là Hachiman và Yokin oshita cũng đoạt giải nam nữ chính được yêu thích nhất trong các năm đó. Họa sĩ minh họa Ponkan8 với những bức tranh minh họa đẹp và sinh động của mình cũng được bình chọn là họa sĩ minh họa được yêu thích nhất trong năm 2015. Đến thời điểm hiện tại, series đã phát hành được 12 tập, nhưng số sách bán ra đã vượt mốc 7 triệu bản, một con số mà những đầu sách nổi tiếng như Cô gái văn chương hay Sói & Gia vị cũng chưa từng làm được.

Mùa hè ngắn ngủi mà cảm giác thật đằng đẵng đã sắp kết thúc.

Yui đã tới ghé thăm nhà của Hachiman, nơi cậu sống cùng Komachi.

Thêm nữa, cậu còn nhận được lời mời từ Totsuka, rồi Kawasaki ngỏ ý muốn nhờ vả,…

Và ở lễ hội bắn pháo hoa, cậu gặp lại Haruno – chị gái của Yukino!', 5, N'untitled-4_10_1.jpg', 10, 1, 3, 1, 2, 1, 1, 3)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (7, NULL, N'HIỆP SĨ LƯU BAN - TẬP 6', N'iệp Sĩ Lưu Ban - Tập 6 - Tặng Kèm Bookmark (Số Lượng Có Hạn)

Để đánh bại toàn bộ thành viên Akatsuki, Stella đã đề nghị chuyện trận đấu một chọi bốn đầy bất thường. Ngọn lửa của Công chúa tóc đỏ sau khi thiêu rụi tất cả những kẻ tàn bạo và hủy hoại học viện Hagun đã bùng cháy dữ dội.

Mặt khác, Ikki gặp lại Shinomiya Amane – một thành viên của Akatsuki và nhận ra lí do mình có nỗi ác cảm không thể lí giải đối với đối phương. Cuối cùng năng lực thật sự của Amane được làm sáng tỏ, đồng thời bóng tối trong cậu cũng bắt đầu bao phủ lên Đại hội!!?

Cuộc hẹn bí mật với người yêu sau khoảng thời gian xa cách, lời hứa tái chiến đã trao cho địch thủ và sự phục kích bất ngờ. Trận chiến xoay quanh ngôi vị Thất tinh vẫn đang diễn ra! Hiệp sĩ lưu ban 6 những cuộc chạm trán bất ngờ và sự quyết tâm!', 5, N'untitled-1_32_2.jpg', 10, 2, NULL, 0, 2, 1, 2, 2)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (8, NULL, N'HÀNH TRÌNH CỦA ELAINA - TẬP 4', N'<p>H&agrave;nh Tr&igrave;nh Của Elaina - Tập 5 - Tặng K&egrave;m Sổ (Số Lượng C&oacute; Hạn) Ở xứ sở xa x&ocirc;i, c&oacute; một c&ocirc; ph&ugrave; thủy t&ecirc;n Elaina. Nhờ ảnh hưởng sau khi đọc &quot;cuốn s&aacute;ch nọ&quot; từ thuở nhỏ, c&ocirc; đang thực hiện chuyến du h&agrave;nh thật d&agrave;i. Lần n&agrave;y, ch&uacute;ng ta sẽ l&agrave;m quen với một c&ocirc; b&eacute; sống trong lồng chim khổng lồ, c&ocirc; c&ocirc;ng ch&uacute;a lạnh l&ugrave;ng v&agrave; t&ecirc;n si&ecirc;u trộm, hồi tưởng về hai nữ ph&ugrave; thủy trẻ tuổi, gặp lại n&agrave;ng c&ocirc;ng ch&uacute;a ở Vương quốc Cối xay gi&oacute; c&ugrave;ng nữ hiệp sĩ, trải nghiệm h&agrave;nh tr&igrave;nh của hai chị em đến Vương quốc Đưa Tin, nghe c&acirc;u chuyện của c&ocirc; g&aacute;i b&iacute; ẩn thấy trước tương lai, v&agrave; cuối c&ugrave;ng được gặp lại người thầy đ&aacute;ng k&iacute;nh v&agrave; hai c&ocirc; b&eacute; t&oacute;c đen nhiều duy&ecirc;n ngộ. C&oacute; những cuộc gặp gỡ mới mẻ, cũng c&oacute; những lần t&aacute;i ngộ những khu&ocirc;n mặt th&acirc;n quen... Dấn th&acirc;n v&agrave;o c&aacute;c vụ &aacute;n kỳ lạ, được tao ngộ lẫn ly biệt c&ugrave;ng những người th&acirc;n y&ecirc;u với c&ocirc; chưa bao giờ l&agrave; nh&agrave;m ch&aacute;n. &ldquo;Em cũng vậy, cũng rất y&ecirc;u qu&yacute; c&ocirc;... v&agrave; tất cả mọi người.&rdquo; Quyển nhật k&yacute; du h&agrave;nh đầy huyền b&iacute; v&agrave; hấp dẫn của Elaina, nay lại bước sang trang mới.</p>
', 6, N'untitled-7_5_33.jpg', 10, 2, NULL, 0, 1, 1, 1, 4)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (9, NULL, N'CON GÁI HIỆN ĐẠI ĐỪNG TỰ HẠI MÌNH', N'Con Gái Hiện Đại Đừng Tự Hại Mình - Gái Không Vì Mình Trời Tru Đất Diệt

Là con gái, nói chung là khổ.

Nhạy cảm, dễ tổn thương, hay suy nghĩ... công việc hay tình cảm đều sẽ khó khăn hơn cánh đàn ông. Vì con gái, hầu như là sống bằng tình cảm. Lí trí mạnh mẽ đến đâu, cũng khó lòng thắng nổi cảm xúc. Thành ra, cuộc sống đôi khi lại vất vả chỉ vì hay khổ tâm.

Đã khổ đủ đường như vậy rồi, cho nên cái gì bớt được thì bớt.

Con gái, nhất định phải sống làm sao cho bản thân luôn cảm thấy nhẹ nhàng, thoải mái nhất. Sống cho mình, vì mình, và đặt bản thân mình lên đầu tiên.

Đừng bao giờ vì người khác mà đánh mất cái tôi, quen thói dựa dẫm, ỉ lại để rồi một ngày người ta không còn bên cạnh nữa lại thành gậy ông đập lưng ông, tự mình hại mình.

Cái cây ở giữa rừng cây, khi đứng một mình, gặp mưa bão, kiểu gì cũng đổ, vì không có chỗ để dựa dẫm . Nhưng cái cây đứng bên vệ đường, đã quen sóng gió, thì sống ở đâu, cũng dễ dàng thích nghi.

Là con gái, muốn cuộc sống không gặp phải nhiều thất vọng. Thì nhất định phải giữ cho mình một cái đầu lạnh, đừng quá phụ thuộc, đừng quá bi lụy, đừng quá dễ dãi. Phải tỉnh táo trước mọi hứa hẹn và ngọt ngào. Cái gì cũng phải nghĩ cho mình đầu tiên. Nên nhớ, chẳng gì là mãi mãi, người duy nhất không bao giờ phản bội chúng ta chính là chúng ta. Là con gái, nhất là con gái hiện đại, đừng bao giờ cho phép bản thân mình quên đi điều đó.

Con gái hiện đại, đừng tự hại mình !', 6, N'bia_con-gai-hien-dai-page-001.jpg', 10, 3, 3, 1, 3, 1, 1, 4)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (10, NULL, N'ANH ĐÃ QUÊN EM CHƯA?', N'Anh Đã Quên Em Chưa?

Này cô gái, em nghĩ mình sẽ mất bao lâu để quên người ấy sau khi chia tay?

Một tuần, một tháng, một năm, hay không bao giờ?

Thực ra, chưa có một ai trên thế gian này có thể quên đi bóng hình của người mình đã từng yêu thương. Chỉ là con người ta, qua thời gian đều sẽ học được cách để thôi nhớ một người.

Em phải chấp nhận rằng dù yêu đến thế, nhưng khi kỳ hạn của một mối quan hệ đã tới vạch đích thì nhớ nhung hay níu kéo cũng chỉ là chuyện thừa thãi. Chia tay rồi, em có khổ đau đến mấy thì người kia cũng đâu còn bận tâm nữa?

Vậy nên cô gái à, em hãy thôi trách cớ người cũ, thôi mong chờ chuyện xưa. Can đảm mà xếp gọn lại những cảm xúc của mình vào một chiếc hộp, khóa thật chặt, cất thật sâu, không để lòng mình buồn về những điều không nên.

Ai cũng hiểu chia ly chưa bao giờ là chuyện dễ dàng, kỷ niệm cũng không phải chuyện người ta muốn là có thể xóa đi. Nhưng em hãy tin rằng thời gian luôn là liều thuốc hữu hiệu nhất, sẽ làm em quên đi những day dứt khôn nguôi. Thời gian như nước chảy mây trôi, là bàn tay dịu dàng lau nước mắt rồi dạy em cách sống một mình thật tốt. Cho tới ngày gặp được một người xứng đáng để em có thể thêm một lần tin tưởng mà trao gửi yêu thương.', 6, N'b_a-anh-_-qu_n-em-ch_a.jpg', 10, 4, NULL, 0, 3, 1, 2, 4)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (11, NULL, N'KPI - THƯỚC ĐO MỤC TIÊU TRỌNG YẾU', N'KPI - Thước Đo Mục Tiêu Trọng Yếu

“Cái gì không đo được thì cũng không quản lý được;

Cái gì không đo được thì cũng không cải tiến được.” – Peter Drucker (Cha đẻ Quản trị Kinh doanh hiện đại)

Nhiều nghiên cứu trên khắp thế giới, trong đó có nghiên cứu của Robert Kaplan, Ram Charan, The Balanced Scorecard Institute và Tổ chức FranklinCovey, đã chỉ ra rằng:“70% thất bại của các doanh nghiệp ngày nay không phải là do chiến lược kém hay tầm nhìn sai, mà là do năng lực thực thi và hệ thống triển khai kém hiệu quả.”

Con số trên cho thấy công tác đo lường hiệu suất công việc (Performance Management) đang được thực hiện thiếu hiệu quả trong rất nhiều tổ chức trên toàn thế giới, từ các tập đoàn đa quốc gia, cơ quan chính phủ cho đến các tổ chức phi lợi nhuận. Họ đã và đang áp dụng các thước đo mục tiêu vốn được đặt ra mà không có bất kỳ sự liên quan nào đến các nhân tố thành công quan trọng của tổ chức mình.

Vậy làm sao để có thể sử dụng các thước đo mục tiêu một cách hiệu quả? KPI – Thước đo mục tiêu trọng yếu (Key Performance Indicator) chính là cuốn sách sẽ cung cấp công cụ và phương pháp để xây dựng hệ thống KPI hiệu quả dành cho mọi cá nhân, bộ phận và tổ chức.', 7, N'8d3070ed8563d2543ae310c6c.jpg', 10, 3, 3, 1, 4, 1, 1, 4)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (12, NULL, N'ĐỌC VỊ BẤT KỲ AI - ÁP DỤNG TRONG DOANH NGHIỆP', N'Đọc Vị Bất Kỳ Ai – Áp Dụng Trong Doanh Nghiệp

(Tái bản từ tựa Làm sếp không chỉ là nghệ thuật)

Phần lớn các cuốn sách kinh doanh – dù nói về quản lý, lãnh đạo, phát triển cá nhân hay dịch vụ khách hàng – đều đưa ra những ý tưởng và lời khuyên tốt đẹp để bạn có thể hành động sáng suốt, khôn ngoan như: Mỉm cười và tỏ ra gần gũi, Lắng nghe trước khi phản ứng và Nếu bạn thất bại trong việc lập kế hoạch, hãy lập kế hoạch cho việc thất bại. Đây là những lời khuyên tốt và hữu dụng. Tuy nhiên, trong thị trường cạnh tranh khốc liệt ngày nay, người kinh doanh cần thứ gì đó thiết thực và có sức thuyết phục mạnh mẽ hơn so với những lời trích dẫn hay triết lý đơn thuần.

Chẳng hạn như, bạn đã biết được lòng trung thành của khách hàng và nhân viên quan trọng đến mức nào. Vậy làm thế nào để có được một chiến lược tâm lý tốt, có thể giúp bạn tránh được việc mọi người đi khỏi công ty bạn? Rất nhiều cuốn sách đã đề cập đến một quan niệm vốn dĩ đã thành quy ước, rằng khách hàng là thượng đế, nhưng liệu bạn có muốn biết được một kỹ thuật hiệu quả và rõ ràng có thể giúp bạn tìm lại được những khách hàng đã mất? Tất nhiên, khuyến khích nhân viên và gây ấn tượng tốt với khách hàng là việc làm cần thiết, luôn cần thực hiện nhưng chắc chắn là khả năng của bạn sẽ được nâng lên một tầm cao mới khi bạn khám phá được cách khai thác sức mạnh của nguồn cảm hứng bất tận trong con người mình, theo ý muốn.', 3, N'thb_-_c_v_b_t_k_ai.jpg', 10, 2, NULL, 0, 4, 1, 2, 5)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (13, NULL, N'XÂY DỰNG THƯƠNG HIỆU CÁ NHÂN TRONG KỶ NGUYÊN 4.0', N'Xây Dựng Thương Hiệu Cá Nhân Trong Kỷ Nguyên 4.0

Tại sao cần xây dựng thương hiệu cá nhân?

Xây dựng thương hiệu cá nhân là một công cụ truyền thông hiệu quả vì nó sẽ gửi một thông điệp nhất quán rõ ràng về bạn là ai và những gì bạn có thể làm. Một thương hiệu cá nhân đúng chất và mạnh mẽ sẽ giúp bạn trở nên nổi tiếng với những điều mà bạn làm tốt nhất, giúp bạn khác biệt với tất cả mọi người khác, và có thể xác định vị trí của bạn như một chuyên gia trong ngành.

Influencer – Xây dựng thương hiệu cá nhân trong kỷ nguyên 4.0 sẽ cho bạn nền tảng để thành công trong thế giới của Marketing bằng cách tự tạo dựng thương hiệu cá nhân của chính mình. Cho dù bạn đang xây dựng cộng đồng của mình, học cách tạo dựng cá tính cho thương hiệu của mình, bạn giờ đã chuẩn bị để có thể vượt qua bất kể chướng ngại vật nào cản đường bạn.

Hãy tiến lên, chinh phục và sáng tạo!

Hãy trở nên thật khác biệt bằng chính cá tính của mình!', 3, N'bia1_xay-dung-thuong-hieu-ca-nhan-.jpg', 10, 1, 3, 1, 5, 1, 1, 5)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (14, NULL, N'BÍ QUYẾT TRỞ THÀNH SIÊU SAO BÁN HÀNG QUA ĐIỆN THOẠI', N'Bán hàng là một nghệ thuật. Mà bán được hàng qua điện thoại có thể nói là trên cả nghệ thuật. Trong mọi cuộc điện thoại, bạn chỉ có 8 giây gây chú ý để khách hàng không cúp máy và 4 phút để chốt một cuộc hẹn. Bởi rõ ràng bạn đang gặp rất nhiều bất lợi như không được gặp trực tiếp khách hàng để trình bày chi tiết, khó biểu cảm sự chân thành bằng ngôn ngữ cơ thể để khách hàng tin, một số khách hàng có tâm lý “dị ứng” với những người tiếp thị qua điện thoại vì nhiều lý do. 

Vậy bạn phải làm sao? 

Hãy đọc Telesales – Tiếp thị bán hàng qua điện thoại. Cuốn sách này không những chỉ bạn cách tìm kiếm, xác định đối tượng khách hàng, thấu hiểu nhu cầu của họ mà còn giúp bạn lên kịch bản kỹ lưỡng trước để dễ dàng chốt được hẹn, xử trí khi bị từ chối và tránh những sai lầm trong nghiệp vụ… 

Một nhân viên “sơ cấp” thường chỉ dừng lại ở mức độ bán được thứ khách hàng cần. Nhưng một nhân viên xuất sắc còn có thể bán được sản phẩm, dịch vụ mà khách hàng chưa có nhu cầu. Và cuốn sách này sẽ chỉ bạn điều đó. Một khi có thể bán được hàng qua điện thoại, tương lai, bạn có thể bán được bất cứ gì với bất cứ hình thức nào. ', 3, N'image_180407.jpg', 10, 1, 3, 1, 5, 1, 2, 3)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (15, NULL, N'TIẾP THỊ 4.0 - DỊCH CHUYỂN TỪ TRUYỀN THỐNG SANG CÔNG NGHỆ SỐ', N'iếp Thị 4.0 - Dịch Chuyển Từ Truyền Thống Sang Công Nghệ Số

Quyển cẩm nang vô cùng cần thiết cho những người làm tiếp thị trong thời đại số. Được viết bởi cha đẻ ngành tiếp thị hiện đại, cùng hai đồng tác giả là lãnh đạo của công ty MarkPlus, quyển sách sẽ giúp bạn lèo lái thế giới không ngừng kết nối và khách hàng không ngừng thay đổi để có được nhiều khách hàng hơn, xây dựng thương hiệu hiệu quả hơn, và cuối cùng kinh doanh thành công hơn. Ngày nay khách hàng không có nhiều thời gian và sự chú ý dành cho thương hiệu của bạn – và họ còn bị bao quanh bởi vô số các chọn lựa. Bạn phải tách khỏi đám đông, phải nổi trội, để gây sự chú ý và truyền đạt thông điệp mà khách hàng muốn nghe. “Tiếp thị 4.0” tận dụng tâm lý thay đổi của khách hàng để tiếp cận nhiều khách hàng hơn và khiến họ gắn bó với thương hiệu hơn bao giờ hết.  Quyển sách cho bạn kiến thức sâu rộng để bạn thành công trong thế giới tiếp thị ngày nay: Khám phá những nguyên tắc mới trong tiếp thị; Nổi bật và tạo ra những khoảnh khắc WOW; Xây dựng nền tảng khách hàng trung thành và có tiếng nói; và Biết ai sẽ là người định hình tương lai của các chọn lựa của khách hàng…
Quyển sách gồm ba phần, với các nội dung:
“Phần đầu tiên của cuốn sách là kết quả quan sát của chúng tôi về thế giới chúng ta đang sinh sống. Chúng tôi bắt đầu bằng cách bám sát ba thay đổi lớn đang định hình thế giới chúng ta. Chúng tôi đi vào chi tiết hơn để khám phá xem khả năng kết nối đã thay đổi cơ bản cuộc sống của con người như thế nào. Không chỉ dừng lại ở đó, chúng tôi đi sâu hơn vào một số nhóm tiểu văn hóa chính trong kỷ nguyên số - đó là giới trẻ, phụ nữ và công dân mạng, hứa hẹn sẽ là nền tảng cho một thế hệ khách hàng mới.
Phần thứ hai cũng là phần trọng tâm của cuốn sách, sẽ thảo luận về cách người làm tiếp thị có thể gia tăng hiệu suất bằng cách tìm hiểu về hành trình khách hàng trong kỷ nguyên số. Phần này sẽ giới thiệu một hệ thống mới các chỉ số tiếp thị và cách nhìn hoàn toàn mới về  cách đánh giá hoạt động tiếp thị của chúng ta. Chúng tôi cũng đào sâu hơn vào một số ngành quan trọng và cách áp dụng những ý tưởng từ “Tiếp thị 4.0” vào các ngành này.', 3, N'image_182714.jpg', 10, 1, NULL, 0, 5, 1, 2, 3)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (17, NULL, N'NGHĨ GIÀU & LÀM GIÀU', N'Nghĩ Giàu & Làm Giàu (Tái Bản 2017)

(Tái bản của cuốn "Cách Nghĩ Để Thành Công")

Không có giới hạn nào trong tư duy con người ngoài những giới hạn do chính con người đặt ra.

Nghĩ Giàu & Làm Giàu là cuốn sách đầu tiên đưa ra triết lý thành đạt - một triết lý đầy đủ và toàn diện về thành công của cá nhân, đồng thời cung cấp cho bạn phương pháp để tạo ra kế hoạch sơ bộ và chi tiết để đạt được thành công đó.

Được viết ra từ vô số những câu chuyện có thật của những người vĩ đại như Edison - nhà phát minh lỗi lạc mà thời gian rèn luyện trong trường học chỉ... vỏn vẹn 3 tháng, như Henry Ford - người bị coi là không có học vấn nhưng đã trở thành ông trùm trong nền công nghiệp xe hơi với một gia tài kết xù..., tác phẩm có một sức thuyết phục và lay động rất lớn,. Napoleon Hill đã dành hầu như toàn bộ thời gian và công sức trong suốt gần ba mươi năm để phỏng vấn hơn 500 người nổi tiếng và thành công nhất trong nhiều lĩnh vực khác nhau, cùng hàng ngàn doanh nhân khác - cả những kẻ thất bại và những người thành công.

Với hơn 60 triệu bản đã được bán trong 70 năm kể từ khi ra đời, những đúc kết về thành công của Napoleon Hill đến nay vẫn không hề bị lỗi thời, ngược lại, thời gian chính là minh chứng sống động cho tính đúng đắn của những bí quyết mà ông chia sẻ.

', 3, N'8935086844342.jpg', 10, 1, 3, 1, 6, 1, 2, 2)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (18, NULL, N'SÁCH LƯỢC ĐẦU TƯ CỦA W. BUFFETT', N'Được xem là nhà đầu tư thành công nhất thế giới, là cổ đông lớn nhất kiêm giám đốc hãng Berkshire Hathaway, người giàu thứ hai thế giới sau Bill Gates với tài sản hơn 50 tỉ USD. Nổi tiếng do sự kiên định trong triết lý đầu tư, sự nghiệp của Warren Buffett để lại muôn vàn bài học kinh doanh quý báu…

Cuốn sách này tổng kết:

+ Những tinh hoa trong tư tưởng của Buffett

+ Chiến lược đầu tư của Buffett

+ Sách lược thực hiện của Buffett

+ Buffett phân tích Báo cáo tài chính

+ Năm dự án đầu tư kinh điển của Buffett', 4, N'sach-luoc-dau-tu-cua-w.jpg', 10, 1, NULL, 0, 6, 1, 1, 1)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (19, NULL, N'KHÔNG BAO GIỜ LÀ THẤT BẠI! TẤT CẢ LÀ THỬ THÁCH ', N'Không Bao Giờ Là Thất Bại! Tất Cả Là Thử Thách (Tái Bản 2019)

Người viết cuốn tự truyện độc đáo này là một con người kiên định, với ý chí tự lập của mình dám đương đầu với mọi thử thách, trở ngại trong cuộc đời, dám nghĩ dám làm, dám ước mơ và dám vượt qua những khó khăn thử thách để thực hiện những ước mơ và dự định tưởng chừng không thể của mình.

Đây là một minh chứng sống về ý chí và năng lực không giới hạn của con người khi đã có lòng nhiệt huyết, say mê - một người đã xem những thất bại - cho dù là thất bại cay đắng nhất - không phải là thất bại - mà chỉ là thử thách của cuộc sống tôi rèn bản lĩnh của chính mình. Tác giả và nhân vật trong cuốn tự truyện này là một người Hàn Quốc nổi tiếng: Chung Ju Yung - người đã sáng lập và là cố chủ tịch của tập đoàn Huyndai.

Qua từng trang sách chúng ta sẽ cùng khám phá cuộc đời thăng trầm rất thực và tính cách thú vị của cậu thanh niên vùng nông thôn với ước mơ lớn từ hai bàn tay trắng đã trở thành một trong những doanh nhân nổi tiếng nhất trong lịch sử các tập đoàn công nghiệp hàng đầu Hàn Quốc và châu Á.

"Một người không tin là có vận xấu, người đó sẽ không có vận xấu. Mọi thứ đều quân bình, vận may rủi đều đến với con người như nhau.Quan trọng nhất là phải nỗ lực, nỗ lực không ngừng và biết chớp thời cơ."', 9, N'untitled_1_2.jpg', 10, 1, NULL, 0, 6, 1, 1, 1)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (20, NULL, N'GIÁO TRÌNH C++ VÀ LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG', N'Giáo Trình C++ Và Lập Trình Hướng Đối Tượng

Lập trình cấu trúc là phương pháp tổ chức, phân chia chương trình thành các hàm, thủ tục. Chúng được dùng để xử lý dữ liệu nhưng lại tách rời các cấu trúc dữ liệu.

Lập trình hướng đối tượng dựa trên việc tổ chức chương trình thành các lớp. Khác với hàm và thủ tục, lớp là một đơn vị bao gồm cả dữ liệu và các phương thức xử lý.

“Giáo trình C++ & lập trình hướng đối tượng” trình bày một cách hệ thống các khái niệm của lập trình hướng đối tượng được cài đặt trong C++ như lớp, đối tượng, sự thừa kế, tính tương ứng bội và các khả năng mới trong xây dựng, sử dụng hàm như đối tham chiếu, đối mặc định, hàm trùng tên, hàm toán tử. “Giáo trình C++ & lập trình hướng đối tượng” gồm 13 chương và 5 phụ lục được trình bày khá khoa học. Ngoài ra, cuốn sách còn đề cập đến một số vấn đề còn ít được biết đến như cách xây dựng hàm với số đối bất định trong C cũng sẽ được giới thiệu .', 9, N'image_144923.jpg', 10, 2, 3, 1, 7, 1, 1, 3)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (21, NULL, N'LẬP TRÌNH VÀ CUỘC SỐNG', N'Lập Trình Và Cuộc Sống

Jeff Atwood bắt đầu viết blog Coding Horror vào năm 2004, và tin rằng nó đã làm thay đổi cuộc đời của mình. Anh cần một cách để theo dõi sự phát triển của phần mềm theo thời gian-bất cứ điều gì anh ta nghĩ đến hoặc làm việc trên nó. Jeff đã nghiên cứu các chủ đề mà anh cảm thấy thú vị, sau đó ghi lại nghiên cứu của mình bằng một bài đăng trên blog mà anh có thể dễ dàng tìm lại và tham khải sau này. Theo thời gian, ngày càng có nhiều độc giả truy cập blog tìm thấy các bài viết hữu ích, liên quanvaf thú vị. Hiện nay, có khoảng 100.000 độc giả truy cập blog mỗi ngày cũng rất nhiều bình luận và tương tác trên web đó.

Nội dung blog không tập trung quá nhiều vào mặt kỹ thuật mà thiên về khía cạnh con người trong phát triển phần mềm. Bởi vậy mình nghĩ blog Coding Horror là một trong những blog tiêu biểu để các lập trình viên trẻ có thể học hỏi kinh nghiệm về những vấn đề trong phát triển phần mềm của những người đi trước.', 9, N'image_145374.jpg', 10, 2, NULL, 0, 7, 1, 2, 4)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (22, NULL, N'TỰ HỌC NHANH ĐỒ HỌA TRÊN ILLUSTRATOR 8.0 & 9.0', NULL, 9, N'image_106976.jpg', 10, 3, NULL, 0, 8, 1, 2, 5)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (23, NULL, N'TIẾNG ANH TRÊN 5 ĐẦU NGÓN TAY ', N'Tiếng Anh Trên 5 Đầu Ngón Tay (Học Kèm App 4.0)

Chương 1: Mọi vấn đề đều có giải pháp
Lý giải con đường học tiếng Anh đúng từ trong niềm tin và động lực nội thân của người học, cho đến việc tiếp cận một lộ trình học mới mẻ và khoa học nhất để thực sự làm chủ tiếng Anh trong thời gian ngắn.

Chương 2: Học tiếng Anh bắt đầu từ đâu?
Cung cấp 1000 từ vựng tiếng Anh sinh tồn và những câu giao tiếp thiết yếu nhất. Nhờ công nghệ Thực tế ảo VR360, người học sẽ "tắm mình" trong tiếng Anh như người bản ngữ để hấp thụ tiếng Anh cực kỳ nhanh. Video ở bên minh họa bài học dễ nhất (Unit 1: Home & Family) của App E5F.

Chương 3: Logic ngữ âm
Sự thành thạo ngôn ngữ bắt đầu từ âm thanh. Phát âm tốt khiến việc học và làm chủ tiếng Anh trở nên dễ dàng. Chương 3 trang bị cho người học tiếng Anh hệ thống các quy luật logic để dễ dàng phát âm đúng từ vựng, cụm từ và câu với ngữ âm và ngữ điệu chính xác; đồng thời có khả năng suy luận để có thể dần thoát ly khỏi từ điển mà luôn nói đúng.', 9, N'e3561e6694dd71dc19ba7fee9388fed9.jpg', 10, 3, 3, 1, 9, 1, 1, 5)
INSERT [dbo].[Books] ([Book_ID], [isbn], [bookName], [description], [price], [image], [quantityExists], [sellNumber], [saleOffPrice], [statusSaleOff], [category_id], [language_id], [supplier_id], [star]) VALUES (24, NULL, N'TỰ HỌC TIẾNG NHẬT CHO NGƯỜI MỚI BẮT ĐẦU', NULL, 9, N'8935210213532.jpg', 10, 3, NULL, 0, 10, 1, 2, 5)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (1, N'Tiểu thuyết', NULL, 1)
INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (2, N'Light Novel', N'Light Novel', 1)
INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (3, N'Truyện ngắn', N'
short story', 1)
INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (4, N'Quản trị', N'
Business administration', 2)
INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (5, N'Marketing', N'Marketing', 2)
INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (6, N'Nhân vật - Bài học kinh doanh', N'
character business', 2)
INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (7, N'Lập trình', N'program', 3)
INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (8, N'Thiết kế đồ họa', N'
graphic design', 3)
INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (9, N'Tiếng Anh', N'English', 4)
INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (10, N'Tiếng Nhật', N'Japanese', 4)
INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (11, N'Tiếng Hàn', N'Korean', 4)
INSERT [dbo].[Categorys] ([Category_ID], [categoryName], [categoryNameForeign], [theme_id]) VALUES (13, N'2r3', N'wfe', 20)
SET IDENTITY_INSERT [dbo].[Categorys] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Customer_ID], [customerName], [customerEmail], [customerPhone], [customerAddress], [sex], [dayOfBirth], [password], [avatar]) VALUES (1, N'Nguyễn Công Thành', N'congthanh29897@gmail.com', N'0971508895', N'Bình Dương', 1, CAST(N'1997-08-29' AS Date), N'123', NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (11, 3, 1)
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (11, 4, 3)
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (12, 3, 1)
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (12, 4, 1)
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (13, 3, 1)
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (13, 4, 1)
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (14, 2, 2)
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (14, 3, 2)
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (15, 3, 2)
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (15, 4, 2)
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (17, 1, 2)
INSERT [dbo].[DetailBills] ([Bill_ID], [Book_ID], [quantity]) VALUES (17, 13, 1)
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([Language_ID], [languageName]) VALUES (1, N'Tiếng Việt')
INSERT [dbo].[Languages] ([Language_ID], [languageName]) VALUES (2, N'Tiếng Anh')
INSERT [dbo].[Languages] ([Language_ID], [languageName]) VALUES (3, N'Tiếng Nhật')
INSERT [dbo].[Languages] ([Language_ID], [languageName]) VALUES (4, N'Tiếng Hàn')
SET IDENTITY_INSERT [dbo].[Languages] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Role_ID], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Role_ID], [roleName]) VALUES (2, N'Nhân viên bán hàng')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([Supplier_ID], [supplierName], [description]) VALUES (1, N'Nhà sách Thái Hà', NULL)
INSERT [dbo].[Suppliers] ([Supplier_ID], [supplierName], [description]) VALUES (2, N'Nhà sách Nhã Lam', NULL)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET IDENTITY_INSERT [dbo].[Themes] ON 

INSERT [dbo].[Themes] ([Theme_ID], [themeName], [themeNameForeign], [description]) VALUES (1, N'Văn học', N'literary
', N'Chủ đề văn học rất hay có rất nhiều giá trị nhân văn cho người')
INSERT [dbo].[Themes] ([Theme_ID], [themeName], [themeNameForeign], [description]) VALUES (2, N'Kinh tế', N'economy', NULL)
INSERT [dbo].[Themes] ([Theme_ID], [themeName], [themeNameForeign], [description]) VALUES (3, N'Lập trình', N'program', NULL)
INSERT [dbo].[Themes] ([Theme_ID], [themeName], [themeNameForeign], [description]) VALUES (4, N'Ngoại ngữ', N'Foreign Language', NULL)
INSERT [dbo].[Themes] ([Theme_ID], [themeName], [themeNameForeign], [description]) VALUES (19, N'Khoa học', N'Economuc', NULL)
INSERT [dbo].[Themes] ([Theme_ID], [themeName], [themeNameForeign], [description]) VALUES (20, N'ta', N'qad', N'qwdqwd')
SET IDENTITY_INSERT [dbo].[Themes] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([User_ID], [userName], [password], [avatar], [email], [phoneNumber], [sex], [address], [role]) VALUES (1, N'Nguyễn Công Thành', N'123', N'administrator.jpg', N'congthanh29897@gmail.com', N'0971508895', 1, N'Bình Dương', 1)
INSERT [dbo].[Users] ([User_ID], [userName], [password], [avatar], [email], [phoneNumber], [sex], [address], [role]) VALUES (2, N'Lê Văn A', N'456', N'default-avatar.png', N'vana@gmail.com', N'0971508895', 0, N'Hồ Chí Minh', 2)
INSERT [dbo].[Users] ([User_ID], [userName], [password], [avatar], [email], [phoneNumber], [sex], [address], [role]) VALUES (19, N'thanh1', N'BmwzQACRCmddGbSXdUJIGw==', N'images.jpg', N'congthanh298917@gmail.com', N'0971508895', 1, N'binh duong', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Authors_Books]  WITH CHECK ADD  CONSTRAINT [FK_Authors_Books_Authors] FOREIGN KEY([Author_ID])
REFERENCES [dbo].[Authors] ([Author_ID])
GO
ALTER TABLE [dbo].[Authors_Books] CHECK CONSTRAINT [FK_Authors_Books_Authors]
GO
ALTER TABLE [dbo].[Authors_Books]  WITH CHECK ADD  CONSTRAINT [FK_Authors_Books_Books] FOREIGN KEY([Author_ID])
REFERENCES [dbo].[Books] ([Book_ID])
GO
ALTER TABLE [dbo].[Authors_Books] CHECK CONSTRAINT [FK_Authors_Books_Books]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categorys] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categorys] ([Category_ID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categorys]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Languages] FOREIGN KEY([language_id])
REFERENCES [dbo].[Languages] ([Language_ID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Languages]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Suppliers] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers] ([Supplier_ID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Suppliers]
GO
ALTER TABLE [dbo].[Categorys]  WITH CHECK ADD  CONSTRAINT [FK_Categorys_Themes] FOREIGN KEY([theme_id])
REFERENCES [dbo].[Themes] ([Theme_ID])
GO
ALTER TABLE [dbo].[Categorys] CHECK CONSTRAINT [FK_Categorys_Themes]
GO
ALTER TABLE [dbo].[DetailBills]  WITH CHECK ADD  CONSTRAINT [FK_DetailBills_Bills] FOREIGN KEY([Bill_ID])
REFERENCES [dbo].[Bills] ([Bill_ID])
GO
ALTER TABLE [dbo].[DetailBills] CHECK CONSTRAINT [FK_DetailBills_Bills]
GO
ALTER TABLE [dbo].[DetailBills]  WITH CHECK ADD  CONSTRAINT [FK_DetailBills_Books] FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Books] ([Book_ID])
GO
ALTER TABLE [dbo].[DetailBills] CHECK CONSTRAINT [FK_DetailBills_Books]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role])
REFERENCES [dbo].[Roles] ([Role_ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [BOOKSTORE_DATABASE] SET  READ_WRITE 
GO
