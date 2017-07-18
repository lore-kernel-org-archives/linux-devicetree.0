From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] mfd: syscon: atmel-smc: add helper to retrieve
 register layout
Date: Tue, 18 Jul 2017 10:12:38 +0100
Message-ID: <20170718091238.wweaobzccdlgv5dh@dell>
References: <20170711074015.30440-1-ludovic.desroches@microchip.com>
 <20170711074015.30440-3-ludovic.desroches@microchip.com>
 <20170718081508.yo6uld5ip5hr6ipk@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170718081508.yo6uld5ip5hr6ipk@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, boris.brezillon@free-electrons.com, computersforpeace@gmail.com
List-Id: devicetree@vger.kernel.org

On Tue, 18 Jul 2017, Lee Jones wrote:

> On Tue, 11 Jul 2017, Ludovic Desroches wrote:
> 
> > For HSMC controller, the register layout depends on the device i.e. the
> > offset of setup, pulse, cycle, mode and timings registers is not the
> > same. An helper is added to provide the correct register layout.
> > 
> > Fixes: fe9d7cb22ef3 ("mfd: syscon: atmel-smc: Add new helpers to ease
> > SMC regs manipulation")
> > Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> > ---
> >  drivers/memory/atmel-ebi.c               | 13 +++++--
> >  drivers/mfd/atmel-smc.c                  | 67 +++++++++++++++++++++++++-------
> >  drivers/mtd/nand/atmel/nand-controller.c | 10 +++--
> >  include/linux/mfd/syscon/atmel-smc.h     | 32 ++++++++++-----
> >  4 files changed, 92 insertions(+), 30 deletions(-)
> 
> Applied, thanks.

Apologies, it looks like this needs 2 more Acks before I can even
consider taking it.

Unapplied.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
