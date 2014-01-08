From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/2] Documentation: Add GPIO reset binding to reset binding documentation
Date: Wed, 8 Jan 2014 17:08:26 +0100
Message-ID: <201401081708.26679.arnd@arndb.de>
References: <1389179464-11963-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389179464-11963-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 08 January 2014, Philipp Zabel wrote:
> += GPIO Reset consumers =
> +
> +For the common case of reset lines controlled by GPIOs, the GPIO binding
> +documented in devicetree/bindings/gpio/gpio.txt should be used:
> +
> +Required properties:
> +reset-gpios or         Reset GPIO using standard GPIO bindings,
> +<name>-reset-gpios:    optionally named to specify the reset line
> +
> +Optional properties:
> +reset-boot-asserted or         Boolean. If set, the corresponding reset is
> +<name>-reset-boot-asserted:    initially asserted and should be kept that way
> +                               until released by the driver.

I don't get this one. Why would you use a different reset binding for the case
where the reset line is connected to the gpio controller rather than a
specialized reset controller?

I was expecting to see the definition of a generic reset controller that
in turn uses gpio lines, like


	reset {	
		compatible = "gpio-reset";
		/* provides three reset lines through these GPIOs */
		gpios = <&gpioA 1 &gpioB 7 <gpioD 17>;
		#reset-cells = <1>;
	};

	foo {
		...
		resets = <&reset 0>; /* uses first reset line of the gpio-reset controller */
	};

I realize it would be a little more verbose, but it also seems more
regular and wouldn't stand out from the rest of the reset interfaces.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
