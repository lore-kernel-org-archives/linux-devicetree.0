From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: add GPIO device nodes
Date: Wed, 13 Sep 2017 09:49:35 +0200
Message-ID: <20170913074934.GH6756@verge.net.au>
References: <1505285528-7033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505285528-7033-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 13, 2017 at 03:52:08PM +0900, Yoshihiro Shimoda wrote:
> This patch adds GPIO device nodes for r8a77995.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This patch should be applied after the following patch is applied:
>   "gpio: rcar: Add r8a77995 (R-Car D3) support".

I think it can be applied in parallel with that patch as the driver
will match on "renesas,rcar-gen3-gpio". Right?

>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 112 ++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 84b6bd5..a1c9271 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -139,6 +139,118 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		gpio0: gpio@e6050000 {
> +			compatible = "renesas,gpio-r8a77995",
> +				     "renesas,rcar-gen3-gpio",
> +				     "renesas,gpio-rcar";
> +			reg = <0 0xe6050000 0 0x50>;
> +			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +			#gpio-cells = <2>;
> +			gpio-controller;
> +			gpio-ranges = <&pfc 0 0 9>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +			clocks = <&cpg CPG_MOD 912>;
> +			power-domains = <&cpg>;
> +			resets = <&cpg 912>;
> +		};

...
