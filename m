From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RESEND 2/2] arm64: dts: meson: add libretech aml-s805x-ac
 board
Date: Thu, 15 Nov 2018 10:13:28 +0100
Message-ID: <4c2aae46-e34e-aeb4-339d-00a4f4cbf3e7@baylibre.com>
References: <20181114101925.10526-3-jbrunet@baylibre.com>
 <20181114103855.14571-1-jbrunet@baylibre.com>
 <87a7mbvi6y.fsf@dell.be.48ers.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87a7mbvi6y.fsf@dell.be.48ers.dk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Korsgaard <peter@korsgaard.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14/11/2018 15:37, Peter Korsgaard wrote:
>>>>>> "Jerome" == Jerome Brunet <jbrunet@baylibre.com> writes:
> 
>  > From: Neil Armstrong <narmstrong@baylibre.com>
>  > Add Libretech aml-s805x-ac board (aka 'La Frite') support
> 
>  > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>  > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>  > ---
> 
> ..
> 
>  > +#include "meson-gxl-s905x.dtsi"
>  > +
>  > +/ {
>  > +	compatible = "libretech,aml-s805x-ac", "amlogic,s805x",
>  > +		     "amlogic,meson-gxl";
>  > +	model = "Libre Computer Board AML-S805X-AC";
> 
> No mention of 'La Frite'?

It's a codename, the actual product name is AML-S805X-AC

> 
>  > +	memory@0 {
>  > +		device_type = "memory";
>  > +		reg = <0x0 0x0 0x0 0x20000000>;
>  > +	};
> 
> Maybe add a comment that there's 1GB variants as well?

Like other board, we set the minimal encountered memory size in DT,
the bootloader will update it to the actual memory size.

> 
>> +
>  > +	vcck: regulator-vcck {
>  > +		compatible = "regulator-fixed";
>  > +		regulator-name = "VCCK";
>  > +		regulator-min-microvolt = <3300000>;
>  > +		regulator-max-microvolt = <3300000>;
>  > +		vin-supply = <&dc_5v>;
>  > +
>  > +		/*
>  > +		 * This is controlled by GPIOAO_9 we reserve this but
>  > +		 * claiming it as done bellow reset the board anyway
> 
> s/bellow/below/

Good catch !

> 
>  > +&spifc {
>  > +	status = "okay";
>  > +	pinctrl-0 = <&nor_pins>;
>  > +	pinctrl-names = "default";
>  > +
>  > +	w25q32: spi-flash@0 {
>  > +		#address-cells = <1>;
>  > +		#size-cells = <1>;
>  > +		compatible = "jedec,spi-nor";
>  > +		reg = <0>;
>  > +		spi-max-frequency = <3000000>;
> 
> Is this 3MHz a limitation of the flash, board layout or SPI controller?
> 

It's the stable clock frequency used by amlogic to access to SPI flash,
we prefer using a safe freq, because we don't need fast access here.

Neil
