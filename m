From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/4] irqchip: bcm2835: If a parent interrupt is registered,
 chain from it.
Date: Tue, 21 Jul 2015 20:08:29 -0600
Message-ID: <55AEFB1D.6090108@wwwdotorg.org>
References: <1436837718-956-1-git-send-email-eric@anholt.net> <1436837718-956-3-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436837718-956-3-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/13/2015 07:35 PM, Eric Anholt wrote:
> The BCM2836 (Raspberry Pi 2) uses two levels of interrupt handling
> with the CPU-local interrupts being the root, so we need to register
> ours as chained off of the CPU's local interrupt.

Sorry for the slow review; laziness after vacation!

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt

> +The BCM2836 contains the same interrupt controller with the same
> +interrupts, but the per-CPU interrupt controller is the root, and an
> +interrupt there indicates that the ARMCTRL has an interrupt to handle.
> +
>  Required properties:
>  
>  - compatible : should be "brcm,bcm2835-armctrl-ic"

Since there are some differences between the bcm2835 and bcm2836 HW
blocks, I'd expect the compatible value to be different for each. In
particular...

> +Optional properties:
> +- interrupt-parent : Specifies the parent interrupt controller when this
> +  controller is the second level.
> +- interrupts : Specifies the interrupt on the parent for this interrupt
> +  controller to handle.

I'd classify that as "additional required properties for
brcm,bcm2836-armctrl-ic"

... and with different compatible values for the two chips, you would
know when probe() should require vs. reject the property.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
