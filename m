From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 04/14] dmaengine: Add metadata_ops for
 dma_async_tx_descriptor
Date: Sun, 8 Sep 2019 19:42:07 +0530
Message-ID: <20190908141207.GO2672@vkoul-mobl>
References: <20190730093450.12664-1-peter.ujfalusi@ti.com>
 <20190730093450.12664-5-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190730093450.12664-5-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: robh+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, t-kristo@ti.com, tony@atomide.com, j-keerthy@ti.com
List-Id: devicetree@vger.kernel.org

On 30-07-19, 12:34, Peter Ujfalusi wrote:
> The metadata is best described as side band data or parameters traveling
> alongside the data DMAd by the DMA engine. It is data
> which is understood by the peripheral and the peripheral driver only, the
> DMA engine see it only as data block and it is not interpreting it in any
> way.
> 
> The metadata can be different per descriptor as it is a parameter for the
> data being transferred.
> 
> If the DMA supports per descriptor metadata it can implement the attach,
> get_ptr/set_len callbacks.
> 
> Client drivers must only use either attach or get_ptr/set_len to avoid
> misconfiguration.
> 
> Client driver can check if a given metadata mode is supported by the
> channel during probe time with
> dmaengine_is_metadata_mode_supported(chan, DESC_METADATA_CLIENT);
> dmaengine_is_metadata_mode_supported(chan, DESC_METADATA_ENGINE);
> 
> and based on this information can use either mode.
> 
> Wrappers are also added for the metadata_ops.
> 
> To be used in DESC_METADATA_CLIENT mode:
> dmaengine_desc_attach_metadata()
> 
> To be used in DESC_METADATA_ENGINE mode:
> dmaengine_desc_get_metadata_ptr()
> dmaengine_desc_set_metadata_len()
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/dma/dmaengine.c   |  73 ++++++++++++++++++++++++++
>  include/linux/dmaengine.h | 108 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 181 insertions(+)
> 
> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
> index 03ac4b96117c..6baddf7dcbfd 100644
> --- a/drivers/dma/dmaengine.c
> +++ b/drivers/dma/dmaengine.c
> @@ -1302,6 +1302,79 @@ void dma_async_tx_descriptor_init(struct dma_async_tx_descriptor *tx,
>  }
>  EXPORT_SYMBOL(dma_async_tx_descriptor_init);
>  
> +static inline int desc_check_and_set_metadata_mode(
> +	struct dma_async_tx_descriptor *desc, enum dma_desc_metadata_mode mode)
> +{
> +	/* Make sure that the metadata mode is not mixed */
> +	if (!desc->desc_metadata_mode) {
> +		if (dmaengine_is_metadata_mode_supported(desc->chan, mode))
> +			desc->desc_metadata_mode = mode;

So do we have different descriptors supporting different modes or is it
controlled based? For latter we can do this check at controller
registration!

-- 
~Vinod
