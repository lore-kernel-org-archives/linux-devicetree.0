From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: BCM63XX: add support for BCM63138 SoC
Date: Thu, 6 Mar 2014 20:44:57 -0800
Message-ID: <CAJiQ=7BrCqo3VijjEvt2JLifM0MNGYmAA+VG_YQbSHfyBqsbtg@mail.gmail.com>
References: <1394127959-3159-1-git-send-email-f.fainelli@gmail.com> <53193FEE.4060002@ieee.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53193FEE.4060002-EkmVulN54Sk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Elder <elder-EkmVulN54Sk@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, jpeshkin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 6, 2014 at 7:41 PM, Alex Elder <elder-EkmVulN54Sk@public.gmane.org> wrote:
>> This patchset adds very minimal support for the BCM63138 SoC which is
>> a xDSL SoC using a dual Cortex A9 CPU complex.
>
>
> Why do you use "63xx" for the generic name, when the specific
> part you are defining here is 63138?  I would have expected
> "63xxx".

The product line has a mix of 4-digit and 5-digit part numbers.  The
drivers for onchip peripherals all used "bcm63xx":

$ find drivers/ | grep 63xx
drivers/tty/serial/bcm63xx_uart.c
drivers/pcmcia/bcm63xx_pcmcia.h
drivers/pcmcia/bcm63xx_pcmcia.c
drivers/usb/gadget/bcm63xx_udc.c
drivers/watchdog/max63xx_wdt.c
drivers/watchdog/bcm63xx_wdt.c
drivers/char/hw_random/bcm63xx-rng.c
drivers/mtd/bcm63xxpart.c
drivers/net/phy/bcm63xx.c
drivers/net/ethernet/broadcom/bcm63xx_enet.h
drivers/net/ethernet/broadcom/bcm63xx_enet.c
drivers/spi/spi-bcm63xx.c
drivers/spi/spi-bcm63xx-hsspi.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
