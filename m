From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Add ARM PMU node
Date: Fri, 1 Feb 2019 10:24:27 +0000
Message-ID: <20190201102427.GA31409@lakrids.cambridge.arm.com>
References: <20190131185422.7813-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190131185422.7813-1-ccaione@baylibre.com>
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
Cc: devicetree@vger.kernel.org, abel.vesa@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2019 at 06:54:22PM +0000, Carlo Caione wrote:
> Add the node for the ARM Performance Monitor Units.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index dbedc4a5e7fb..8b3107643ed4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -118,6 +118,13 @@
>  		};
>  	};
>  
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";

Please use "arm,cortex-a53-pmu".

Thanks,
Mark.

> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent = <&gic>;
> +		interrupt-affinity = <&A53_0>, <&A53_1>, <&A53_2>, <&A53_3>;
> +	};
> +
>  	psci {
>  		compatible = "arm,psci-1.0";
>  		method = "smc";
> -- 
> 2.19.1
> 
