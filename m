From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [v2 1/2] arm64: dts: ls1028a: Update the clock providers for the
 Mali DP500
Date: Mon, 7 Oct 2019 20:32:07 +0800
Message-ID: <20191007123203.GL7150@dragon>
References: <20190920083419.5092-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190920083419.5092-1-wen.he_1@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wen He <wen.he_1@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, linux-devel@linux.nxdi.nxp.com, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 20, 2019 at 04:34:18PM +0800, Wen He wrote:
> In order to maximise performance of the LCD Controller's 64-bit AXI
> bus, for any give speed bin of the device, the AXI master interface
> clock(ACLK) clock can be up to CPU_frequency/2, which is already
> capable of optimal performance. In general, ACLK is always expected
> to be equal to CPU_frequency/2. APB slave interface clock(PCLK) and
> Main processing clock(PCLK) both are tied to the same clock as ACLK.
> 
> This change followed the LS1028A Architecture Specification Manual.
> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>

@Leo, agree?

Shawn

> ---
> change in v2:
>         - add details commit description for this change. 
>         - v1: Link: https://lore.kernel.org/patchwork/patch/1119145/
> 
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 72b9a75976a1..51fa8f57fdac 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -86,20 +86,6 @@
>  		clocks = <&osc_27m>;
>  	};
>  
> -	aclk: clock-axi {
> -		compatible = "fixed-clock";
> -		#clock-cells = <0>;
> -		clock-frequency = <650000000>;
> -		clock-output-names= "aclk";
> -	};
> -
> -	pclk: clock-apb {
> -		compatible = "fixed-clock";
> -		#clock-cells = <0>;
> -		clock-frequency = <650000000>;
> -		clock-output-names= "pclk";
> -	};
> -
>  	reboot {
>  		compatible ="syscon-reboot";
>  		regmap = <&dcfg>;
> @@ -679,7 +665,8 @@
>  		interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
>  			     <0 223 IRQ_TYPE_LEVEL_HIGH>;
>  		interrupt-names = "DE", "SE";
> -		clocks = <&dpclk 0>, <&aclk>, <&aclk>, <&pclk>;
> +		clocks = <&dpclk 0>, <&clockgen 2 2>, <&clockgen 2 2>,
> +			 <&clockgen 2 2>;
>  		clock-names = "pxlclk", "mclk", "aclk", "pclk";
>  		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
>  		arm,malidp-arqos-value = <0xd000d000>;
> -- 
> 2.17.1
> 
