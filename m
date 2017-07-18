From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 2/3] mfd: syscon: atmel-smc: add helper to retrieve
 register layout
Date: Tue, 18 Jul 2017 11:56:31 +0200
Message-ID: <20170718095631.xz6p2u74z4i2n2lj@rfolt0960.corp.atmel.com>
References: <20170711074015.30440-1-ludovic.desroches@microchip.com>
 <20170711074015.30440-3-ludovic.desroches@microchip.com>
 <20170718081508.yo6uld5ip5hr6ipk@dell>
 <20170718091238.wweaobzccdlgv5dh@dell>
 <02a0c390-610c-d38b-e6a3-f04120c6fbb3@microchip.com>
 <20170718093713.stqshzuuv3l7pfve@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170718093713.stqshzuuv3l7pfve@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, boris.brezillon@free-electrons.com, computersforpeace@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 10:37:13AM +0100, Lee Jones wrote:
> On Tue, 18 Jul 2017, Nicolas Ferre wrote:
> 
> > On 18/07/2017 at 11:12, Lee Jones wrote:
> > > On Tue, 18 Jul 2017, Lee Jones wrote:
> > > 
> > >> On Tue, 11 Jul 2017, Ludovic Desroches wrote:
> > >>
> > >>> For HSMC controller, the register layout depends on the device i.e. the
> > >>> offset of setup, pulse, cycle, mode and timings registers is not the
> > >>> same. An helper is added to provide the correct register layout.
> > >>>
> > >>> Fixes: fe9d7cb22ef3 ("mfd: syscon: atmel-smc: Add new helpers to ease
> > >>> SMC regs manipulation")
> > >>> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > >>> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> > >>> ---
> > >>>  drivers/memory/atmel-ebi.c               | 13 +++++--
> > >>>  drivers/mfd/atmel-smc.c                  | 67 +++++++++++++++++++++++++-------
> > >>>  drivers/mtd/nand/atmel/nand-controller.c | 10 +++--
> > >>>  include/linux/mfd/syscon/atmel-smc.h     | 32 ++++++++++-----
> > >>>  4 files changed, 92 insertions(+), 30 deletions(-)
> > >>
> > >> Applied, thanks.
> > > 
> > > Apologies, it looks like this needs 2 more Acks before I can even
> > > consider taking it.
> > > 
> > > Unapplied.
> > 
> > If mine is missing, here it is:
> > 
> > For the whole series:
> > Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> > 
> > And I think that Alexandre seemed okay by discussing the path those
> > patches should take...
> 
> Thanks Anlexadre and Nicolas.
> 
> Patch does not apply to v4.13-rc1 however.
> 
> Ludovic,
> 
> Could you please rebase this patch and apply the 2 new Acks please?
> 
> Please also apply my:
> 
> For my own reference:
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 

Ok, I'll rebase the patch on top of v4.13-rc1 and resend it.

Ludovic

> ... and I'll get it applied ASAP.
> 
> -- 
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org │ Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
