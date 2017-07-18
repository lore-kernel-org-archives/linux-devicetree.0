From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] mfd: syscon: atmel-smc: add helper to retrieve
 register layout
Date: Tue, 18 Jul 2017 10:37:13 +0100
Message-ID: <20170718093713.stqshzuuv3l7pfve@dell>
References: <20170711074015.30440-1-ludovic.desroches@microchip.com>
 <20170711074015.30440-3-ludovic.desroches@microchip.com>
 <20170718081508.yo6uld5ip5hr6ipk@dell>
 <20170718091238.wweaobzccdlgv5dh@dell>
 <02a0c390-610c-d38b-e6a3-f04120c6fbb3@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <02a0c390-610c-d38b-e6a3-f04120c6fbb3-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 18 Jul 2017, Nicolas Ferre wrote:

> On 18/07/2017 at 11:12, Lee Jones wrote:
> > On Tue, 18 Jul 2017, Lee Jones wrote:
> > 
> >> On Tue, 11 Jul 2017, Ludovic Desroches wrote:
> >>
> >>> For HSMC controller, the register layout depends on the device i.e. the
> >>> offset of setup, pulse, cycle, mode and timings registers is not the
> >>> same. An helper is added to provide the correct register layout.
> >>>
> >>> Fixes: fe9d7cb22ef3 ("mfd: syscon: atmel-smc: Add new helpers to ease
> >>> SMC regs manipulation")
> >>> Suggested-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>> Signed-off-by: Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> >>> ---
> >>>  drivers/memory/atmel-ebi.c               | 13 +++++--
> >>>  drivers/mfd/atmel-smc.c                  | 67 +++++++++++++++++++++++++-------
> >>>  drivers/mtd/nand/atmel/nand-controller.c | 10 +++--
> >>>  include/linux/mfd/syscon/atmel-smc.h     | 32 ++++++++++-----
> >>>  4 files changed, 92 insertions(+), 30 deletions(-)
> >>
> >> Applied, thanks.
> > 
> > Apologies, it looks like this needs 2 more Acks before I can even
> > consider taking it.
> > 
> > Unapplied.
> 
> If mine is missing, here it is:
> 
> For the whole series:
> Acked-by: Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> 
> And I think that Alexandre seemed okay by discussing the path those
> patches should take...

Thanks Anlexadre and Nicolas.

Patch does not apply to v4.13-rc1 however.

Ludovic,

Could you please rebase this patch and apply the 2 new Acks please?

Please also apply my:

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

... and I'll get it applied ASAP.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
