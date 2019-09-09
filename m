From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 06/14] dmaengine: ti: Add cppi5 header for UDMA
Date: Mon, 9 Sep 2019 13:59:54 +0300
Message-ID: <8699f999-7834-a083-2c7b-3ea909b1e011@ti.com>
References: <20190730093450.12664-1-peter.ujfalusi@ti.com>
 <20190730093450.12664-7-peter.ujfalusi@ti.com>
 <20190908142528.GP2672@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190908142528.GP2672@vkoul-mobl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: robh+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, t-kristo@ti.com, tony@atomide.com, j-keerthy@ti.com
List-Id: devicetree@vger.kernel.org



On 08/09/2019 17.25, Vinod Koul wrote:
> On 30-07-19, 12:34, Peter Ujfalusi wrote:
> 
>> +/**
>> + * Descriptor header, present in all types of descriptors
>> + */
>> +struct cppi5_desc_hdr_t {
>> +	u32 pkt_info0;	/* Packet info word 0 (n/a in Buffer desc) */
>> +	u32 pkt_info1;	/* Packet info word 1 (n/a in Buffer desc) */
>> +	u32 pkt_info2;	/* Packet info word 2 Buffer reclamation info */
>> +	u32 src_dst_tag; /* Packet info word 3 (n/a in Buffer desc) */
> 
> Can we move these comments to kernel-doc style please

Sure, I'll move all struct and enums.

>> +/**
>> + * cppi5_desc_get_type - get descriptor type
>> + * @desc_hdr: packet descriptor/TR header
>> + *
>> + * Returns descriptor type:
>> + * CPPI5_INFO0_DESC_TYPE_VAL_HOST
>> + * CPPI5_INFO0_DESC_TYPE_VAL_MONO
>> + * CPPI5_INFO0_DESC_TYPE_VAL_TR
>> + */
>> +static inline u32 cppi5_desc_get_type(struct cppi5_desc_hdr_t *desc_hdr)
>> +{
>> +	WARN_ON(!desc_hdr);
> 
> why WARN_ON and not return error!

these helpers were intended to be as simple as possible.
I can go through with all of the WARN_ONs and replace them with if()
pr_warn() and either just return or return with 0.

Would that be acceptable?

>> +/**
>> + * cppi5_hdesc_calc_size - Calculate Host Packet Descriptor size
>> + * @epib: is EPIB present
>> + * @psdata_size: PSDATA size
>> + * @sw_data_size: SWDATA size
>> + *
>> + * Returns required Host Packet Descriptor size
>> + * 0 - if PSDATA > CPPI5_INFO0_HDESC_PSDATA_MAX_SIZE
>> + */
>> +static inline u32 cppi5_hdesc_calc_size(bool epib, u32 psdata_size,
>> +					u32 sw_data_size)
>> +{
>> +	u32 desc_size;
>> +
>> +	if (psdata_size > CPPI5_INFO0_HDESC_PSDATA_MAX_SIZE)
>> +		return 0;
>> +	//TODO_GS: align
> 
> :)

Leftover TODO from Grygorii, the align is already done.

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
