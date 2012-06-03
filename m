From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v4] MTD: LPC32xx SLC NAND driver
Date: Sun, 3 Jun 2012 21:37:49 +0100
Message-ID: <20120603203749.GD23368@n2100.arm.linux.org.uk>
References: <1338748689-29645-1-git-send-email-stigge@antcom.de> <20120603190932.GB23368@n2100.arm.linux.org.uk> <4FCBBFD4.9090401@antcom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FCBBFD4.9090401@antcom.de>
Sender: linux-doc-owner@vger.kernel.org
To: Roland Stigge <stigge@antcom.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com, dedekind1@gmail.com
List-Id: devicetree@vger.kernel.org

On Sun, Jun 03, 2012 at 09:49:40PM +0200, Roland Stigge wrote:
> Hi!
> 
> Thanks for the suggestions!
> 
> On 03/06/12 21:09, Russell King - ARM Linux wrote:
> >> +	dma_async_issue_pending(host->dma_chan);
> >> +
> >> +	wait_for_completion_timeout(&host->comp, msecs_to_jiffies(1000));
> > 
> > What about unmapping the buffer upon completion?
> 
> OK - by not specifying DMA_COMPL_SKIP_*_UNMAP in flags, I was thinking
> that this happens somehow magically. ;-) But maybe I was just confused.

Slave transfers should never be automatically unmapped by the DMA engine
driver.
