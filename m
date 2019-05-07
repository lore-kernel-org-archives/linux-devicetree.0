From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 07/16] dmaengine: Add function to request slave channel
 from a dma_device
Date: Tue, 7 May 2019 11:37:33 +0300
Message-ID: <89b2ded6-f1f5-dda5-9ae4-d94bcf4c041f@ti.com>
References: <20190506123456.6777-1-peter.ujfalusi@ti.com>
 <20190506123456.6777-8-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190506123456.6777-8-peter.ujfalusi@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, nm@ti.com, ssantosh@kernel.org
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, t-kristo@ti.com, tony@atomide.com
List-Id: devicetree@vger.kernel.org



On 06/05/2019 15.34, Peter Ujfalusi wrote:
> dma_get_any_slave_channel() would skip using the filter function, which
> in some cases needed to be executed before the alloc_chan_resources
> callback to make sure that all parameters are provided for the slave
> channel.

This can be dropped in favor of
https://patchwork.kernel.org/patch/10932299/
from Baolin Wangm and using __dma_request_channel() in the k3-udma driver.

- Péter

> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/dma/dmaengine.c   | 7 ++++---
>  include/linux/dmaengine.h | 5 ++++-
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 8eed5ff0fc01..7ec93be12088 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -617,7 +617,8 @@ struct dma_chan *dma_get_slave_channel(struct dma_chan *chan)
>  }
>  EXPORT_SYMBOL_GPL(dma_get_slave_channel);
>  
> -struct dma_chan *dma_get_any_slave_channel(struct dma_device *device)
> +struct dma_chan *dmadev_get_slave_channel(struct dma_device *device,
> +					  dma_filter_fn fn, void *fn_param)
>  {
>  	dma_cap_mask_t mask;
>  	struct dma_chan *chan;
> @@ -628,13 +629,13 @@ struct dma_chan *dma_get_any_slave_channel(struct dma_device *device)
>  	/* lock against __dma_request_channel */
>  	mutex_lock(&dma_list_mutex);
>  
> -	chan = find_candidate(device, &mask, NULL, NULL);
> +	chan = find_candidate(device, &mask, fn, fn_param);
>  
>  	mutex_unlock(&dma_list_mutex);
>  
>  	return IS_ERR(chan) ? NULL : chan;
>  }
> -EXPORT_SYMBOL_GPL(dma_get_any_slave_channel);
> +EXPORT_SYMBOL_GPL(dmadev_get_slave_channel);
>  
>  /**
>   * __dma_request_channel - try to allocate an exclusive channel
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index c1486564a314..4774b66f2064 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -1541,7 +1541,10 @@ int dmaenginem_async_device_register(struct dma_device *device);
>  void dma_async_device_unregister(struct dma_device *device);
>  void dma_run_dependencies(struct dma_async_tx_descriptor *tx);
>  struct dma_chan *dma_get_slave_channel(struct dma_chan *chan);
> -struct dma_chan *dma_get_any_slave_channel(struct dma_device *device);
> +struct dma_chan *dmadev_get_slave_channel(struct dma_device *device,
> +					  dma_filter_fn fn, void *fn_param);
> +#define dma_get_any_slave_channel(device) \
> +	dmadev_get_slave_channel(device, NULL, NULL)
>  #define dma_request_channel(mask, x, y) __dma_request_channel(&(mask), x, y)
>  #define dma_request_slave_channel_compat(mask, x, y, dev, name) \
>  	__dma_request_slave_channel_compat(&(mask), x, y, dev, name)
> 

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
