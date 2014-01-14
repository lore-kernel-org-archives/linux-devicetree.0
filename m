From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] BCM2835: Add I2S driver to device tree
Date: Mon, 13 Jan 2014 19:57:04 -0700
Message-ID: <52D4A780.7050907@wwwdotorg.org>
References: <52D3CA6E.1010803@koalo.de> <52D3CB18.8040608@koalo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52D3CB18.8040608-oZ8rN/sblLk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Meier <florian.meier-oZ8rN/sblLk@public.gmane.org>
Cc: linux-rpi-kernel <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/13/2014 04:16 AM, Florian Meier wrote:
> This adds the definitions for the BCM2835 I2S driver
> to the device tree. Some GPIO settings are needed for
> the correct pin functions.

Patch 1/1 and the .dtsi portion of patch 2/2 look fine; I can apply
those after 3.14's merge window closes.

However, I don't think I can apply the change to bcm2835-rpi-b.dts in
this patch; those pins are used for the board ID strapping on rev 1
boards, and even on rev 2 boards, they're simply routed to a generic
header, rather than being dedicated for I2S usage. That part of the
patch would be better kept locally in your own kernel tree. Perhaps if
DT overlays ever take off, we can publish it as part of an I2S-specific
overlay.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
