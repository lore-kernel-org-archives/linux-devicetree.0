From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 1/4] genalloc: add a global pool list, allow to find
 pools by phys address
Date: Thu, 15 Nov 2012 14:25:43 +0100
Message-ID: <1352985943.2399.198.camel@pizza.hi.pengutronix.de>
References: <1350570453-24546-1-git-send-email-p.zabel@pengutronix.de>
	 <1350570453-24546-2-git-send-email-p.zabel@pengutronix.de>
	 <CAP=VYLq9E_bacNQpczQVbOZzYq4eznMPdmMaVMu3oV9Z3q_9pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP=VYLq9E_bacNQpczQVbOZzYq4eznMPdmMaVMu3oV9Z3q_9pw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Shawn Guo <shawn.guo@linaro.org>, Richard Zhao <richard.zhao@freescale.com>, Huang Shijie <shijie8@gmail.com>, Dong Aisheng <dong.aisheng@linaro.org>, Matt Porter <mporter@ti.com>, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

Am Freitag, den 26.10.2012, 15:46 -0400 schrieb Paul Gortmaker: 
> On Thu, Oct 18, 2012 at 10:27 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > This patch keeps all created pools in a global list and adds two
> > functions that allow to retrieve the gen_pool pointer from a known
> > physical address and from a device tree node.
> 
> So, I'm not seeing any added users of the of_get_named_gen_pool,
> or the other exported "reverse-lookup" function.  Without that, the
> anticipated use case is not clear to me.

My use case is the coda video codec driver, for a video codec IP core
that is integrated in various SoCs. It can use on-SoC SRAM as temporary
memory.

Other possible use cases are the TI Davinci sound driver.
Or the PXA frame buffer driver could allocate a frame buffer in SRAM for
low-resolution devices.

> Is there an example of some pending driver or similar, that has
> a phys addr from an unknown source and needs to know what
> pool it may or may not be in?  With the use case, someone might
> be able to suggest alternative ways to get what you want done.

drivers/media/platform/coda.c right now uses imx specific
iram_alloc/free wrappers around gen_pool_alloc/free.
I'd like to use of_get_named_gen_pool to obtain the struct gen_pool
pointer and use gen_pool_alloc/free directly, instead.

sound/soc/davinci/davinci-pcm.c right now uses davinci specific
sram_alloc/free wrappers around gen_pool_alloc/free.

drivers/dma/mmp_tdma.c and sound/soc/pxa/mmp-pcm.c already use
gen_pool_alloc/free directly, but they use a arch-mmp specific
sram_get_gpool function to obtain the struct gen_pool pointer.

> It might also be worth cross compiling this for powerpc, since the
> header files you implicitly get included varies from one arch to
> the next, and there might be some compile fails lurking there.

Thanks, I'll do that.

regards
Philipp
