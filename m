From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: boot: mxs: Add On-Chip RAM
Date: Fri, 21 Oct 2016 21:53:43 +0800
Message-ID: <20161021135343.GI30578@tiger>
References: <1473789066-8955-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473789066-8955-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?iso-8859-1?Q?J=F6rg?= Krause <joerg.krause-L1vi/lXTdtsfGbAt6QbQcg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lothar =?iso-8859-1?Q?Wa=DFmann?= <lw-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 13, 2016 at 05:51:02PM +0000, Stefan Wahren wrote:
> The i.MX23 / i.MX28 have a small amount of On-Chip RAM which is also necessary
> for suspend to RAM and standby mode. But before we need to remove the fake reg
> properties of all internal bus nodes as discussed in this thread [1].
> 
> This patch series requires Fabio Estevam's recent series "ARM: dts: imx23:
> Remove skeleton.dtsi inclusion" [2].
> 
> [1] - https://marc.info/?l=devicetree&m=146139948426520&w=2

The page cannot be reached.  I would like to understand the
background for this change.

Shawn

> [2] - http://www.spinics.net/lists/arm-kernel/msg528974.html
> 
> Stefan Wahren (4):
>   ARM: dts: imx23: Remove fake "reg" properties from bus nodes
>   ARM: dts: imx28: Remove fake "reg" properties from bus nodes
>   ARM: dts: imx23: add On-Chip RAM
>   ARM: dts: imx28: add On-Chip RAM
> 
>  arch/arm/boot/dts/imx23-evk.dts           |    8 ++++----
>  arch/arm/boot/dts/imx23-olinuxino.dts     |    8 ++++----
>  arch/arm/boot/dts/imx23-sansa.dts         |    8 ++++----
>  arch/arm/boot/dts/imx23-stmp378x_devb.dts |    6 +++---
>  arch/arm/boot/dts/imx23-xfi3.dts          |    8 ++++----
>  arch/arm/boot/dts/imx23.dtsi              |   15 +++++++++------
>  arch/arm/boot/dts/imx28-apf28.dts         |    8 ++++----
>  arch/arm/boot/dts/imx28-apf28dev.dts      |    8 ++++----
>  arch/arm/boot/dts/imx28-apx4devkit.dts    |    8 ++++----
>  arch/arm/boot/dts/imx28-cfa10036.dts      |    8 ++++----
>  arch/arm/boot/dts/imx28-cfa10037.dts      |    8 ++++----
>  arch/arm/boot/dts/imx28-cfa10049.dts      |   10 +++++-----
>  arch/arm/boot/dts/imx28-cfa10055.dts      |    6 +++---
>  arch/arm/boot/dts/imx28-cfa10056.dts      |    4 ++--
>  arch/arm/boot/dts/imx28-cfa10057.dts      |   10 +++++-----
>  arch/arm/boot/dts/imx28-cfa10058.dts      |   10 +++++-----
>  arch/arm/boot/dts/imx28-duckbill.dts      |    8 ++++----
>  arch/arm/boot/dts/imx28-evk.dts           |    8 ++++----
>  arch/arm/boot/dts/imx28-m28.dtsi          |    6 +++---
>  arch/arm/boot/dts/imx28-m28cu3.dts        |    8 ++++----
>  arch/arm/boot/dts/imx28-m28evk.dts        |    8 ++++----
>  arch/arm/boot/dts/imx28-sps1.dts          |    8 ++++----
>  arch/arm/boot/dts/imx28.dtsi              |   17 +++++++++--------
>  23 files changed, 100 insertions(+), 96 deletions(-)
> 
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
