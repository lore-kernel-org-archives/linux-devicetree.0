Return-Path: <SRS0=t56K=UC=nxp.com=leonard.crestez@kernel.org>
From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH V2 2/3] clk: imx: Add support for i.MX8MN clock driver
Date: Mon, 3 Jun 2019 08:45:16 +0000
Message-ID: 
 <VI1PR04MB5055D6EB38E84E370E881425EE140@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190603013503.40626-1-Anson.Huang@nxp.com>
 <20190603013503.40626-2-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Anson Huang <anson.huang@nxp.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 6/3/2019 4:33 AM, Anson.Huang@nxp.com wrote:=0A=
> From: Anson Huang <Anson.Huang@nxp.com>=0A=
> =0A=
> This patch adds i.MX8MN clock driver support. =0A=
=0A=
> +#include "clk.h"=0A=
> +=0A=
> +#define PLL_1416X_RATE(_rate, _m, _p, _s)		\=0A=
> +	{						\=0A=
> +		.rate	=3D	(_rate),		\=0A=
> +		.mdiv	=3D	(_m),			\=0A=
> +		.pdiv	=3D	(_p),			\=0A=
> +		.sdiv	=3D	(_s),			\=0A=
> +	}=0A=
> +=0A=
> +#define PLL_1443X_RATE(_rate, _m, _p, _s, _k)		\=0A=
> +	{						\=0A=
> +		.rate	=3D	(_rate),		\=0A=
> +		.mdiv	=3D	(_m),			\=0A=
> +		.pdiv	=3D	(_p),			\=0A=
> +		.sdiv	=3D	(_s),			\=0A=
> +		.kdiv	=3D	(_k),			\=0A=
> +	}=0A=
=0A=
These macros are shared with clk-imx8mm (and perhaps some future chips) =0A=
so they should be moved to driver/clk/imx/clk.h=0A=
