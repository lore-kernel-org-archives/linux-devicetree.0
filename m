From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 1/4] dt-bindings: fsl: scu: add ocotp binding
Date: Mon, 6 May 2019 08:06:09 +0000
Message-ID: <AM0PR04MB4211BC6C3321648BEB67927480300@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20190505134130.28071-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190505134130.28071-1-peng.fan@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Anson Huang <anson.huang@nxp.com>, Stephen Boyd <sboyd@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "van.freenix@gmail.com" <van.freenix@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> From: Peng Fan
> Sent: Sunday, May 5, 2019 9:28 PM
> 
> NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as system
> controller(SCU), the ocotp controller is being controlled by the SCU, so Linux
> need use RPC to SCU for ocotp handling. This patch adds binding doc for i.MX8
> SCU OCOTP driver.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Anson Huang <anson.huang@nxp.com>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 13
> +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index 5d7dbabbb784..9cb7d52bdf26 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -100,6 +100,13 @@ ID in its "clocks" phandle cell.
>  See the full list of clock IDs from:
>  include/dt-bindings/clock/imx8qxp-clock.h
> 
> +OCOTP bindings based on SCU Message Protocol
> +------------------------------------------------------------
> +Required properties:
> +- compatible:		Should be "fsl,imx8qxp-ocotp"
> +- #address-cells:	Must be 1. Contains byte index
> +- #size-cells:		Must be 1. Contains byte length
> +

Please put this unimportant one to the last.
And it's better to mention the optional child nodes for data cells as
Above #address-cells and #size-cells are used for it.
Just like:
Documentation/devicetree/bindings/nvmem/imx-ocotp.txt

>  Pinctrl bindings based on SCU Message Protocol
>  ------------------------------------------------------------
> 
> @@ -177,6 +184,12 @@ firmware {
>  			...
>  		};
> 
> +		ocotp: imx8qx-ocotp {
> +			#address-cells = <1>;
> +			#size-cells = <1>;

Not sure if it's a free choice, but AFAIK we usually write #address-cells and #size-cells
under compatible string according to the example in DT spec and doc.
https://elinux.org/Device_Tree_Usage
https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.2

Maybe Rob can comment to avoid confusing.

Otherwise, this patch seems good to me.

Regards
Dong Aisheng

> +			compatible = "fsl,imx8qxp-ocotp";
> +		};
> +
>  		pd: imx8qx-pd {
>  			compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-pd";
>  			#power-domain-cells = <1>;
> --
> 2.16.4
