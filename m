From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/7] of: setup dma parameters using dma-ranges and
 dma-coherent
Date: Sat, 19 Apr 2014 18:25:28 +0200
Message-ID: <20140419182528.414b9b2e@skate>
References: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397917972-6293-1-git-send-email-santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gregory =?UTF-8?B?Q2zDqW1lbnQ=?= <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Santosh Shilimkar,

On Sat, 19 Apr 2014 10:32:45 -0400, Santosh Shilimkar wrote:
> Here is an updated version of [2] based on discussion. Series introduces
> support for setting up dma parameters based on device tree properties
> like 'dma-ranges' and 'dma-coherent' and also update to ARM 32 bit port.
> Earlier version of the same series is here [1].
> 
> The 'dma-ranges' helps to take care of few DMAable system memory restrictions
> by use of dma_pfn_offset which we maintain now per device. Arch code then
> uses it for dma address translations for such cases. We update the
> dma_pfn_offset accordingly during DT the device creation process.The
> 'dma-coherent' property is used to setup arch's coherent dma_ops.
> 
> After some off-list discussion with RMK and Arnd, I have now dropped the
> controversial dma_mask setup code from the series which actually isn't blocking
> me as such. Considering rest of the parts of the series are already aligned,
> am hoping to get this version merged for 3.16 merge window.
> 
> We agreed in last discussion that drivers have the ultimate
> responsibility to setup the correct dma mask but then we need to have some
> means to see if bus can support what driver has requested for a case where
> driver request for bigger mask than what bus supports. I can follow up on
> the mask topic if we have broken drivers.

I am not sure whether there is an intersection or not, but I wanted to
mention that the mvebu platform (in mach-mvebu) supports hardware I/O
coherency, which makes it a coherent DMA platform. However, we are not
able to use arm_coherent_dma_ops for this platform, because when a
transfer is being made DMA_FROM_DEVICE, at the end of the transfer, we
need to perform an I/O barrier to wait for the snooping unit to
complete its coherency work. So we're coherent, but not with
arm_coherent_dma_ops: we have our own dma operation implementation (see
arch/arm/mach-mvebu/coherency.c).

However, it seems that your patch series, at least in PATCH 6/7 makes
the assumption that for all DMA coherent platforms,
arm_coherent_dma_ops is going to be OK.

Also, I haven't followed all the discussions, but what is the intended
usage of of_dma_is_coherent() and set_arch_dma_coherent_ops() (device
drivers? platform code?).

In mach-mvebu, what we do is that we register a bus notifier on the
platform bus, so that we can set our custom DMA operations for all
platform devices in the system. Should this be done in a different way
after your series?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
