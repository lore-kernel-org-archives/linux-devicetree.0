From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH v3 05/14] dmaengine: Add support for reporting DMA cached
 data amount
Date: Wed, 9 Oct 2019 12:17:47 +0300
Message-ID: <b20087a9-6a1f-6e5c-9311-e921a1c63f13@ti.com>
References: <20191001061704.2399-1-peter.ujfalusi@ti.com>
 <20191001061704.2399-6-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001061704.2399-6-peter.ujfalusi@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, vkoul@kernel.org, robh+dt@kernel.org, nm@ti.com, ssantosh@kernel.org
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, tony@atomide.com, j-keerthy@ti.com
List-Id: devicetree@vger.kernel.org

On 01/10/2019 09:16, Peter Ujfalusi wrote:
> A DMA hardware can have big cache or FIFO and the amount of data sitting in
> the DMA fabric can be an interest for the clients.
> 
> For example in audio we want to know the delay in the data flow and in case
> the DMA have significantly large FIFO/cache, it can affect the latenc/delay
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

Reviewed-by: Tero Kristo <t-kristo@ti.com>

> ---
>   drivers/dma/dmaengine.h   | 8 ++++++++
>   include/linux/dmaengine.h | 2 ++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/dma/dmaengine.h b/drivers/dma/dmaengine.h
> index 501c0b063f85..b0b97475707a 100644
> --- a/drivers/dma/dmaengine.h
> +++ b/drivers/dma/dmaengine.h
> @@ -77,6 +77,7 @@ static inline enum dma_status dma_cookie_status(struct dma_chan *chan,
>   		state->last = complete;
>   		state->used = used;
>   		state->residue = 0;
> +		state->in_flight_bytes = 0;
>   	}
>   	return dma_async_is_complete(cookie, complete, used);
>   }
> @@ -87,6 +88,13 @@ static inline void dma_set_residue(struct dma_tx_state *state, u32 residue)
>   		state->residue = residue;
>   }
>   
> +static inline void dma_set_in_flight_bytes(struct dma_tx_state *state,
> +					   u32 in_flight_bytes)
> +{
> +	if (state)
> +		state->in_flight_bytes = in_flight_bytes;
> +}
> +
>   struct dmaengine_desc_callback {
>   	dma_async_tx_callback callback;
>   	dma_async_tx_callback_result callback_result;
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 40d062c3b359..02ceef95340a 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -682,11 +682,13 @@ static inline struct dma_async_tx_descriptor *txd_next(struct dma_async_tx_descr
>    * @residue: the remaining number of bytes left to transmit
>    *	on the selected transfer for states DMA_IN_PROGRESS and
>    *	DMA_PAUSED if this is implemented in the driver, else 0
> + * @in_flight_bytes: amount of data in bytes cached by the DMA.
>    */
>   struct dma_tx_state {
>   	dma_cookie_t last;
>   	dma_cookie_t used;
>   	u32 residue;
> +	u32 in_flight_bytes;
>   };
>   
>   /**
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
