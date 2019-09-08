From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [RFC 3/3] dmaengine: Support for requesting channels preferring
 DMA domain controller
Date: Sun, 8 Sep 2019 17:45:07 +0530
Message-ID: <20190908121507.GN2672@vkoul-mobl>
References: <20190906141816.24095-1-peter.ujfalusi@ti.com>
 <20190906141816.24095-4-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906141816.24095-4-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: robh+dt@kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06-09-19, 17:18, Peter Ujfalusi wrote:
> In case the channel is not requested via the slave API, use the
> of_find_dma_domain() to see if a system default DMA controller is
> specified.
> 
> Add new function which can be used by clients to request channels by mask
> from their DMA domain controller if specified.
> 
> Client drivers can take advantage of the domain support by moving from
> dma_request_chan_by_mask() to dma_domain_request_chan_by_mask()
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/dma/dmaengine.c   | 17 ++++++++++++-----
>  include/linux/dmaengine.h |  9 ++++++---
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 6baddf7dcbfd..087450eed68c 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -640,6 +640,10 @@ struct dma_chan *__dma_request_channel(const dma_cap_mask_t *mask,
>  	struct dma_device *device, *_d;
>  	struct dma_chan *chan = NULL;
>  
> +	/* If np is not specified, get the default DMA domain controller */
> +	if (!np)
> +		np = of_find_dma_domain(NULL);
> +
>  	/* Find a channel */
>  	mutex_lock(&dma_list_mutex);
>  	list_for_each_entry_safe(device, _d, &dma_device_list, global_node) {
> @@ -751,19 +755,22 @@ struct dma_chan *dma_request_slave_channel(struct device *dev,
>  EXPORT_SYMBOL_GPL(dma_request_slave_channel);
>  
>  /**
> - * dma_request_chan_by_mask - allocate a channel satisfying certain capabilities
> - * @mask: capabilities that the channel must satisfy
> + * dma_domain_request_chan_by_mask - allocate a channel by mask from DMA domain
> + * @dev:	pointer to client device structure
> + * @mask:	capabilities that the channel must satisfy
>   *
>   * Returns pointer to appropriate DMA channel on success or an error pointer.
>   */
> -struct dma_chan *dma_request_chan_by_mask(const dma_cap_mask_t *mask)
> +struct dma_chan *dma_domain_request_chan_by_mask(struct device *dev,
> +						 const dma_cap_mask_t *mask)

should we really use dma_request_chan_by_mask() why not create a new api
dma_request_chan_by_domain() and use that, it falls back to
dma_request_chan_by_mask() if it doesnt find a valid domain!

-- 
~Vinod
