From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 5/9] ARM: BCM2836: Add io map initialization for bcm2836.
Date: Fri, 24 Apr 2015 09:16:12 +0200
Message-ID: <3157838.P6rILgE4M2@wuerfel>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <1429639796-2169-6-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429639796-2169-6-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 21 April 2015 11:09:52 Eric Anholt wrote:
> +
> +DT_MACHINE_START(BCM2836, "BCM2836")
> +       .map_io = bcm2836_map_io,
> +       .init_irq = irqchip_init,
> +       .init_machine = bcm2835_init,
> +       .restart = bcm2835_restart,
> +       .dt_compat = bcm2836_compat
> +MACHINE_END

I've just looked at the other callbacks you have here, and I think
it would be easy enough to remove them as well:

- .init_irq is already pointless, you can just remove the line here
  without any effect

- bcm2835_restart can be moved to the drivers/watchdog/bcm2835_wdt.c
  driver, which already knows the registers. Just use
  register_restart_handler() in its probe function, and perhaps add
  a 'select' statement to ensure that the driver is included in kernel
  builds

- I'm not completely sure about the plans for the clock handler, but
  no proper clock driver has surfaced so far, and the clocks could just
  all be declared in DT as fixed rate clocks.

  Is anyone working on a proper clk driver here?

- once bcm2835_restart is gone from bcm2835.c and the clocks are handled
  in DT, the bcm2835_init() function can be removed as well.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
