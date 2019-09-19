From: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 2/3] arm64: dts: imx8mm: Use correct clock for usdhc's ipg
 clk
Date: Thu, 19 Sep 2019 07:17:44 +0000
Message-ID: <c680d114-1c14-6bf8-226c-2fdd98350158__15071.1673124292$1568877507$gmane$org@kontron.de>
References: <1568869559-28611-1-git-send-email-Anson.Huang@nxp.com>
 <1568869559-28611-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568869559-28611-2-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <F14B5A1009A44548B13FE27527380192@snt-world.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <Anson.Huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "leonard.crestez@nxp.com" <leonard.crestez@nxp.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "ping.bai@nxp.com" <ping.bai@nxp.com>, "daniel.baluta@nxp.com" <daniel.baluta@nxp.com>, "jun.li@nxp.com" <jun.li@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "abel.vesa@nxp.com" <abel.vesa@nxp.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "angus@akkea.ca" <angus@akkea.ca>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-
Cc: "Linux-imx@nxp.com" <Linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

I have a question, that is not directly related to this patch.
I see that for the usdhc1 and usdhc3 nodes, there is an 'assigned-clock' 
and 'assigned-clock-rates' property but not for usdhc2. The same applies 
to the mx8mq and mx8mn dtsi file.

Is there any reason for this? If not can you fix it?

Thanks,
Frieder

On 19.09.19 07:05, Anson Huang wrote:
> On i.MX8MM, usdhc's ipg clock is from IMX8MM_CLK_IPG_ROOT,
> assign it explicitly instead of using IMX8MM_CLK_DUMMY.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>   arch/arm64/boot/dts/freescale/imx8mm.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index 7c4dcce..8aafad2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -694,7 +694,7 @@
>   				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
>   				reg = <0x30b40000 0x10000>;
>   				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clk IMX8MM_CLK_DUMMY>,
> +				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
>   					 <&clk IMX8MM_CLK_NAND_USDHC_BUS>,
>   					 <&clk IMX8MM_CLK_USDHC1_ROOT>;
>   				clock-names = "ipg", "ahb", "per";
> @@ -710,7 +710,7 @@
>   				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
>   				reg = <0x30b50000 0x10000>;
>   				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clk IMX8MM_CLK_DUMMY>,
> +				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
>   					 <&clk IMX8MM_CLK_NAND_USDHC_BUS>,
>   					 <&clk IMX8MM_CLK_USDHC2_ROOT>;
>   				clock-names = "ipg", "ahb", "per";
> @@ -724,7 +724,7 @@
>   				compatible = "fsl,imx8mm-usdhc", "fsl,imx7d-usdhc";
>   				reg = <0x30b60000 0x10000>;
>   				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&clk IMX8MM_CLK_DUMMY>,
> +				clocks = <&clk IMX8MM_CLK_IPG_ROOT>,
>   					 <&clk IMX8MM_CLK_NAND_USDHC_BUS>,
>   					 <&clk IMX8MM_CLK_USDHC3_ROOT>;
>   				clock-names = "ipg", "ahb", "per";
> 
