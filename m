From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: clps711x: Add basic Cirrus Logic CDB89712 Development board
Date: Fri, 13 May 2016 14:00:35 +0200
Message-ID: <9407200.bOeiVUkGKT@wuerfel>
References: <1463138788-5390-1-git-send-email-shc_work@mail.ru> <1463138788-5390-4-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463138788-5390-4-git-send-email-shc_work-JGs/UdohzUI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 13 May 2016 14:26:28 Alexander Shiyan wrote:
> +&bus {
> +	flash: root@00000000 {
> +		compatible = "cfi-flash";
> +		reg = <0 0x00000000 0x01000000>;
> +		bank-width = <2>;
> +		linux,mtd-name = "physmap-flash.0";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +	};

I've never seen the linux,mtd-name property before, but I think it's
meant to refer to the name of the flash chip, not the
name of the linux device.

> +	aliases {
> +		gpio0 = &porta;
> +		gpio1 = &portb;
> +		gpio2 = &portc;
> +		gpio3 = &portd;
> +		gpio4 = &porte;
> +		serial0 = &uart1;
> +		serial1 = &uart2;
> +		spi0 = &spi;
> +		timer0 = &timer1;
> +		timer1 = &timer2;
> +	};

Please move this into the .dts file: not all boards necessarily have
all of the above.

> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		interrupt-parent = <&intc>;
> +		ranges;

All child devices seem to be in the 0x80000000-0x90000000
range, maybe set the ranges property accordingly?

> +		clks: clks@80000000 {
> +			#clock-cells = <1>;
> +			compatible = "cirrus,clps711x-clk";
> +			reg = <0x80000000 0xc000>;
> +			startup-frequency = <73728000>;
> +		};

Please fix the compatible strings for all devices to not
have 'x' for wildcards. Normally you'd use the name of hte
first chip to have this particular IP block.

> +		intc: intc@80000000 {
> +			compatible = "cirrus,clps711x-intc";
> +			reg = <0x80000000 0x4000>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};

Better make the register ranges non-overlapping. This appears
to start at the same place as the 'clks' node.

> +		porta: gpio@80000000 {
> +			compatible = "cirrus,clps711x-gpio";
> +			reg = <0x80000000 0x1 0x80000040 0x1>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		portb: gpio@80000001 {
> +			compatible = "cirrus,clps711x-gpio";
> +			reg = <0x80000001 0x1 0x80000041 0x1>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};
> +
> +		portc: gpio@80000002 {
> +			compatible = "cirrus,clps711x-gpio";
> +			reg = <0x80000002 0x1 0x80000042 0x1>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			status = "disabled";
> +		};
> +
> +		portd: gpio@80000003 {
> +			compatible = "cirrus,clps711x-gpio";
> +			reg = <0x80000003 0x1 0x80000043 0x1>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +		};

These are all just single bytes. My guess is that there is
actually one IP block that contains all the gpios, not
four identical blocks.

> +		bus: bus@80000180 {
> +			#address-cells = <2>;
> +			#size-cells = <1>;
> +			compatible = "cirrus,clps711x-bus", "simple-bus";
> +			clocks = <&clks CLPS711X_CLK_BUS>;
> +			reg = <0x80000180 0x80>;

If it has registers, it's not a 'simple-bus'. Is this an external
bus controller perhaps?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
