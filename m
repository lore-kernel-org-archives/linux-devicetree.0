From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: renesas: r8a77995: add FCPV nodes
Date: Wed, 14 Feb 2018 00:02:03 +0200
Message-ID: <32333358.gV5bavL9ol@avalon>
References: <1518550237-16753-1-git-send-email-kbingham@kernel.org> <1518550237-16753-2-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1518550237-16753-2-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tuesday, 13 February 2018 21:30:34 EET Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The FCPVB handles the interface between the VSPB and memory, while the
> FCPVD handles the interface between the VSPD and memory.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77995.dtsi index
> cd3c6a30fc47..196a917afea6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -691,6 +691,33 @@
>  			#phy-cells = <0>;
>  			status = "disabled";
>  		};
> +
> +		fcpvb0: fcp@fe96f000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfe96f000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 607>;
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 607>;
> +			iommus = <&ipmmu_vp0 5>;
> +		};
> +
> +		fcpvd0: fcp@fea27000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea27000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 603>;
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 603>;
> +			iommus = <&ipmmu_vi0 8>;
> +		};
> +
> +		fcpvd1: fcp@fea2f000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea2f000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 602>;
> +			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> +			resets = <&cpg 602>;
> +			iommus = <&ipmmu_vi0 9>;
> +		};
>  	};
> 
>  	timer {


-- 
Regards,

Laurent Pinchart
