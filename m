From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 2/3] ARM: dts: rockchip: add dts for Firefly Firefly-RK3288 boards
Date: Mon, 19 Jan 2015 00:36:15 +0100
Message-ID: <8724226.Kbpk2bALNd@phil>
References: <1421464140-29903-1-git-send-email-naobsd@gmail.com> <1421464140-29903-3-git-send-email-naobsd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421464140-29903-3-git-send-email-naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 17. Januar 2015, 12:08:59 schrieb FUKAUMI Naoki:
> This adds support for Firefly-RK3288, Rockchip RK3288 based development
> boards made by Firefly.
> 
> There are 2 dts for 2 versions of the board. rk3288-firefly-beta.dts is
> for the beta version, rk3288-firefly.dts is for the mass production version.
> 
> Signed-off-by: FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

[...]

> +	ext_gmac: external-gmac-clock {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +		clock-output-names = "phy_clkout125";

This should be named "ext_gmac". See the rockchip,rk3288-cru.txt binding 
document.


> +&gmac {
> +	assigned-clocks = <&cru SCLK_MAC>;
> +	assigned-clock-parents = <&ext_gmac>;
> +	clock_in_out = "input";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmii_pins>, <&phy_rst>, <&phy_pmeb>, <&phy_int>;
> +	phy_regulator = "vcc_lan";

This is wrong in the dwmac-rk implementation at the moment which Romain Perier 
was/is trying to rectify. I.e. there is an established devicetree api for 
handling regulators, thus the approach the current net-code takes is just 
wrong and thus this will need to change after.


> +	phy-mode = "rgmii";
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 10000 1000000>;
> +	snps,reset-gpio = <&gpio4 8 GPIO_ACTIVE_LOW>;
> +	tx_delay = <0x30>;
> +	rx_delay = <0x10>;
> +	status = "ok";
> +};
> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	vdd_cpu: syr827@40 {
> +		compatible = "silergy,syr827";
> +		fcs,suspend-voltage-selector = <1>;
> +		reg = <0x40>;
> +		regulator-name = "vdd_cpu";
> +		regulator-min-microvolt = <850000>;
> +		regulator-max-microvolt = <1350000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		vin-supply = <&vcc_sys>;
> +	};
> +
> +	vdd_gpu: syr828@41 {
> +		compatible = "silergy,syr828";
> +		fcs,suspend-voltage-selector = <1>;
> +		reg = <0x41>;
> +		regulator-name = "vdd_gpu";
> +		regulator-min-microvolt = <850000>;
> +		regulator-max-microvolt = <1350000>;
> +		regulator-always-on;
> +		vin-supply = <&vcc_sys>;
> +	};
> +
> +	hym8563: hym8563@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "rtc_clkout";

this should be named "xin32k" . See radxarock.dts (as a rk3188 based similar 
example) and the rk3288 clock controller devicetree binding.
This is due to the fact that this is also the input for the suspend clock and 
the core clock code expects the specific naming according to the soc 
documentation.


> +		interrupt-parent = <&gpio7>;
> +		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&rtc_int>;
> +	};

[...]

> +&sdio0 {
> +	broken-cd;
> +	bus-width = <4>;
> +	clocks = <&hym8563>;
> +	clock-names = "lpo";

why are you _overriding_ the clocks of the sdio controller?
I guess this clock is part of the actual wifi card connected to the controller. 
There exists an unfinished approach by Olof Johansson about initing those 
cards. But in no way is the wifi-ic clock part of the mmc controller itself 
[and this also effectively overwrites the clocks set in the main dtsi]

> +	disable-wp;
> +	non-removable;
> +	num-slots = <1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdio0_bus4>, <&sdio0_cmd>, <&sdio0_clk>;
> +	vmmc-supply = <&vcc_18>;
> +	status = "okay";
> +};

[...]

> +&spi2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi2_clk>, <&spi2_cs0>;

you're enabling only the clk and chipselect, what about the data signals?


> +	status = "okay";
> +};
> +
> +&tsadc {
> +	clocks = <&hym8563>;
> +	clock-names = "clkin_32k";

The tsadc driver only recognizes the clocks "tsadc", "apb_pclk" so I'm not 
sure what you're doing with the clkin_32k name here? Also you're again 
overwriting the existing property.


> +	rockchip,hw-tshut-mode = <0>;
> +	status = "okay";
> +};

[...]


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
