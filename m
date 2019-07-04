From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mm: Add "fsl,imx8mq-src" as src's
 fallback compatible
Date: Thu, 04 Jul 2019 11:15:30 +0200
Message-ID: <1562231730.6641.4.camel@pengutronix.de>
References: <20190701093944.5540-1-Anson.Huang@nxp.com>
         <20190701093944.5540-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701093944.5540-2-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, viresh.kumar@linaro.org, daniel.baluta@nxp.com, ping.bai@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Mon, 2019-07-01 at 17:39 +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> i.MX8MM can reuse i.MX8MQ's src driver, add "fsl,imx8mq-src" as
> src's fallback compatible to enable it.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index f0ac027..ea15457 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -471,7 +471,7 @@
>  			};
>  
>  			src: reset-controller@30390000 {
> -				compatible = "fsl,imx8mm-src", "syscon";
> +				compatible = "fsl,imx8mm-src", "fsl,imx8mq-src", "syscon";
>  				reg = <0x30390000 0x10000>;
>  				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>  				#reset-cells = <1>;

Please also update the compatible property documentation in
Documentation/devicetree/bindings/reset/fsl,imx7-src.txt.
With that,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
