From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: dts: imx6qdl: add pingroup for enet interface
 in RMII mode
Date: Fri, 13 Dec 2013 16:39:17 +0800
Message-ID: <20131213083915.GS18380@S2101-09.ap.freescale.net>
References: <1386854880-21805-1-git-send-email-LW@KARO-electronics.de>
 <1386854880-21805-3-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386854880-21805-3-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 12, 2013 at 02:27:58PM +0100, Lothar Wa=DFmann wrote:
> This will be used by the TX6 modules from Ka-Ro electronics.
>=20
> Signed-off-by: Lothar Wa=DFmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6qdl-pingrp.h |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/imx6qdl-pingrp.h b/arch/arm/boot/dts/i=
mx6qdl-pingrp.h
> index 8d71b13..4932249 100644
> --- a/arch/arm/boot/dts/imx6qdl-pingrp.h
> +++ b/arch/arm/boot/dts/imx6qdl-pingrp.h
> @@ -100,6 +100,17 @@
>  	MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL		0x1b0b0 \
>  	MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN		0x1b0b0
> =20
> +#define MX6QDL_ENET_PINGRP4					\

The '\' should just be after MX6QDL_ENET_PINGRP4 with a space in
between.

I just fixed it up and applied the first 3 patches.

Shawn

> +	MX6QDL_PAD_ENET_MDC__ENET_MDC			0x1b0b0	\
> +	MX6QDL_PAD_ENET_MDIO__ENET_MDIO			0x1b0b0	\
> +	MX6QDL_PAD_ENET_RXD0__ENET_RX_DATA0		0x1b0b0	\
> +	MX6QDL_PAD_ENET_RXD1__ENET_RX_DATA1		0x1b0b0	\
> +	MX6QDL_PAD_ENET_RX_ER__ENET_RX_ER		0x1b0b0	\
> +	MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN		0x1b0b0	\
> +	MX6QDL_PAD_ENET_TXD0__ENET_TX_DATA0		0x1b0b0	\
> +	MX6QDL_PAD_ENET_TXD1__ENET_TX_DATA1		0x1b0b0	\
> +	MX6QDL_PAD_ENET_CRS_DV__ENET_RX_EN		0x1b0b0
> +
>  #define MX6QDL_ESAI_PINGRP1 \
>  	MX6QDL_PAD_ENET_RXD0__ESAI_TX_HF_CLK		0x1b030 \
>  	MX6QDL_PAD_ENET_CRS_DV__ESAI_TX_CLK		0x1b030 \
> --=20
> 1.7.2.5
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
