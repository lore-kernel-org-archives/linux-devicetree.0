Return-Path: <SRS0=iYly=US=ideasonboard.com=laurent.pinchart@kernel.org>
Date: Wed, 19 Jun 2019 15:41:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: hihope-common: Add HDMI support
Message-ID: <20190619124131.GB21753@pendragon.ideasonboard.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1560871119-16570-4-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

Thank you for the patch.

On Tue, Jun 18, 2019 at 04:18:39PM +0100, Fabrizio Castro wrote:
> Add HDMI support to the HiHope RZ/G2[MN] mother board common
> dtsi.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> ---
> Please note that this patch was tested with a 4K monitor and cma=96M
> 
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi | 62 ++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> index 625c3aa..e7568e1 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -17,6 +17,18 @@
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	hdmi0-out {
> +		compatible = "hdmi-connector";
> +		label = "HDMI0 OUT";

Is the label physically present on the device (printed on the board or
the case) ?

Apart from that, without access to the schematics I can't really tell if
the DT is correct, but nothing strikes me as really wrong, so

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		type = "a";
> +
> +		port {
> +			hdmi0_con: endpoint {
> +				remote-endpoint = <&rcar_dw_hdmi0_out>;
> +			};
> +		};
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> @@ -82,6 +94,30 @@
>  		states = <3300000 1
>  			  1800000 0>;
>  	};
> +
> +	x302_clk: x302-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <33000000>;
> +	};
> +
> +	x304_clk: x304-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +	};
> +};
> +
> +&du {
> +	clocks = <&cpg CPG_MOD 724>,
> +		 <&cpg CPG_MOD 723>,
> +		 <&cpg CPG_MOD 722>,
> +		 <&versaclock5 1>,
> +		 <&x302_clk>,
> +		 <&versaclock5 2>;
> +	clock-names = "du.0", "du.1", "du.2",
> +		      "dclkin.0", "dclkin.1", "dclkin.2";
> +	status = "okay";
>  };
>  
>  &ehci0 {
> @@ -109,11 +145,37 @@
>  	};
>  };
>  
> +&hdmi0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			rcar_dw_hdmi0_out: endpoint {
> +				remote-endpoint = <&hdmi0_con>;
> +			};
> +		};
> +	};
> +};
> +
>  &hsusb {
>  	dr_mode = "otg";
>  	status = "okay";
>  };
>  
> +&i2c4 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	versaclock5: clock-generator@6a {
> +		compatible = "idt,5p49v5923";
> +		reg = <0x6a>;
> +		#clock-cells = <1>;
> +		clocks = <&x304_clk>;
> +		clock-names = "xin";
> +	};
> +};
> +
>  &ohci0 {
>  	status = "okay";
>  };

-- 
Regards,

Laurent Pinchart
