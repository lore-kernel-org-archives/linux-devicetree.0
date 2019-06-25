From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Init rates and parents configs for
 clocks
Date: Tue, 25 Jun 2019 14:22:00 +0000
Message-ID: <VI1PR04MB50550ACBAEA73FD7B5A97DD8EEE30@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <1561467081-25701-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

On 25.06.2019 15:51, Abel Vesa wrote:=0A=
> Add the initial configuration for clocks that need default parent and rat=
e=0A=
> setting. This is based on the vendor tree clock provider parents and rate=
s=0A=
> configuration except this is doing the setup in dts rather then using clo=
ck=0A=
> consumer API in a clock provider driver.=0A=
> =0A=
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>=0A=
> ---=0A=
>   arch/arm64/boot/dts/freescale/imx8mq.dtsi | 34 ++++++++++++++++++++++++=
+++++++=0A=
>   1 file changed, 34 insertions(+)=0A=
> =0A=
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mq.dtsi=0A=
> index d09b808..e0abe02 100644=0A=
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi=0A=
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi=0A=
> @@ -489,6 +489,40 @@=0A=
=0A=
> +					<&clk IMX8MQ_CLK_PCIE1_CTRL>,=0A=
> +					<&clk IMX8MQ_CLK_PCIE1_PHY>,=0A=
> +					<&clk IMX8MQ_CLK_PCIE2_CTRL>,=0A=
> +					<&clk IMX8MQ_CLK_PCIE2_PHY>,=0A=
> +					<&clk IMX8MQ_CLK_CSI1_CORE>,=0A=
> +					<&clk IMX8MQ_CLK_CSI1_PHY_REF>,=0A=
> +					<&clk IMX8MQ_CLK_CSI1_ESC>,=0A=
> +					<&clk IMX8MQ_CLK_CSI2_CORE>,=0A=
> +					<&clk IMX8MQ_CLK_CSI2_PHY_REF>,=0A=
> +					<&clk IMX8MQ_CLK_CSI2_ESC>;=0A=
=0A=
This stuff (and NAND) looks like it would belong to device nodes instead.=
=0A=
=0A=
The rest seem fine though I'm not sure why exactly those clks are =0A=
adjusted in vendor tree.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
