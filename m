From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 0/7] of: setup dma parameters using dma-ranges and dma-coherent
Date: Tue, 22 Apr 2014 17:02:19 +0200
Message-ID: <201404221702.19842.arnd@arndb.de>
References: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com> <20140419182528.414b9b2e@skate>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140419182528.414b9b2e@skate>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gregory =?iso-8859-1?q?Cl=E9ment?= <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 19 April 2014, Thomas Petazzoni wrote:
> 
> I am not sure whether there is an intersection or not, but I wanted to
> mention that the mvebu platform (in mach-mvebu) supports hardware I/O
> coherency, which makes it a coherent DMA platform. However, we are not
> able to use arm_coherent_dma_ops for this platform, because when a
> transfer is being made DMA_FROM_DEVICE, at the end of the transfer, we
> need to perform an I/O barrier to wait for the snooping unit to
> complete its coherency work. So we're coherent, but not with
> arm_coherent_dma_ops: we have our own dma operation implementation (see
> arch/arm/mach-mvebu/coherency.c).

I had completely missed the fact that this support was merged already.

It's an interesting question if this should actually be called
'coherent' or not. It's certainly more coherent than without that
support, but then again, you still can't rely on incoming data to
be visible after a readl() from the device has returned or an MSI
interrupt has been delivered, which is what we normally expect.

In particular, it means you can't really use arm_coherent_dma_alloc(),
which is a shame, since that is a significante performance overhead.

I would hope we can find a way to avoid the platform notifiers for
mvebu as well and come up with a generic way to express this
'semi-coherent' mode. I believe x-gene has a similar issue, and
I wouldn't be surprised if there are others like this.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
