From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [v7, 1/3] nand: pl353: Add basic driver for arm pl353 smc nand
 interface
Date: Fri, 21 Oct 2016 14:33:22 -0600
Message-ID: <20161021203322.GA28655@obsidianresearch.com>
References: <1433786918-21500-2-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1433786918-21500-2-git-send-email-punnaia@xilinx.com>
Sender: linux-doc-owner@vger.kernel.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, punnaia@xilinx.com
List-Id: devicetree@vger.kernel.org

On Mon, Jun 08, 2015 at 11:38:36PM +0530, Punnaiah Choudary Kalluri wrote:
> Add driver for arm pl353 static memory controller nand interface with
> HW ECC support. This controller is used in xilinx zynq soc for interfacing
> the nand flash memory.
> 
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> Changes in v7:
>  - Currently not implemented the memclk rate adjustments. I will
>    look into this later and once the basic driver is accepted.
>  - Fixed GPL licence ident
> Changes in v6:
>  - Fixed the checkpatch.pl reported warnings
>  - Using the address cycles information from the onfi param page
>    earlier it is hardcoded to 5 in driver
> Changes in v5:
>  - Configure the nand timing parameters as per the onfi spec
> Changes in v4:
>  - Updated the driver to sync with pl353_smc driver APIs
> Changes in v3:
>  - implemented the proper error codes
>  - further breakdown this patch to multiple sets
>  - added the controller and driver details to Documentation section
>  - updated the licenece to GPLv2
>  - reorganized the pl353_nand_ecc_init function
> Changes in v2:
>  - use "depends on" rather than "select" option in kconfig
>  - remove unused variable parts
>  - remove dummy helper and use writel_relaxed directly

What is the status of getting this driver merged? I am interested in
this driver and can provide some help if there are still TODO items.

At the very least I will test it, is there something newer than v7 out
there?

Regards,
Jason
