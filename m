From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 04/14] dmaengine: Add metadata_ops for
 dma_async_tx_descriptor
Date: Mon, 9 Sep 2019 09:52:38 +0300
Message-ID: <0ccf3880-935f-be54-0f62-e57762141af1@ti.com>
References: <20190730093450.12664-1-peter.ujfalusi@ti.com>
 <20190730093450.12664-5-peter.ujfalusi@ti.com>
 <20190908141207.GO2672@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190908141207.GO2672@vkoul-mobl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Radhey Shyam Pandey <radheys@xilinx.com>
Cc: robh+dt@kernel.org, "Menon, Nishanth" <nm@ti.com>, ssantosh@kernel.org, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, t-kristo@ti.com, tony@atomide.com, j-keerthy@ti.com
List-Id: devicetree@vger.kernel.org



On 08/09/2019 17.12, Vinod Koul wrote:
> On 30-07-19, 12:34, Peter Ujfalusi wrote:
>> The metadata is best described as side band data or parameters traveling
>> alongside the data DMAd by the DMA engine. It is data
>> which is understood by the peripheral and the peripheral driver only, the
>> DMA engine see it only as data block and it is not interpreting it in any
>> way.
>>
>> The metadata can be different per descriptor as it is a parameter for the
>> data being transferred.
>>
>> If the DMA supports per descriptor metadata it can implement the attach,
>> get_ptr/set_len callbacks.
>>
>> Client drivers must only use either attach or get_ptr/set_len to avoid
>> misconfiguration.
>>
>> Client driver can check if a given metadata mode is supported by the
>> channel during probe time with
>> dmaengine_is_metadata_mode_supported(chan, DESC_METADATA_CLIENT);
>> dmaengine_is_metadata_mode_supported(chan, DESC_METADATA_ENGINE);
>>
>> and based on this information can use either mode.
>>
>> Wrappers are also added for the metadata_ops.
>>
>> To be used in DESC_METADATA_CLIENT mode:
>> dmaengine_desc_attach_metadata()
>>
>> To be used in DESC_METADATA_ENGINE mode:
>> dmaengine_desc_get_metadata_ptr()
>> dmaengine_desc_set_metadata_len()
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> ---
>>  drivers/dma/dmaengine.c   |  73 ++++++++++++++++++++++++++
>>  include/linux/dmaengine.h | 108 ++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 181 insertions(+)
>>
>> diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
>> index 03ac4b96117c..6baddf7dcbfd 100644
>> --- a/drivers/dma/dmaengine.c
>> +++ b/drivers/dma/dmaengine.c
>> @@ -1302,6 +1302,79 @@ void dma_async_tx_descriptor_init(struct dma_async_tx_descriptor *tx,
>>  }
>>  EXPORT_SYMBOL(dma_async_tx_descriptor_init);
>>  
>> +static inline int desc_check_and_set_metadata_mode(
>> +	struct dma_async_tx_descriptor *desc, enum dma_desc_metadata_mode mode)
>> +{
>> +	/* Make sure that the metadata mode is not mixed */
>> +	if (!desc->desc_metadata_mode) {
>> +		if (dmaengine_is_metadata_mode_supported(desc->chan, mode))
>> +			desc->desc_metadata_mode = mode;
> 
> So do we have different descriptors supporting different modes or is it
> controlled based? For latter we can do this check at controller
> registration!

It is actually on channel basis (in UDMAP):
TR channel does not support metadata at all.
Packet Mode channel have support for metadata, but it might not be
available for certain remote peripherals. PDMAs for example does not use
metadata.
Any channel can be configured as TR or Packet Mode, any channel can
service a peripheral which needs or does not need metadata.

The reason we ended up per descriptor callbacks with Radhey (added to
CC) is that all functions operate on the descriptor and it was natural
to have them attached to the descriptor rather than add channel based
callbacks which must also take the descriptor pointer in addition. The
descriptor have pointer to the channel it is issued on.

I only know if metadata is going to be supported when the channel is
requested, based on the psil-config of the remote thread.

Clients still can check and plan ahead on how to use the metadata.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
