From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 12/18] arm64: dts: meson-gxbb-vega-s95: Fix node order
Date: Mon, 15 May 2017 10:17:10 +0200
Message-ID: <d5ab7b11-1964-6d45-3323-98af7d726776@baylibre.com>
References: <20170513143337.14278-1-afaerber@suse.de>
 <20170513143337.14278-13-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170513143337.14278-13-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, linux-amlogic@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/13/2017 04:33 PM, Andreas Färber wrote:
> Sort nodes referenced by label alphabetically.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  v1 -> v2:
>  * Rebased (new nodes added)
>  
>  .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 54 +++++++++++-----------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> index f4bfee8e2e08..346753fb6324 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> @@ -111,18 +111,6 @@
>  	};
>  };
>  
> -&uart_AO {
> -	status = "okay";
> -	pinctrl-0 = <&uart_ao_a_pins>;
> -	pinctrl-names = "default";
> -};
> -
> -&ir {
> -	status = "okay";
> -	pinctrl-0 = <&remote_input_ao_pins>;
> -	pinctrl-names = "default";
> -};
> -
>  &ethmac {
>  	status = "okay";
>  	pinctrl-0 = <&eth_rgmii_pins>;
> @@ -149,21 +137,18 @@
>  	};
>  };
>  
> -&usb0_phy {
> -	status = "okay";
> -	phy-supply = <&usb_vbus>;
> -};
> -
> -&usb1_phy {
> -	status = "okay";
> -};
> -
> -&usb0 {
> +&ir {
>  	status = "okay";
> +	pinctrl-0 = <&remote_input_ao_pins>;
> +	pinctrl-names = "default";
>  };
>  
> -&usb1 {
> +&pwm_ef {
>  	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins>;
> +	pinctrl-names = "default";
> +	clocks = <&clkc CLKID_FCLK_DIV4>;
> +	clock-names = "clkin0";
>  };
>  
>  /* Wireless SDIO Module */
> @@ -229,10 +214,25 @@
>  	vmmcq-sumpply = <&vcc_1v8>;
>  };
>  
> -&pwm_ef {
> +&uart_AO {
>  	status = "okay";
> -	pinctrl-0 = <&pwm_e_pins>;
> +	pinctrl-0 = <&uart_ao_a_pins>;
>  	pinctrl-names = "default";
> -	clocks = <&clkc CLKID_FCLK_DIV4>;
> -	clock-names = "clkin0";
> +};
> +
> +&usb0_phy {
> +	status = "okay";
> +	phy-supply = <&usb_vbus>;
> +};
> +
> +&usb1_phy {
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	status = "okay";
>  };
> 

Hi Andreas,

Like a previous attempt, I'm not OK with such rework since it will break bisect and add complexity for new patches handling.

The order is not alphabetically ordered, live with it.

Neil
