From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 RFC 6/6] ARM: dts: bcm2835: Add Raspberry Pi Zero
Date: Tue, 2 Aug 2016 11:19:00 -0600
Message-ID: <597f3289-91c3-7c19-8992-d6b386d50c02@wwwdotorg.org>
References: <1469559213-16160-1-git-send-email-stefan.wahren@i2se.com>
 <1469559213-16160-7-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469559213-16160-7-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/26/2016 12:53 PM, Stefan Wahren wrote:
> The Raspberry Pi Zero is a minified version of model A+. It's
> notable there is no PWR LED and the ACT LED is inverted.

Patches 3-6,
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/bcm2835-rpi-zero.dts

The following comment format is a bit strange, but I'm not sure there's 
anything objectively better...

> +&usb {
> +	dr_mode = "host";
> +	h-rx-fifo-size = <774>;
> +	h-np-tx-fifo-size = <256>;
> +	h-tx-fifo-size = <512>;
> +/*
> + * Settings for otg
> + *
> +	dr_mode = "otg";
> +	h-rx-fifo-size = <774>;
> +	h-np-tx-fifo-size = <32>;
> +	h-tx-fifo-size = <0>;
> +	g-np-tx-fifo-size = <16>;
> +	g-rx-fifo-size = <256>;
> +	g-tx-fifo-size = <256 128 128 64 64 64 32>;
> + *
> + * Settings for peripheral
> + *
> +	dr_mode = "peripheral";
> +	h-rx-fifo-size = <774>;
> +	h-np-tx-fifo-size = <0>;
> +	h-tx-fifo-size = <0>;
> +	g-np-tx-fifo-size = <16>;
> +	g-rx-fifo-size = <256>;
> +	g-tx-fifo-size = <256 128 128 64 64 64 32>;
> + */
> +};

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
