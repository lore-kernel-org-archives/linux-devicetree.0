From: Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 5/7] mtd: nand: use Marvell reworked NAND controller
 driver with all platforms
Date: Mon, 12 Feb 2018 11:20:42 +0100
Message-ID: <20180212112042.5b3f758f@bbrezillon>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
        <20180109103637.23798-6-miquel.raynal@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180109103637.23798-6-miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Willy Tarreau <w@1wt.eu>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue,  9 Jan 2018 11:36:35 +0100
Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Actually remove pxa3xx_nand.c to let marvell_nand.c be compiled instead.
> Also change the defconfig files using it as well as some board files
> depending on CONFIG_MTD_NAND_PXA3xx.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/configs/cm_x300_defconfig  |    2 +-
>  arch/arm/configs/pxa3xx_defconfig   |    3 +-
>  arch/arm/configs/pxa_defconfig      |    2 +-
>  arch/arm/configs/raumfeld_defconfig |    2 +-
>  arch/arm/mach-mmp/ttc_dkb.c         |    4 +-
>  arch/arm/mach-pxa/cm-x300.c         |    2 +-
>  arch/arm/mach-pxa/colibri-pxa3xx.c  |    2 +-
>  arch/arm/mach-pxa/colibri.h         |    2 +-
>  arch/arm/mach-pxa/littleton.c       |    4 +-
>  arch/arm/mach-pxa/mxm8x10.c         |    4 +-
>  arch/arm/mach-pxa/zylonite.c        |    4 +-
>  drivers/mtd/nand/Kconfig            |   11 -
>  drivers/mtd/nand/Makefile           |    1 -
>  drivers/mtd/nand/pxa3xx_nand.c      | 2104 -----------------------------------

Can you please split this patch in 2, one that patches defconfig and
board files to use the new driver and one that actually removes the old
driver.

Thanks,

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
