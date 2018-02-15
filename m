From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 4/8] arm64: dts: renesas: r8a77995: add DU support
Date: Thu, 15 Feb 2018 16:07:35 +0200
Message-ID: <60779847.OG4dpa2GEt@avalon>
References: <1518683903-10681-1-git-send-email-kbingham@kernel.org> <1518683903-10681-5-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1518683903-10681-5-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, Simon Horman <horms@verge.net.au>, geert@glider.be, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Thursday, 15 February 2018 10:38:19 EET Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Define the generic r8a77995 part of the DU device node.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I assume Simon will take care of this patch.

> ---
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 35 ++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77995.dtsi index
> 0db242114bc5..a57d5fecf79c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -748,6 +748,41 @@
>  			resets = <&cpg 602>;
>  			iommus = <&ipmmu_vi0 9>;
>  		};
> +
> +		du: display@feb00000 {
> +			compatible = "renesas,du-r8a77995";
> +			reg = <0 0xfeb00000 0 0x80000>;
> +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 724>,
> +				 <&cpg CPG_MOD 723>;
> +			clock-names = "du.0", "du.1";
> +			vsps = <&vspd0 0 &vspd1 0>;
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
> +					du_out_lvds0: endpoint {
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					du_out_lvds1: endpoint {
> +					};
> +				};
> +			};
> +		};
>  	};
> 
>  	timer {


-- 
Regards,

Laurent Pinchart
