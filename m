From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH v4] arm64: dts: imx8mq: Init rates and parents configs for
 clocks
Date: Wed, 21 Aug 2019 20:39:56 +0000
Message-ID: <VI1PR04MB70239C63D88ED27D929E29C1EEAA0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20190728152040.15323-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Abel Vesa <abel.vesa@nxp.com>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "agx@sigxcpu.org" <agx@sigxcpu.org>, Anson Huang <anson.huang@nxp.com>, Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 28.07.2019 18:20, Daniel Baluta wrote:=0A=
> From: Abel Vesa <abel.vesa@nxp.com>=0A=
> =0A=
> Add the initial configuration for clocks that need default parent and rat=
e=0A=
> setting. This is based on the vendor tree clock provider parents and rate=
s=0A=
> configuration except this is doing the setup in dts rather then using clo=
ck=0A=
> consumer API in a clock provider driver.=0A=
> =0A=
> Note that by adding the initial rate setting for audio_pll1/audio_pll=0A=
> setting we need to remove it from imx8mq-librem5-devkit.dts=0A=
=0A=
Setting default rates for audio_pll1 and audio_pll2 in soc dtsi makes a =0A=
lot of sense to me; the intention is for one to run at a multiple of =0A=
44.1k and another at a multiple of 48k.=0A=
=0A=
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mq.dtsi=0A=
> index 02fbd0625318..a55d72ba2e05 100644=0A=
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi=0A=
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi=0A=
> @@ -494,6 +494,25 @@=0A=
>   				clock-names =3D "ckil", "osc_25m", "osc_27m",=0A=
>   				              "clk_ext1", "clk_ext2",=0A=
>   				              "clk_ext3", "clk_ext4";=0A=
> +				assigned-clocks =3D <&clk IMX8MQ_VIDEO_PLL1>,=0A=
> +					<&clk IMX8MQ_AUDIO_PLL1>,=0A=
> +					<&clk IMX8MQ_AUDIO_PLL2>,=0A=
> +					<&clk IMX8MQ_CLK_AHB>,=0A=
> +					<&clk IMX8MQ_CLK_NAND_USDHC_BUS>,=0A=
> +					<&clk IMX8MQ_CLK_AUDIO_AHB>,=0A=
> +					<&clk IMX8MQ_VIDEO_PLL1_REF_SEL>,=0A=
> +					<&clk IMX8MQ_CLK_NOC>;=0A=
> +				assigned-clock-parents =3D <0>,=0A=
> +						<0>,=0A=
> +						<0> > +						<&clk IMX8MQ_SYS1_PLL_133M>,=0A=
> +						<&clk IMX8MQ_SYS1_PLL_266M>,=0A=
> +						<&clk IMX8MQ_SYS2_PLL_500M>,=0A=
> +						<&clk IMX8MQ_CLK_27M>,=0A=
> +						<&clk IMX8MQ_SYS1_PLL_800M>;=0A=
> +				assigned-clock-rates =3D <593999999>,=0A=
> +						<786432000>,=0A=
> +						<722534400>;=0A=
=0A=
The audio PLLs should run below 650 mHz so please use 393216000 and =0A=
361267200 instead of 786432000 and 722534400. For the 8mm equivalent see =
=0A=
commit 053a4ffe2988 ("clk: imx: imx8mm: fix audio pll setting").=0A=
=0A=
You should also move the unbypassing of AUDIO_PLL1 and AUDIO_PLL2 here =0A=
just add two more assigned-clocks and assigned-clock-parents.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
