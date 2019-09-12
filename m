From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [RFC 3/3] dmaengine: Support for requesting channels preferring
 DMA domain controller
Date: Thu, 12 Sep 2019 22:19:41 +0530
Message-ID: <20190912164941.GC4392@vkoul-mobl>
References: <20190906141816.24095-1-peter.ujfalusi@ti.com>
 <20190906141816.24095-4-peter.ujfalusi@ti.com>
 <20190908121507.GN2672@vkoul-mobl>
 <0bd4d678-31be-bead-7591-0452b6fed5f2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0bd4d678-31be-bead-7591-0452b6fed5f2@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: robh+dt@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09-09-19, 08:56, Peter Ujfalusi wrote:

> >> -struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask)
> >> +struct dma_chan *dma_domain_request_chan_by_mask(struct device *dev,
> >> +						 const dma_cap_mask_t *mask)
> > 
> > should we really use dma_request_chan_by_mask() why not create a new api
> > dma_request_chan_by_domain() and use that, it falls back to
> > dma_request_chan_by_mask() if it doesnt find a valid domain!
> 
> So:
> struct dma_chan *dma_request_chan_by_domain(struct device *dev,
> 					    const dma_cap_mask_t *mask);

Yeah that looks better to me :)

-- 
~Vinod
