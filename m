From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: rockchip: add dts for ChipSPARK Rayeager PX2 board
Date: Thu, 15 Jan 2015 17:19:08 +0100
Message-ID: <2706590.Kkspa3JYVn@phil>
References: <1421289659-16627-1-git-send-email-naobsd@gmail.com> <1421289659-16627-4-git-send-email-naobsd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421289659-16627-4-git-send-email-naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

again, please add a small commit message and reorder nodes as described in the 
previous patch, some more stuff inline

Am Donnerstag, 15. Januar 2015, 11:40:59 schrieb FUKAUMI Naoki:
> Signed-off-by: FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

[...]

> +
> +	vsys: vsys-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vsys";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vcc_otg: usb-otg-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio0 5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&otg_drv>;
> +		regulator-name = "vcc_otg";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;

missing vin-supply

> +	};
> +
> +	vcc_host: usb-host-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio0 6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&host_drv>;
> +		regulator-name = "host-pwr";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;

missing vin-supply

> +	};
> +
> +	vcc_sata: sata-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sata_pwr>;
> +		regulator-name = "usb_5v";

why is it named "usb_5v"?

> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;

missing vin-supply

> +	};
> +

[...]

> +&emmc {
> +	broken-cd;
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	disable-wp;
> +	non-removable;
> +	num-slots = <1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&emmc_clk>, <&emmc_cmd>, <&emmc_rst>;
> +	status = "okay";
> +	vmmc-supply = <&vcc_emmc>;
> +	vqmmc-supply = <&vcc_emmc>;

I checked the public schematics and surprisingly this is actually correct ... 
but still very strange :-)

> +};

[...]

> +&i2c0 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	ak8963: ak8963@d {

please use two chars for the address, i.e. ak8963@0d, same for the reg below

> +		compatible = "asahi-kasei,ak8975";
> +		reg = <0xd>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <17 IRQ_TYPE_EDGE_RISING>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&comp_int>;
> +	};
> +
> +	mma8452: mma8452@1d {
> +		compatible = "fsl,mma8452";
> +		reg = <0x1d>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <16 IRQ_TYPE_EDGE_RISING>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gsensor_int>;
> +	};
> +};


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
