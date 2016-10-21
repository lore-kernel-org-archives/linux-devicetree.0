From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [v7, 1/3] nand: pl353: Add basic driver for arm pl353 smc nand
 interface
Date: Fri, 21 Oct 2016 23:46:11 +0200
Message-ID: <20161021234611.1f737144@bbrezillon>
References: <1433786918-21500-2-git-send-email-punnaia@xilinx.com>
        <20161021203322.GA28655@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161021203322.GA28655@obsidianresearch.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, mark.rutland@arm.com, jussi.kivilinna@iki.fi, linux-doc@vger.kernel.org, artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org, punnaia@xilinx.com, arnd@arndb.de, michal.simek@xilinx.com, ezequiel.garcia@free-electrons.com, grant.likely@linaro.org, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, joern@logfs.org, kpc528@gmail.com, robh+dt@kernel.org, acourbot@nvidia.com, kalluripunnaiahchoudary@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, rob@landley.net, galak@codeaurora.org, ivan.khoronzhuk@ti.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, 21 Oct 2016 14:33:22 -0600
Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:

> On Mon, Jun 08, 2015 at 11:38:36PM +0530, Punnaiah Choudary Kalluri wrote:
> > Add driver for arm pl353 static memory controller nand interface with
> > HW ECC support. This controller is used in xilinx zynq soc for interfacing
> > the nand flash memory.
> > 
> > Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> > Changes in v7:
> >  - Currently not implemented the memclk rate adjustments. I will
> >    look into this later and once the basic driver is accepted.
> >  - Fixed GPL licence ident
> > Changes in v6:
> >  - Fixed the checkpatch.pl reported warnings
> >  - Using the address cycles information from the onfi param page
> >    earlier it is hardcoded to 5 in driver
> > Changes in v5:
> >  - Configure the nand timing parameters as per the onfi spec
> > Changes in v4:
> >  - Updated the driver to sync with pl353_smc driver APIs
> > Changes in v3:
> >  - implemented the proper error codes
> >  - further breakdown this patch to multiple sets
> >  - added the controller and driver details to Documentation section
> >  - updated the licenece to GPLv2
> >  - reorganized the pl353_nand_ecc_init function
> > Changes in v2:
> >  - use "depends on" rather than "select" option in kconfig
> >  - remove unused variable parts
> >  - remove dummy helper and use writel_relaxed directly  
> 
> What is the status of getting this driver merged? I am interested in
> this driver and can provide some help if there are still TODO items.

I'll try to review it next week.

> 
> At the very least I will test it, is there something newer than v7 out
> there?
> 
> Regards,
> Jason
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
