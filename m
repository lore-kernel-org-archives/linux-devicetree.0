From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: kirkwood: add Seagate GoFlex Home
Date: Thu, 5 Nov 2015 01:23:19 +0100
Message-ID: <20151105002319.GA8942@lunn.ch>
References: <1446675888-24495-1-git-send-email-luka.perkov@sartura.hr>
 <00000150d49a8745-1c2bc8d4-1333-46bb-bf0e-5508ef988c73-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <00000150d49a8745-1c2bc8d4-1333-46bb-bf0e-5508ef988c73-000000-p/GC64/jrecnJqMo6gzdpkEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Luka Perkov <luka.perkov-RnoqsreqS2Fd2+I6+x7OVA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

> +	chosen {
> +		bootargs = "console=ttyS0,115200n8 earlyprintk root=/dev/sda1 rootdelay=10";

It is not normal to specify the root device. Is this really required?
And rootdelay is also unusual.

> +		stdout-path = &uart0;
> +	};
> +
> +	ocp@f1000000 {
> +		pinctrl: pin-controller@10000 {
> +			pmx_usb_power_enable: pmx-usb-power-enable {
> +				marvell,pins = "mpp29";
> +				marvell,function = "gpio";
> +			};
> +			pmx_led_white: pmx-led-white {
> +				marvell,pins = "mpp40";
> +				marvell,function = "gpio";
> +			};
> +			pmx_led_green: pmx-led_green {
> +				marvell,pins = "mpp46";

That last _ should be -..

> +				marvell,function = "gpio";
> +			};
> +			pmx_led_orange: pmx-led-orange {
> +				marvell,pins = "mpp47";
> +				marvell,function = "gpio";
> +			};
> +		};
> +		serial@12000 {
> +			status = "ok";
> +		};
> +
> +		sata@80000 {
> +			status = "okay";
> +			nr-ports = <2>;
> +		};
> +
> +	};
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		health {
> +			label = "status:green:health";

This does not fit the naming convention. status should be the machine
name.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
