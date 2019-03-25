From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] sifive: edac: Add EDAC driver for Sifive l2 Cache
 Controller
Date: Mon, 25 Mar 2019 14:18:39 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1903251211190.8028@viisi.sifive.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com> <1552382461-13051-3-git-send-email-yash.shah@sifive.com> <20190312092842.GC28589@zn.tnic> <alpine.DEB.2.21.9999.1903241705460.8028@viisi.sifive.com> <20190325065453.GC12016@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325065453.GC12016@zn.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, mchehab@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Mar 2019, Borislav Petkov wrote:

> On Sun, Mar 24, 2019 at 05:16:17PM -0700, Paul Walmsley wrote:
> > Looking at the Synopsys,
> 
> Look again at synopsys_edac.
>
> >  Highbank,
> 
> Yes, that one and octeon.
> 
> > PowerPC 4xx, and
> 
> also a single ppc4xx_edac driver.
>
> > TI EDAC drivers,
> 
> There's TI drivers, plural? 
>
> I see only ti_edac.c. Also, per-vendor.

All of these drivers are for single IP blocks.  Mostly DRAM controllers.  
There's no "platform EDAC manager" IP block in these cases.

> > all of those are clearly for IP block error management, rather than
> > platform error management. Has the upstream guidance changed since
> > those drivers were merged?
> 
> There are others which are per-platform and work just fine this way:
> xgene_edac, altera_edac, layerscape_edac, qcom_edac, synopsys_edac...

Of your list, only xgene_edac, altera_edac, and qcom_edac have something 
that resembles a platform error manager.  The others are just for 
individual IP blocks.

> > The core issue for us is that we don't have a generalized "ECC management" 
> > IP block.  And I would just as soon not fake one in the DT data, since the 
> > general DT guidance is that the data in DT is meant to describe the actual 
> > hardware.
> 
> Look at how the others I mentioned above do it.

The Synopsys case is illustrative.  Synopsys doesn't have a unified EDAC 
platform; they don't sell chips.  SoC vendors (like Xilinx) take some 
Synopsys IP blocks (like the memory controller), perhaps others from a 
different IP vendor like ARM or Cadence, and integrate them into their 
SoCs to create their own platforms.  They often combine a Synopsys memory 
controller with an ARM L2 cache controller.  But both of those IP blocks 
might be able to detect and report ECC errors.

So as a result of these EDAC limitations, Xilinx hacked their platform 
code into the synopsys_edac driver:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/edac/synopsys_edac.c#n901

The problem with this is that it is backwards.  The Zynq platform has 
other sources of ECC notifications and errors, beyond the Synopsys 
DDR controller:

https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf

So the EDAC "platform," if there is one, would be Xilinx Zynq, not 
Synopsys.  Probably this hasn't been a problem so far because:

1. Xilinx hasn't upstreamed any support for the other EDAC sources on the 
chip; and

2. no other SoC vendors using the Synopsys memory controller have bothered 
to upstream EDAC support for their platform

> The problem with per IP block is that if those compilation units would
> need to share info or communicate, then that is impossible nowadays and
> you'd need to build something on your own.
> 
> Also, the EDAC core supports only one driver.

OK.  Would you have a preference between these two options:

1.  We could modify the EDAC subsystem to support different EDAC data 
sources from different vendors.  This would avoid duplicating code for 
different platforms that combine EDAC data sources from different IP 
blocks.  (This seems to me like the better long-term approach.)

2.  We could create a platform driver for the "SiFive FU540-C000 EDAC" 
reporting platform that wouldn't map to any hardware block, but would call 
functions exported by other sources of EDAC data - most likely drivers 
living in separate directories.  If, for example, we wind up using a 
Synopsys memory controller in a future product, we move the Synopsys code 
into a separate library, and move the Xilinx Zynq-specific code into a 
zynq_edac driver, etc. 

Or perhaps you have another idea?


- Paul
