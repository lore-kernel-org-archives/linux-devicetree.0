Return-Path: <SRS0=v5Ay=EG=free-electrons.com=gregory.clement@kernel.org>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v3 4/7] mtd: nand: use reworked NAND controller driver with Marvell EBU SoCs
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
	<20180109103637.23798-5-miquel.raynal@free-electrons.com>
Date: Thu, 11 Jan 2018 11:16:07 +0100
In-Reply-To: <20180109103637.23798-5-miquel.raynal@free-electrons.com> (Miquel
	Raynal's message of "Tue, 9 Jan 2018 11:36:34 +0100")
Message-ID: <8760887law.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Antoine Tenart <antoine.tenart@free-electron>, Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Willy Tarreau <w@1wt.eu>, Sean Nyekjaer <sean.nyekjaer@prevas.dk>
List-ID: <devicetree@vger.kernel.org>

Hi Miquel,
 
 On mar., janv. 09 2018, Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Choose to compile and embed marvell_nand.c as NAND controller driver
> instead of the legacy pxa3xx_nand.c for platforms with Marvell EBU
> SoCs.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Thanks,

Gregory

> ---
>  arch/arm/configs/mvebu_v7_defconfig | 2 +-
>  arch/arm64/configs/defconfig        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/configs/mvebu_v7_defconfig b/arch/arm/configs/mvebu_v7_defconfig
> index 69553704f2dc..4b6e4fd47e5d 100644
> --- a/arch/arm/configs/mvebu_v7_defconfig
> +++ b/arch/arm/configs/mvebu_v7_defconfig
> @@ -57,7 +57,7 @@ CONFIG_MTD_CFI_STAA=y
>  CONFIG_MTD_PHYSMAP_OF=y
>  CONFIG_MTD_M25P80=y
>  CONFIG_MTD_NAND=y
> -CONFIG_MTD_NAND_PXA3xx=y
> +CONFIG_MTD_NAND_MARVELL=y
>  CONFIG_MTD_SPI_NOR=y
>  CONFIG_SRAM=y
>  CONFIG_MTD_UBI=y
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6356c6da34ea..b20fa9b31efe 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -161,7 +161,7 @@ CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_M25P80=y
>  CONFIG_MTD_NAND=y
>  CONFIG_MTD_NAND_DENALI_DT=y
> -CONFIG_MTD_NAND_PXA3xx=y
> +CONFIG_MTD_NAND_MARVELL=y
>  CONFIG_MTD_SPI_NOR=y
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_BLK_DEV_NBD=m
> -- 
> 2.11.0
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
