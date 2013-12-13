From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: imx6qdl: add support for Ka-Ro TX6 modules
Date: Fri, 13 Dec 2013 20:13:09 +0800
Message-ID: <20131213121308.GT18380@S2101-09.ap.freescale.net>
References: <1386854880-21805-1-git-send-email-LW@KARO-electronics.de>
 <1386854880-21805-5-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386854880-21805-5-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Lothar,

Please check the patch against those comments that I put on the TX53
patches.  A couple of comments embedded below.

On Thu, Dec 12, 2013 at 02:28:00PM +0100, Lothar Wa=DFmann wrote:
=2E..
> @@ -0,0 +1,350 @@
> +/*
> + * Copyright 2013 Lothar Wa=DFmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Publi=
c
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +#include "imx6dl.dtsi"
> +#include "imx6qdl-tx6.dtsi"
> +
> +/ {
> +	model =3D "Ka-Ro electronics TX6DL Module";
> +	compatible =3D "fsl,imx6dl-tx6dl", "fsl,imx6dl";

karo,imx6dl-tx6dl

<snip>

> +&iomuxc {
> +	display {
> +		pinctrl_disp0_1: disp0grp-1 {
> +			fsl,pins =3D <
> +				MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
> +				MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
> +				MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x10
> +				MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x10
> +				/* PAD DISP0_DAT0 is used for the Flexcan transceiver control */

So how will this pingrp be used, without DATA00?

Shawn

> +				MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01   0x10
> +				MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02   0x10
> +				MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03   0x10
> +				MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04   0x10
> +				MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05   0x10
> +				MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06   0x10
> +				MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07   0x10
> +				MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08   0x10
> +				MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09   0x10
> +				MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10  0x10
> +				MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11  0x10
> +				MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12  0x10
> +				MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13  0x10
> +				MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14  0x10
> +				MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15  0x10
> +				MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16  0x10
> +				MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17  0x10
> +				MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18  0x10
> +				MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19  0x10
> +				MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20  0x10
> +				MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21  0x10
> +				MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22  0x10
> +				MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23  0x10
> +			>;
> +		};
> +
> +		pinctrl_disp0_2: disp0grp-2 {
> +			fsl,pins =3D <
> +				MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
> +				MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
> +				MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x10
> +				MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x10
> +				MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00   0x10
> +				MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01   0x10
> +				MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02   0x10
> +				MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03   0x10
> +				MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04   0x10
> +				MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05   0x10
> +				MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06   0x10
> +				MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07   0x10
> +				MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08   0x10
> +				MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09   0x10
> +				MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10  0x10
> +				MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11  0x10
> +				MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12  0x10
> +				MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13  0x10
> +				MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14  0x10
> +				MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15  0x10
> +				MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16  0x10
> +				MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17  0x10
> +				MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18  0x10
> +				MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19  0x10
> +				MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20  0x10
> +				MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21  0x10
> +				MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22  0x10
> +				MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23  0x10
> +			>;
> +		};
> +	};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
