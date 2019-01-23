From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/2] ARM: dts: meson8b: odroidc1: Enable usb phy node
Date: Wed, 23 Jan 2019 08:49:59 -0800
Message-ID: <7hef93mi88.fsf@baylibre.com>
References: <20190113181808.5768-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190113181808.5768-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Emiliano Ingrassia <ingrassia@epigenesys.com>
List-Id: devicetree@vger.kernel.org

Anand Moon <linux.amoon@gmail.com> writes:

> Add missing vbus-supply link to phy controller for usb_phy0
> and usb_phy1 nodes, this changes fixed the power issue
> on usb ports usb, changes help fix usb reset warning.
>
> [  821.991470] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  825.243385] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  828.151310] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  830.991241] usb 1-1.2: reset high-speed USB device number 3 using dwc2
>
> Fixes: 2eb79a4d15ff (ARM: dts: meson: enabling the USB Host controller on Odroid-C1/C1+ board)
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Rebased on Kevin's amlogic/v5.0/fixes branch

As requested, dropping this series from the fixes branch pending further
debug and testing.

Kevin

> [alarm@archl-c1t ~]$ lsusb -t
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
>         |__ Port 3: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
>         |__ Port 3: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
>         |__ Port 3: Dev 3, If 2, Class=Audio, Driver=snd-usb-audio, 480M
>         |__ Port 3: Dev 3, If 3, Class=Audio, Driver=snd-usb-audio, 480M
> [alarm@archl-c1t ~]$
> [alarm@archl-c1t ~]$ lsusb -v|egrep "^Bus|MaxPower"
> Couldn't open device, some information will be missing
> Bus 001 Device 003: ID 1b71:0056 Fushicai
>     MaxPower              500mA
> Couldn't open device, some information will be missing
> Bus 001 Device 004: ID 152d:0578 JMicron Technology Corp. / JMicron USA Technology Corp. JMS567 SATA 6Gb/s bridge
>     MaxPower               30mA
> Couldn't open device, some information will be missing
> Couldn't open device, some information will be missing
> Bus 001 Device 002: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
>     MaxPower              100mA
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>     MaxPower                0mA
> ---
>  arch/arm/boot/dts/meson8b-odroidc1.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index 0f0a46ddf3ff..a49a8509b288 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -83,6 +83,19 @@
>  		regulator-max-microvolt = <5000000>;
>  	};
>  
> +	usb_vbus: regulator-usb-vbus {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "USB_VBUS";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		vin-supply = <&p5v0>;
> +
> +		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	tflash_vdd: regulator-tflash_vdd {
>  		/*
>  		 * signal name from schematics: TFLASH_VDD_EN
> @@ -293,8 +306,18 @@
>  	pinctrl-names = "default";
>  };
>  
> +&usb0_phy {
> +	status = "okay";
> +	vbus-supply = <&usb_vbus>;
> +};
> +
>  &usb1_phy {
>  	status = "okay";
> +	vbus-supply = <&usb_vbus>;
> +};
> +
> +&usb0 {
> +	status = "okay";
>  };
>  
>  &usb1 {
> -- 
> 2.20.1
