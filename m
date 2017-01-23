From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v2 6/9] ARM: dts: add support for I2SE Duckbill 2 485
Date: Mon, 23 Jan 2017 18:10:10 +0100
Message-ID: <ff21bcf8-7699-025f-5129-e1906914ce42@i2se.com>
References: <1485123764-14754-1-git-send-email-mhei@heimpold.de>
 <1485123764-14754-7-git-send-email-mhei@heimpold.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485123764-14754-7-git-send-email-mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 22.01.2017 um 23:22 schrieb Michael Heimpold:
> This machine is based on I2SE's Duckbill 2 board and features a
> RS-485 daugther board. This device is intended to be used for
> e.g. home automation purposes.
>
> Signed-off-by: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
> Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile                 |   1 +
>  arch/arm/boot/dts/imx28-duckbill-2-485.dts | 189 +++++++++++++++++++++++++++++
>  2 files changed, 190 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx28-duckbill-2-485.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index fa4664b..e0f3f4e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -475,6 +475,7 @@ dtb-$(CONFIG_ARCH_MXS) += \
>  	imx28-cfa10056.dtb \
>  	imx28-cfa10057.dtb \
>  	imx28-cfa10058.dtb \
> +	imx28-duckbill-2-485.dts \

The file ending should be dtb. This issue applies also to patch 7 and 8.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
