From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: bcm283x: Fix fifo size for EP 6,7
Date: Fri, 27 Oct 2017 22:58:24 +0200 (CEST)
Message-ID: <160210128.18582.1509137904239@email.1und1.de>
References: <1507371414-21688-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507371414-21688-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 7. Oktober 2017 um 12:16 geschrieben:
> 
> 
> In case the RPi Zero has at least a device connected to the OTG port
> at boot time, the upper limit of tx fifo size for endpoint 6 and 7 is
> also reduced to 512 bytes. So fix this accordingly.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> Fixes: 1aa1d858f582 ("ARM: dts: bcm283x: Add dtsi for OTG mode")

gentle ping ...

> ---
>  arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
> index e7d217c..b9dff34 100644
> --- a/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
> +++ b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
> @@ -6,5 +6,5 @@
>  	 * According to dwc2 the sum of all device EP
>  	 * fifo sizes shouldn't exceed 3776 bytes.
>  	 */
> -	g-tx-fifo-size = <256 256 512 512 512 768 768>;
> +	g-tx-fifo-size = <256 256 512 512 512 512 512>;
>  };
> -- 
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
