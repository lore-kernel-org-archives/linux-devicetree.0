From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] ARM: dts: r8a7745: Add DU support
Date: Tue, 07 Nov 2017 06:05:37 +0200
Message-ID: <9872942.on8edmfvcY@avalon>
References: <1509992814-4543-1-git-send-email-fabrizio.castro@bp.renesas.com> <1509992814-4543-2-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1509992814-4543-2-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Paterson <chris.paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Monday, 6 November 2017 20:26:53 EET Fabrizio Castro wrote:
> Add du node to r8a7745 SoC DT. Boards that want to enable the DU
> need to specify the output topology.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/r8a7745.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
> index 846c27a..53eb1ce4 100644
> --- a/arch/arm/boot/dts/r8a7745.dtsi
> +++ b/arch/arm/boot/dts/r8a7745.dtsi
> @@ -821,6 +821,33 @@
>  			status = "disabled";
>  		};
> 
> +		du: display@feb00000 {
> +			compatible = "renesas,du-r8a7745";
> +			reg = <0 0xfeb00000 0 0x40000>;
> +			reg-names = "du";
> +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
> +			clock-names = "du.0", "du.1";
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					du_out_rgb0: endpoint {
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					du_out_rgb1: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
>  		msiof0: spi@e6e20000 {
>  			compatible = "renesas,msiof-r8a7745",
>  				     "renesas,rcar-gen2-msiof";


-- 
Regards,

Laurent Pinchart
