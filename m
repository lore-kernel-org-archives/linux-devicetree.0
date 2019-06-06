From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mm: Move gic node into soc node
Date: Thu, 6 Jun 2019 10:18:16 +0800
Message-ID: <20190606021803.GW29853@dragon>
References: <20190603015020.41410-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190603015020.41410-1-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson.Huang@nxp.com
Cc: mark.rutland@arm.com, aisheng.dong@nxp.com, ping.bai@nxp.com, devicetree@vger.kernel.org, viresh.kumar@linaro.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Linux-imx@nxp.com, kernel@pengutronix.de, leonard.crestez@nxp.com, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 03, 2019 at 09:50:20AM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> GIC is inside of SoC from architecture perspective, it should
> be located inside of soc node in DT.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

It doesn't apply to my imx/dt64 branch.  Please generate it against that
branch for my for-next.

Shawn

> ---
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index dc99f45..429312e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -169,15 +169,6 @@
>  		clock-output-names = "clk_ext4";
>  	};
>  
> -	gic: interrupt-controller@38800000 {
> -		compatible = "arm,gic-v3";
> -		reg = <0x0 0x38800000 0 0x10000>, /* GIC Dist */
> -		      <0x0 0x38880000 0 0xC0000>; /* GICR (RD_base + SGI_base) */
> -		#interrupt-cells = <3>;
> -		interrupt-controller;
> -		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> -	};
> -
>  	psci {
>  		compatible = "arm,psci-1.0";
>  		method = "smc";
> @@ -739,6 +730,15 @@
>  			dma-names = "rx-tx";
>  			status = "disabled";
>  		};
> +
> +		gic: interrupt-controller@38800000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x38800000 0x10000>, /* GIC Dist */
> +			      <0x38880000 0xc0000>; /* GICR (RD_base + SGI_base) */
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
>  	};
>  
>  	usbphynop1: usbphynop1 {
> -- 
> 2.7.4
> 
