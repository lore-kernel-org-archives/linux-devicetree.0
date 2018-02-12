From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: renesas: r8a77970: add DU support
Date: Mon, 12 Feb 2018 14:55:39 +0000
Message-ID: <a98c9286-daed-9dbe-4f5e-6ad8cdeb544e@ideasonboard.com>
References: <20180208154720.5766-1-niklas.soderlund+renesas@ragnatech.se>
 <20180208154720.5766-4-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham@ideasonboard.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180208154720.5766-4-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-GB
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hi Sergei, Niklas

On 08/02/18 15:47, Niklas Söderlund wrote:
> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Define the generic R8A77970 part of the DU device node.
> 
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

I almost got this wrong ... thinking there was only a single output ... but
there are indeed two outputs, just a single DU channel.

LGTM...

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> index 5eb5d4b26f955671..c6056635bd372ce3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -630,6 +630,34 @@
>  			resets = <&cpg 623>;
>  			renesas,fcp = <&fcpvd0>;
>  		};
> +
> +		du: display@feb00000 {
> +			compatible = "renesas,du-r8a77970";
> +			reg = <0 0xfeb00000 0 0x80000>;
> +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 724>;
> +			clock-names = "du.0";
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			vsps = <&vspd0>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					du_out_rgb: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					du_out_lvds: endpoint {
> +					};
> +				};
> +			};
> +		};
>  	};
>  
>  	timer {
> 
