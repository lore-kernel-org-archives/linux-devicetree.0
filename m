From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: bcm2835: dt: Add Raspberry Pi Model A+
Date: Tue, 20 Oct 2015 20:20:19 -0600
Message-ID: <5626F663.1050609@wwwdotorg.org>
References: <1444592237-12433-1-git-send-email-lkundrak@v3.sk>
 <1444592237-12433-3-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444592237-12433-3-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/11/2015 01:37 PM, Lubomir Rintel wrote:
> Essentially the same as B+.

(It'd be good practice to CC RPi patches to the ARM kernel mailing list too)

> diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts

> +	leds {
> +		act {
> +			gpios = <&gpio 47 0>;
> +		};
> +
> +		pwr {
> +			label = "PWR";
> +			gpios = <&gpio 35 0>;
> +			default-state = "keep";
> +			linux,default-trigger = "default-on";
> +		};
> +	};

Since the A+ and B+ are so similar, I wonder if it makes sense to
sometime create a shared "plus" .dtsi file for the shared parts?

Same for the I2S below.

Perhaps the DTs are so simple that it's a waste of complexity to do that
though.

Out of curiosity, are you planning on creating DT files for all the
possible options:

		"bcm2835-rpi-a.dtb",
		"bcm2835-rpi-a-plus.dtb",
		"bcm2835-rpi-b.dtb",
		"bcm2835-rpi-b-i2c0.dtb",
		"bcm2835-rpi-b-plus.dtb",
		"bcm2835-rpi-b-rev2.dtb",
		"bcm2835-rpi-cm.dtb",
		"bcm2836-rpi-2-b.dtb",

(list taken from U-Boot's board/raspberrypi/rpi/rpi.c)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
