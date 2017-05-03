From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/5] mtd: nand: gpmi: add i.MX 7 support
Date: Wed, 3 May 2017 21:25:15 +0800
Message-ID: <20170503132513.GE24392@dragon>
References: <20170422012338.4635-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170422012338.4635-1-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, han.xu-3arQi8VN3Tc@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 21, 2017 at 06:23:33PM -0700, Stefan Agner wrote:
> This patchset adds support for i.MX 7 SoC for the GPMI NAND controller.
> There have been similar patchsets already:
> https://lkml.org/lkml/2016/2/23/912
> 
> However, this patchset does not make use of any of the new features.
> The current feature set seems to work fine, I successfully run the MTD
> tests on a Colibri iMX7.
> 
> --
> Stefan
> 
> Changes since v1:
> - Make clks_count const
> - Introduce IS_IMX7D for i.MX 7 SoC's and make it part of GPMI_IS_MX6
> 
> Stefan Agner (5):
>   mtd: nand: gpmi: unify clock handling
>   mtd: nand: gpmi: add i.MX 7 SoC support
>   mtd: gpmi: document current clock requirements
>   ARM: dts: imx7: add GPMI NAND
>   ARM: dts: imx7-colibri: add NAND support

The dts patches look good to me.  I will pick them up once the driver
changes are accepted.

Shawn

> 
>  .../devicetree/bindings/mtd/gpmi-nand.txt          | 14 +++++-
>  arch/arm/boot/dts/imx7-colibri.dtsi                |  9 ++++
>  arch/arm/boot/dts/imx7s.dtsi                       | 31 ++++++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c             | 56 +++++++++++++---------
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |  9 +++-
>  5 files changed, 93 insertions(+), 26 deletions(-)
> 
> -- 
> 2.12.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
