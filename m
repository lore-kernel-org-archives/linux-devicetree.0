From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: r8a77970: add the LVDS
 instance
Date: Thu, 8 Feb 2018 19:05:53 +0300
Message-ID: <af85dc17-e97d-bd40-6b46-376ae90123d7@cogentembedded.com>
References: <20180208154720.5766-1-niklas.soderlund+renesas@ragnatech.se>
 <20180208154720.5766-5-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180208154720.5766-5-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 02/08/2018 06:47 PM, Niklas Söderlund wrote:

> Add the LVDS device to r8a77970.dtsi in a disabled state. Also connect
> the it to the LVDS output of the DU. While at it align the endpoint name
> of the du to du_out_lvds0 which is used in other Renesas DTS files to
> describe this link.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> index c6056635bd372ce3..9c65884cc384952d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> @@ -653,7 +653,34 @@
>  
>  				port@1 {
>  					reg = <1>;
> -					du_out_lvds: endpoint {
> +					du_out_lvds0: endpoint {
> +						remote-endpoint = <&lvds0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds0: lvds@feb90000 {
> +			compatible = "renesas,r8a77970-lvds";
> +			reg = <0 0xfeb90000 0 0x14>;
> +			clocks = <&cpg CPG_MOD 727>;
> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> +			resets = <&cpg 727>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds0_in: endpoint {
> +						remote-endpoint = <&du_out_lvds0>;
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					lvds0_out: endpoint {
>  					};
>  				};
>  			};


   That's basically my patch modulo the added "power-domains" and "resets" props, and the node/endpoint rename (of a dubious value, if you ask me ;-)).

MBSR, Sergei
