From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: boot: mxs: Add On-Chip RAM
Date: Thu, 20 Oct 2016 17:33:22 +0200
Message-ID: <3bc7e80d-da05-42c0-7b1b-3e7dd832e668@i2se.com>
References: <1473789066-8955-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473789066-8955-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, =?UTF-8?Q?Lothar_Wa=c3=9fmann?= <lw-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause-L1vi/lXTdtsfGbAt6QbQcg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 13.09.2016 um 19:51 schrieb Stefan Wahren:
> The i.MX23 / i.MX28 have a small amount of On-Chip RAM which is also necessary
> for suspend to RAM and standby mode. But before we need to remove the fake reg
> properties of all internal bus nodes as discussed in this thread [1].
>
> This patch series requires Fabio Estevam's recent series "ARM: dts: imx23:
> Remove skeleton.dtsi inclusion" [2].
>
> [1] - https://marc.info/?l=devicetree&m=146139948426520&w=2
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

Any comments about this series or should i resend it without Fabio's
patch series applied?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
