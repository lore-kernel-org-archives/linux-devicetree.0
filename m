From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] dma: of: Move the functions under CONFIG_OF_DMA instead of CONFIG_OF
Date: Fri, 28 Feb 2014 15:47:34 +0100
Message-ID: <5615884.O4eVkOuQqe@wuerfel>
References: <1393546850-13907-1-git-send-email-santosh.shilimkar@ti.com> <6287295.Q1WPJPjeZV@wuerfel> <53109C1B.2030606@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53109C1B.2030606-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 28 February 2014 09:24:27 Santosh Shilimkar wrote:
> So for ARM 'allnoconfig' build we have CONFIG_OF enabled but
> CONFIG_DMA_OF disabled. With that the of-dma.c gets compiled
> out leaving the functions from of-dma.h undefined. I noticed
> this while adding couple of exports in of_dma.h

Looking at current linux-next, I find

Kconfig:

menuconfig DMADEVICES
        bool "DMA Engine support"
...
if DMADEVICES

config DMA_OF
        def_bool y
        depends on OF

endif

This means that DMA_OF is disabled in 'allnoconfig' since DMADEVICES
is also disabled, as you say. The Makefile looks like

obj-$(CONFIG_DMA_OF) += of-dma.o

As of 5fa422c922c25 "dmaengine: move drivers/of/dma.c -> drivers/dma/of-dma.c"

which seems to solve the problem already.

> I am not sure but we added couple of functions for dma-ranges
> and dma-coherent which gets called from generic code.

These functions have nothing to do with the dmaengine code though,
they should be in a different file.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
