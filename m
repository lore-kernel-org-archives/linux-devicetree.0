From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: armada-385-synology-ds116: add support for
 Synology DS116 NAS
Date: Sun, 12 Feb 2017 01:40:31 +0100
Message-ID: <20170212004031.GA7328@lunn.ch>
References: <1486805073-15534-1-git-send-email-w@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486805073-15534-1-git-send-email-w-K+wRfnb2/UA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Willy Tarreau <w@1wt.eu>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> +			serial@12000 {
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&uart0_pins>;
> +				status = "okay";
> +			};
> +
> +			serial@12100 {
> +				/* A PIC16F1829 is connected to uart1 at 115200 bps,
> +				 * and takes single-character orders :
> +				 *   "1" : power off

Hi Willy

The qnap-poweroff.c driver will support this. You need a new
compatible string, since 115200 is not the speed the current synology
devices use.

> +				 *   "2" : short beep
> +				 *   "3" : long beep
> +				 *   "4" : turn the power LED ON
> +				 *   "5" : flash the power LED
> +				 *   "6" : turn the power LED OFF
> +				 *   "7" : turn the status LED OFF
> +				 *   "8" : turn the status LED ON
> +				 *   "9" : flash the status LED
> +				 *   "A" : flash the motherboard LED (D8)
> +				 *   "B" : turn the motherboard LED OFF
> +				 *   "C" : hard reset
> +				 */
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&uart1_pins>;
> +				status = "okay";
> +			};

> +		gpio-leds {
> +			compatible = "gpio-leds";
> +
> +			/* The greed part is on gpio0.20 which is also used by

green?


Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
