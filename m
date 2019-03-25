From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] edac: sifive: Add EDAC driver for SiFive FU540-C000
 chip
Date: Mon, 25 Mar 2019 14:26:52 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1903251418440.8028@viisi.sifive.com>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com> <1553082728-9232-3-git-send-email-yash.shah@sifive.com> <alpine.DEB.2.21.9999.1903241558210.8028@viisi.sifive.com> <20190325065737.GD12016@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325065737.GD12016@zn.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, mchehab@kernel.org, devicetree@vger.kernel.org, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On Mon, 25 Mar 2019, Borislav Petkov wrote:

> On Sun, Mar 24, 2019 at 05:23:27PM -0700, Paul Walmsley wrote:
> > > +	if (!IS_ENABLED(CONFIG_EDAC_DEBUG))
> > > +		return;
> > 
> > Can all of these debugfs functions be wrapped with an #if ... #endif such 
> > that, if CONFIG_EDAC_DEBUG is not set, they will all be stripped out by 
> > the preprocessor?
> 
> Why would you make the code more ugly with ifdeffery?
> 
> Do you have any serious code size constraints so that you absolutely
> need to remove a couple of KBs?

We'll definitely take the RAM savings that a few #ifdefs will deliver to 
us.  They add up.  We're selling chips for embedded use cases, not just 
big-iron x86 systems.

Other EDAC drivers have far more #ifdef lines than the single set that I'm 
proposing, so I don't understand why you're singling this driver out for 
criticism.  Consider:

./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_SDRAM
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_L2C
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_OCRAM
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_OCRAM
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_L2C
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_ETHERNET
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_NAND
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_DMA
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_USB
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_QSPI
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_SDMMC
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_L2C
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_OCRAM
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_ETHERNET
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_NAND
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_DMA
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_USB
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_QSPI
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_SDMMC
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_SDRAM
./synopsys_edac.c:#ifdef CONFIG_EDAC_DEBUG
./synopsys_edac.c:#ifdef CONFIG_EDAC_DEBUG
./synopsys_edac.c:#ifdef CONFIG_EDAC_DEBUG
./synopsys_edac.c:#ifdef CONFIG_EDAC_DEBUG
./synopsys_edac.c:#ifdef CONFIG_EDAC_DEBUG


- Paul
