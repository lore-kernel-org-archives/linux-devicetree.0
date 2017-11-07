From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] ARM: dts: iwg22d-sodimm-dbhd-ca: Add HDMI video output
Date: Tue, 07 Nov 2017 06:13:01 +0200
Message-ID: <1683156.dTMPXyoQIO@avalon>
References: <1509992814-4543-1-git-send-email-fabrizio.castro@bp.renesas.com> <1509992814-4543-3-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1509992814-4543-3-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Paterson <chris.paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Monday, 6 November 2017 20:26:54 EET Fabrizio Castro wrote:
> This patch enables the HDMI interface found on the expansion board.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Nothing strikes me as wrong, but I haven't checked the board's schematics, so

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
> b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts index
> f925388..a8a4ec8 100644
> --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
> +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts
> @@ -20,6 +20,38 @@
>  		serial4 = &scif5;
>  		serial6 = &hscif2;
>  	};
> +
> +	cec_clock: cec-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <12000000>;
> +	};
> +
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&adv7511_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&du {
> +	pinctrl-0 = <&du0_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			endpoint {
> +				remote-endpoint = <&adv7511_in>;
> +			};
> +		};
> +	};
>  };
> 
>  &hscif2 {
> @@ -29,12 +61,65 @@
>  	status = "okay";
>  };
> 
> +&i2c1 {
> +	pinctrl-0 = <&i2c1_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	hdmi@39 {
> +		compatible = "adi,adv7511w";
> +		reg = <0x39>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&cec_clock>;
> +		clock-names = "cec";
> +		pd-gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
> +
> +		adi,input-depth = <8>;
> +		adi,input-colorspace = "rgb";
> +		adi,input-clock = "1x";
> +		adi,input-style = <1>;
> +		adi,input-justification = "evenly";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				adv7511_in: endpoint {
> +					remote-endpoint = <&du_out_rgb0>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				adv7511_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &pfc {
> +	du0_pins: du0 {
> +		groups = "du0_rgb888", "du0_sync", "du0_disp", "du0_clk0_out";
> +		function = "du0";
> +	};
> +
>  	hscif2_pins: hscif2 {
>  		groups = "hscif2_data";
>  		function = "hscif2";
>  	};
> 
> +	i2c1_pins: i2c1 {
> +		groups = "i2c1_d";
> +		function = "i2c1";
> +	};
> +
>  	scif1_pins: scif1 {
>  		groups = "scif1_data";
>  		function = "scif1";


-- 
Regards,

Laurent Pinchart
