From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH V2 3/3] arm64: defconfig: Select CONFIG_CLK_IMX8MN by
 default
Date: Mon, 3 Jun 2019 07:32:13 +0000
Message-ID: <20190603073212.hgdc4mwqwqvrc6kg@fsr-ub1664-175>
References: <20190603013503.40626-1-Anson.Huang@nxp.com>
 <20190603013503.40626-3-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190603013503.40626-3-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <A1E0E3CAD1331D4C866338A97F69F3D0@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, Leonard Crestez <leonard.crestez@nxp.co>
List-Id: devicetree@vger.kernel.org

On 19-06-03 09:35:03, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
>=20
> Enable CONFIG_CLK_IMX8MN to support i.MX8MN clock driver.
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No changes.
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 8d4f25c..aef797c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -654,6 +654,7 @@ CONFIG_COMMON_CLK_CS2000_CP=3Dy
>  CONFIG_COMMON_CLK_S2MPS11=3Dy
>  CONFIG_CLK_QORIQ=3Dy
>  CONFIG_COMMON_CLK_PWM=3Dy
> +CONFIG_CLK_IMX8MN=3Dy

Nitpick: Move this after IMX8MM so it can stay alphabetically ordered.

>  CONFIG_CLK_IMX8MM=3Dy
>  CONFIG_CLK_IMX8MQ=3Dy
>  CONFIG_CLK_IMX8QXP=3Dy
> --=20
> 2.7.4
> =
