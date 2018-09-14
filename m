From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3] ARM: dts: pxa: add mioa701 board description
Date: Fri, 14 Sep 2018 07:54:41 +0200
Message-ID: <871s9w62u6.fsf@belgarion.home>
References: <20180830195941.6118-1-robert.jarzmik@free.fr>
        <1535708786.8035.41.camel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535708786.8035.41.camel@ziswiler.com> (Marcel Ziswiler's
        message of "Fri, 31 Aug 2018 11:46:26 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Marcel Ziswiler <marcel@ziswiler.com> writes:

> Hi Robert
>>  arch/arm/boot/dts/Makefile    |   2 +
>>  arch/arm/boot/dts/mioa701.dts | 558 
>
> Isn't that one supposed to be prefixed by pxa270-?
Good point, for v4.

>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
...
>> +dtb-$(CONFIG_ARCH_PXA) += \
> Wouldn't it rather make more sense to use CONFIG_MACH_PXA27X_DT
> instead?
No, I'll have all the devicetree files under one config, for the PXA
architecture.

>> +	model = "Mitac Mio A701 Board";
>> +	compatible = "marvell,pxa270";
>
> Usually, there is also a compatible for the particular board e.g.
> "mitac,mioa701", not? You might have to check on the vendor prefix
> though.
Ok.

>> +			pinctrl_usb_default: usb-default {
>> +				PMMUX(n-usb-detect, 13, gpio_in);
>> +				PMMUX_LPM_LOW(n-dplus-pullup, 22,
>> gpio_out);
>> +			};
>> +			pinctrl_power_default: power-default {
>> +				PMMUX_LPM_LOW(charge-enable, 9,
>> gpio_out);
>> +				PMMUX(charge-vdrop, 80, gpio_out);
>> +				PMMUX(ac-detect, 96, gpio_in);
>> +			};
>
> I guess usually, one would add newlines in front and between those
> pinctrls but its kind of a matter of taste.
Ok, for this and all the following newlines.
>> +		ffuart: serial@40100000 {
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&pinctrl_ffuart_default>;
>> +			status = "okay";
>> +		};
>> +
>> +		btuart: serial@40200000 {
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&pinctrl_btuart_default>;
>> +			status = "okay";
>> +		};
>> +
>> +		stuart: serial@40700000 {
>> +			status = "okay";
>> +		};
>
> I believe pxa2xx.dtsi calls them uart rather than serial so unless you
> plan to change this we will have to stick to using uart instead.
There was a patch submitted for that earlier, at Rob's demand, to change these
names. That's another dependency on the pxa/dt tree.
>
> I also don't think those serial port labels buy us anything, so I would
> get rid of them.
As there are already in the .dtsi files, they don't hurt do they ?

>> +		pwri2c: i2c@40f000180 {
>
> Uups, I guess that address is wrong, not? I will send a patch to fix it
> in pxa27x.dtsi as well.
Fixed here as well.

>
>> +			status = "okay";
>> +
>> +			core_regulator@14 {
>> +				compatible = "maxim,max1586";
>> +				reg = <0x14>;
>> +				v3-gain = <1000000>;
>> +
>> +				regulators {
>> +					vcc_core: v3 {
>> +						regulator-name =
>> "vcc_core";
>> +						regulator-compatible 
>> = "Output_V3";
>> +						regulator-min-
>> microvolt = <1000000>;
>> +						regulator-max-
>> microvolt = <1705000>;
>> +						regulator-always-on;
>> +					};
>> +				};
>> +			};
>
> Haven't seen core_regulator before. Just regulator would do unless it
> would be a more complex pmic.
Ok.

>
>
>> +				port {
>> +					mt9m111_1: endpoint {
>> +						bus-width = <8>;
>> +						remote-endpoint =
>> <&pxa_camera>;
>> +					};
>> +				};
>> +			};
>> +		};
>
> Same with pxai2c1 and mt9m111.
Ok for mt9m111, same answer as before for pxai2c1.
>> +		gpio-keys {
>> +			compatible = "gpio-keys";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			autorepeat;
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&pinctrl_gpiokeys_default>;
>> +			status = "okay";
>> +
>> +			power-button {
>> +				label = "GPIO Key Power";
>> +				linux,code = <174>;
>> +				gpios = <&gpio 0 0>;
>> +				gpio-key,wakeup;
>
> I believe that got deprecated in favour of just wakeup-source.
Ok.

>> +		lcd-controller@40500000 {
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&pinctrl_lcd_default>;
>> +			status = "okay";
>
> Missing newline.
>
>> +			port {
>> +				lcdc_out: endpoint {
>> +					remote-endpoint =
>> <&panel_in>;
>> +					bus-width = <16>;
>> +				};
>> +			};
>> +		};
>> +
>> +		ac97: sound@40500000 {
>> +			compatible = "marvell,pxa270-ac97";
>> +			reg = < 0x40500000 0x1000 >;
>> +			interrupts = <14>;
>> +			reset-gpios = <&gpio 95 GPIO_ACTIVE_HIGH>;
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = < &pinctrl_ac97_default >;
>> +			clocks = <&clks CLK_AC97>, <&clks
>> CLK_AC97CONF>;
>> +			clock-names = "AC97CLK", "AC97CONFCLK";
>> +			dmas = <&pdma 8 0
>> +				&pdma 9 0
>> +				&pdma 10 0
>> +				&pdma 11 0
>> +				&pdma 12 0>;
>> +			dma-names = "pcm_pcm_mic_mono",
>> "pcm_pcm_aux_mono_in",
>> +				    "pcm_pcm_aux_mono_out",
>> "pcm_pcm_stereo_in",
>> +				    "pcm_pcm_stereo_out";
>> +
>
> Spurious newline.
>
>> +			#sound-dai-cells = <0>;
>> +
>
> Spurious newline.
>
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>
> Missing newline.
>
>> +			wm9713: audio-codec@0 {
>> +				reg = <0>;
>> +				compatible = "ac97,574d,4c13";
>> +				clocks = <&wm9713_bitclk>;
>> +				clock-names = "ac97_clk";
>> +				#sound-dai-cells = <0>;
>> +
>> +				wm9713_bitclk: ac97_bitclk {
>> +					compatible = "fixed-clock";
>> +					#clock-cells = <0>;
>> +					clock-frequency =
>> <12285000>;
>> +					status = "okay";
>> +				};
>> +			};
>
> While a few device trees seem to use audio-codec just codec would work
> too.
Ok.

>> +		};
>> +
>> +		pxa_pcm_audio: snd_soc_pxa_audio {
>> +			compatible = "mrvl,pxa-pcm-audio";
>> +			#sound-dai-cells = <0>;
>> +			status = "okay";
>> +		};
>
> I believe node names should not contain underscores therefore suggest
> chaning snd_soc_pxa_audio to snd-soc-pxa-audio.
Ok.
>
>> +		lcd-controller@40500000 {
>> +			lcd-supply = <&lcd_vmmc>;
>> +		};
>> +
>> +		docg3: flash@0 {
>> +			compatible = "m-systems,diskonchip-g3";
>> +			reg = <0x0 0x2000>;
>> +		};
>> +
>
> Spurious newline.
>
>> +	};
>> +
>> +	reg_vmmc: regulator@0 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vmmc";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>
> Spurious newline.
>
>> +		gpio = <&gpio 91 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +	};
>
> I guess that @0 is a legacy from when we used a fake regulator simple
> bus and nowadays regulator-vmmc is more common.
Ok.

> Same for the @1 here and usually, for regulator labels the reg_ prefix
> is used.
Ok.

Cheers.

-- 
Robert
