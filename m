From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH  2/2] ARM: dts: iwg20d-q7-dbcm-ca: Add HDMI video output
Date: Wed, 18 Oct 2017 15:16:31 +0300
Message-ID: <2315907.0FoaqPrOEJ@avalon>
References: <1508319227-19679-1-git-send-email-biju.das@bp.renesas.com> <1508319227-19679-3-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1508319227-19679-3-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Wednesday, 18 October 2017 12:33:47 EEST Biju Das wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Although there is a HDMI connector on the q7 carrier board it is not
> connected to the RZ/G1M SoC. One must use the HDMI connector on the
> camera daughter board.
> 
> This patch adds support for this connector.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi | 75 +++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi index 31fab5f..45b8167 100644
> --- a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> +++ b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> @@ -13,6 +13,31 @@
>  		serial1 = &scif1;
>  		serial4 = &hscif1;
>  	};
> +
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con_out: endpoint {
> +				remote-endpoint = <&adv7511_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&du {
> +	pinctrl-0 = <&du_pins>;
> +	pinctrl-names = "default";
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
>  &hscif1 {
> @@ -23,7 +48,57 @@
>  	status = "okay";
>  };
> 
> +&i2c5 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	cec_clock: cec-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <12000000>;
> +	};

I assume this describes a fixed clock generator that is not I2C-controlled. 
The node should thus not be a child of the i2c5 bus node, but should be moved 
to the root node of the DT.

The rest looks good to me. With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

However I can't find arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi in linux-next. 
Which tree would you like to get this series merged through ?

> +	hdmi@39 {
> +		compatible = "adi,adv7511w";
> +		reg = <0x39>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&cec_clock>;
> +		clock-names = "cec";
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
> +					remote-endpoint = <&du_out_rgb>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				adv7511_out: endpoint {
> +					remote-endpoint = <&hdmi_con_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &pfc {
> +	du_pins: du {
> +		groups = "du_rgb888", "du_sync", "du_oddf", "du_clk_out_0";
> +		function = "du";
> +	};
> +
>  	hscif1_pins: hscif1 {
>  		groups = "hscif1_data_c", "hscif1_ctrl_c";
>  		function = "hscif1";


-- 
Regards,

Laurent Pinchart
