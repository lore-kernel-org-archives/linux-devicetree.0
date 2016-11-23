From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v3 2/2] DW DMAC: add multi-block property to device tree
Date: Wed, 23 Nov 2016 09:45:13 +0530
Message-ID: <20161123041513.GF2698@localhost>
References: <1479496356-27834-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479496356-27834-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479497593.22212.45.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479497593.22212.45.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, linux-snps-arc@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 18, 2016 at 09:33:13PM +0200, Andy Shevchenko wrote:
> > @@ -1569,7 +1569,7 @@ int dw_dma_probe(struct dw_dma_chip *chip)
> >  				(dwc_params >> DWC_PARAMS_MBLK_EN &
> > 0x1) == 0;
> >  		} else {
> >  			dwc->block_size = pdata->block_size;
> > -			dwc->nollp = pdata->is_nollp;
> > +			dwc->nollp = pdata->multi_block[i];
> 
> You missed the point. You assign positive value to negative variable.
> It's a bug. Have you tested this? How?
> 
> In case of positive property you have to update DTS. By the way, I'm
> pretty sure that spare13xx boards has auto configuration enabled, though
> it has to be checked with vendor (I assume you may have fast response
> from them).

Yeah why are we not using auto configuration here would be the first
question..

-- 
~Vinod
