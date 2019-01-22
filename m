Return-Path: <SRS0=Pv8+=P6=ideasonboard.com=laurent.pinchart@kernel.org>
Date: Tue, 22 Jan 2019 19:13:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 1/5] ARM: dts: r8a7743: Convert to new LVDS DT bindings
Message-ID: <20190122171325.GC26166@pendragon.ideasonboard.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-2-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1548170749-12773-2-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

Thank you for the patch.

On Tue, Jan 22, 2019 at 03:25:45PM +0000, Biju Das wrote:
> The internal LVDS encoder now has DT bindings separate from the DU. Port
> the device tree over to the new model.
> 
> Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")

Sorry for the breakage. The DT and DU series raced each other, but I
should have still caught it.

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I expect Simon to pick this up.

> ---
>  arch/arm/boot/dts/r8a7743.dtsi | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> index 24e6c2b..de981d6 100644
> --- a/arch/arm/boot/dts/r8a7743.dtsi
> +++ b/arch/arm/boot/dts/r8a7743.dtsi
> @@ -1660,15 +1660,12 @@
>  
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a7743";
> -			reg = <0 0xfeb00000 0 0x40000>,
> -			      <0 0xfeb90000 0 0x1c>;
> -			reg-names = "du", "lvds.0";
> +			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 724>,
> -				 <&cpg CPG_MOD 723>,
> -				 <&cpg CPG_MOD 726>;
> -			clock-names = "du.0", "du.1", "lvds.0";
> +				 <&cpg CPG_MOD 723>;
> +			clock-names = "du.0", "du.1";
>  			status = "disabled";
>  
>  			ports {
> @@ -1683,6 +1680,33 @@
>  				port@1 {
>  					reg = <1>;
>  					du_out_lvds0: endpoint {
> +						remote-endpoint = <&lvds0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds0: lvds@feb90000 {
> +			compatible = "renesas,r8a7743-lvds";
> +			reg = <0 0xfeb90000 0 0x1c>;
> +			clocks = <&cpg CPG_MOD 726>;
> +			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
> +			resets = <&cpg 726>;
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

-- 
Regards,

Laurent Pinchart
