From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Add on-chip OTP controller node
Date: Thu, 28 Feb 2019 11:00:05 +0000
Message-ID: <20190228110004.gkq3ne2am36iztm7@fsr-ub1664-175>
References: <20190226090448.24364-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190226090448.24364-1-ccaione@baylibre.com>
Content-Language: en-US
Content-ID: <3118BE5AE6427B41B68B384513A683DA@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 19-02-26 09:04:48, Carlo Caione wrote:
> Add the node for the OTP controller.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 9155bd4784eb..6a1cc183a301 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -244,6 +244,14 @@
>  				reg = <0x30340000 0x10000>;
>  			};
>  
> +			ocotp: ocotp-ctrl@30350000 {
> +				compatible = "fsl,imx8mq-ocotp", "syscon";
> +				reg = <0x30350000 0x10000>;
> +				clocks = <&clk IMX8MQ_CLK_OCOTP_ROOT>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +			};
> +
>  			anatop: syscon@30360000 {
>  				compatible = "fsl,imx8mq-anatop", "syscon";
>  				reg = <0x30360000 0x10000>;
> -- 
> 2.19.1
> 
