From: Josh Cartwright <joshc@codeaurora.org>
Subject: Re: [Patch v5 1/2] dmaengine: add Qualcomm BAM dma driver
Date: Tue, 11 Feb 2014 11:49:10 -0600
Message-ID: <20140211174910.GE841@joshc.qualcomm.com>
References: <1391546556-27702-1-git-send-email-agross@codeaurora.org>
 <1391546556-27702-2-git-send-email-agross@codeaurora.org>
 <20140211173048.GP10628@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140211173048.GP10628@intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Andy Gross <agross@codeaurora.org>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 11:00:48PM +0530, Vinod Koul wrote:
> On Tue, Feb 04, 2014 at 02:42:35PM -0600, Andy Gross wrote:
> > Add the DMA engine driver for the QCOM Bus Access Manager (BAM) DMA controller
> > found in the MSM 8x74 platforms.
> > 
> > Each BAM DMA device is associated with a specific on-chip peripheral.  Each
> > channel provides a uni-directional data transfer engine that is capable of
> > transferring data between the peripheral and system memory (System mode), or
> > between two peripherals (BAM2BAM).
> > 
> > The initial release of this driver only supports slave transfers between
> > peripherals and system memory.
> > 
> > Signed-off-by: Andy Gross <agross@codeaurora.org>
>
> > +++ b/drivers/dma/qcom_bam_dma.c
[..]
> > +static void bam_reset_channel(struct bam_chan *bchan)
> > +{
> > +	struct bam_device *bdev = bchan->bdev;
> > +
> > +	/* reset channel */
> > +	writel_relaxed(1, bdev->regs + BAM_P_RST(bchan->id));
> > +	writel_relaxed(0, bdev->regs + BAM_P_RST(bchan->id));
> > +
> > +	/* don't allow reorder of the channel reset */
> > +	wmb();
> Documentation/memory-barriers.txt describes wmb() as a CPU barier but based on
> above you want it to be a compiler barrier then you should do 1st write,
> barrier(), second write.

It could also be that the intent was to prevent these writes from being
ordered before setting the initialized flag below, either way the
comment could be made clearer.

> > +
> > +	/* make sure hw is initialized when channel is used the first time  */
> > +	bchan->initialized = 0;
> > +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
