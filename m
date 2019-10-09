From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH v3 04/14] dmaengine: Add metadata_ops for
 dma_async_tx_descriptor
Date: Wed, 9 Oct 2019 10:37:09 +0300
Message-ID: <1d4e049b-737c-3904-2bb1-6e058ab69a4d@ti.com>
References: <20191001061704.2399-1-peter.ujfalusi@ti.com>
 <20191001061704.2399-5-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001061704.2399-5-peter.ujfalusi@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, vkoul@kernel.org, robh+dt@kernel.org, nm@ti.com, ssantosh@kernel.org
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, tony@atomide.com, j-keerthy@ti.com
List-Id: devicetree@vger.kernel.org

On 01/10/2019 09:16, Peter Ujfalusi wrote:
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

Again couple of typos below, but other than that:

Reviewed-by: Tero Kristo <t-kristo@ti.com>

> ---
>   drivers/dma/dmaengine.c   |  73 ++++++++++++++++++++++++++
>   include/linux/dmaengine.h | 108 ++++++++++++++++++++++++++++++++++++++

<snip>

> + * @DESC_METADATA_ENGINE - the metadata buffer is allocated/managed by the DMA
> + *  driver. The client driver can ask for the pointer, maximum size and the
> + *  currently used size of the metadata and can directly update or read it.
> + *  dmaengine_desc_get_metadata_ptr() and dmaengine_desc_set_metadata_len() is
> + *  provided as helper functions.
> + *
> + * Client drivers interested to use this mode can follow:
> + * - DMA_MEM_TO_DEV / DEV_MEM_TO_MEM:
> + *   1. prepare the descriptor (dmaengine_prep_*)
> + *   2. use dmaengine_desc_get_metadata_ptr() to get the pointer to the engine's
> + *	metadata area
> + *   3. update the metadata at the pointer
> + *   4. use dmaengine_desc_set_metadata_len()  to tell the DMA engine the amount
> + *	of data the client has placed into the metadata buffer
> + *   5. submit the transfer
> + * - DMA_DEV_TO_MEM:
> + *   1. prepare the descriptor (dmaengine_prep_*)
> + *   2. submit the transfer
> + *   3. on transfer completion, use dmaengine_desc_get_metadata_ptr() to get the
> + *	pointer to the engine's metadata are

are = area?

> + *   4. Read out the metadate from the pointer

metadate = metadata?

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
