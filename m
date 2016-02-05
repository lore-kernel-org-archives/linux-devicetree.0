From: Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: bcm2835: dt: Add the ethernet to the device trees
Date: Fri, 05 Feb 2016 15:25:01 +0100
Message-ID: <m3fux76xqa.fsf@euphor.blino.org>
References: <1454571364-24708-1-git-send-email-lkundrak@v3.sk>
	<1454571364-24708-2-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454571364-24708-2-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org> (Lubomir
	Rintel's message of "Thu, 4 Feb 2016 08:36:03 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, popcornmix <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> writes:

> diff --git a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
[...]
> @@ -33,3 +37,17 @@
>  		brcm,function = <BCM2835_FSEL_ALT0>;
>  	};
>  };
> +
> +&usb {
> +	usb1@1 {
> +		compatible = "usb0424,9514";
> +		reg = <01>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethernet: usbether@1 {
> +			compatible = "usb0424,ec00";
> +			reg = <01>;
> +		};
> +	};
> +};

Hi,

This works for me, after making sure that your u-boot patch gets a
chance to be run (unset usbethaddr from u-boot).

Though, I am not really DT-literate, but shouldn't the ethernet block
use the PID from the ethernet device?
The usbether device is 9514 on RPi2, while ec00 is the hub.

Your patch works, but this works as well after swapping the PIDs.

Thanks

-- 
Olivier Blin - blino
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
