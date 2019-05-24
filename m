Return-Path: <robherring2@gmail.com>
Date: Fri, 24 May 2019 16:50:50 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 7/7] arm64: dts: renesas: r8a774c0-cat874: Enable usb
 role switch support
Message-ID: <20190524215050.GA23538@bogus>
References: <1557922152-16449-1-git-send-email-biju.das@bp.renesas.com>
 <1557922152-16449-8-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557922152-16449-8-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, May 15, 2019 at 01:09:12PM +0100, Biju Das wrote:
> This patch enables TI HD3SS3220 device and support usb role switch
> for the CAT 874 platform.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V5-->V6
>   * No change
> V4-->V5
>   * No change
> V3-->V4
>   * No change
> V2-->V3
>   * Used "renesas,usb-role-switch" instead of generic "usb-role-switch"
>     property
> V1-->V2
>   * New patch
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 39 +++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> index b9ae7db..124ed58 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -85,6 +85,34 @@
>  	clock-frequency = <48000000>;
>  };
>  
> +&i2c0 {
> +	status = "okay";
> +	clock-frequency = <100000>;
> +
> +	hd3ss3220@47 {
> +		compatible = "ti,hd3ss3220";
> +		reg = <0x47>;
> +		interrupt-parent = <&gpio6>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			data-role = "dual";
> +		};
> +
> +		port {

port should be a child of 'connector' node. It should also be port #1 if 
this is a SuperSpeed controller. Port #0 is HS.

As there are multiple ports possible, there should be a 'ports' node 
too.

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			hd3ss3220_ep: endpoint@0 {
> +				reg = <0>;

Don't need reg when there is only 1. Build your dtb with W=1 as that 
will tell you this.

> +				remote-endpoint = <&usb3peri_role_switch>;
> +			};
> +		};
> +	};
> +};
> +
>  &i2c1 {
>  	pinctrl-0 = <&i2c1_pins>;
>  	pinctrl-names = "default";
> @@ -175,6 +203,17 @@
>  &usb3_peri0 {
>  	companion = <&xhci0>;
>  	status = "okay";
> +	usb-role-switch;
> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		usb3peri_role_switch: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&hd3ss3220_ep>;
> +		};
> +	};
>  };
>  
>  &xhci0 {
> -- 
> 2.7.4
> 
