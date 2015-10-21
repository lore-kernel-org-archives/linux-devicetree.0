From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] bcm2835: Add Raspberry Pi thermal sensor to the device
 tree
Date: Tue, 20 Oct 2015 21:03:16 -0600
Message-ID: <56270074.90501@wwwdotorg.org>
References: <1444592937-16320-1-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444592937-16320-1-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/11/2015 01:48 PM, Lubomir Rintel wrote:
> Driven via the Raspberry Pi VideoCore 4 firmware interface.

>  .../bindings/thermal/raspberrypi,bcm2835-thermal.txt        | 13 +++++++++++++
>  arch/arm/boot/dts/bcm2835-rpi.dtsi                          |  5 +++++

There should be a separate patch for the DT binding and DT additions,
but they can be in a series. As before, CC at least the DT binding to
the DT binding maintainers.

> diff --git a/Documentation/devicetree/bindings/thermal/raspberrypi,bcm2835-thermal.txt b/Documentation/devicetree/bindings/thermal/raspberrypi,bcm2835-thermal.txt

> +Raspberry Pi Broadcom BCM2835 thermal control
> +
> +Required properties:

This needs some more explanation of what this is intended to represent
and do. For example, what services is this node (the driver instantiated
by this node) expected to implement, and what firmware services is it
expected to rely upon?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
