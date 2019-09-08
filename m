From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 06/14] dmaengine: ti: Add cppi5 header for UDMA
Date: Sun, 8 Sep 2019 19:55:28 +0530
Message-ID: <20190908142528.GP2672@vkoul-mobl>
References: <20190730093450.12664-1-peter.ujfalusi@ti.com>
 <20190730093450.12664-7-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190730093450.12664-7-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: robh+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, t-kristo@ti.com, tony@atomide.com, j-keerthy@ti.com
List-Id: devicetree@vger.kernel.org

On 30-07-19, 12:34, Peter Ujfalusi wrote:

> +/**
> + * Descriptor header, present in all types of descriptors
> + */
> +struct cppi5_desc_hdr_t {
> +	u32 pkt_info0;	/* Packet info word 0 (n/a in Buffer desc) */
> +	u32 pkt_info1;	/* Packet info word 1 (n/a in Buffer desc) */
> +	u32 pkt_info2;	/* Packet info word 2 Buffer reclamation info */
> +	u32 src_dst_tag; /* Packet info word 3 (n/a in Buffer desc) */

Can we move these comments to kernel-doc style please

> +/**
> + * cppi5_desc_get_type - get descriptor type
> + * @desc_hdr: packet descriptor/TR header
> + *
> + * Returns descriptor type:
> + * CPPI5_INFO0_DESC_TYPE_VAL_HOST
> + * CPPI5_INFO0_DESC_TYPE_VAL_MONO
> + * CPPI5_INFO0_DESC_TYPE_VAL_TR
> + */
> +static inline u32 cppi5_desc_get_type(struct cppi5_desc_hdr_t *desc_hdr)
> +{
> +	WARN_ON(!desc_hdr);

why WARN_ON and not return error!

> +/**
> + * cppi5_hdesc_calc_size - Calculate Host Packet Descriptor size
> + * @epib: is EPIB present
> + * @psdata_size: PSDATA size
> + * @sw_data_size: SWDATA size
> + *
> + * Returns required Host Packet Descriptor size
> + * 0 - if PSDATA > CPPI5_INFO0_HDESC_PSDATA_MAX_SIZE
> + */
> +static inline u32 cppi5_hdesc_calc_size(bool epib, u32 psdata_size,
> +					u32 sw_data_size)
> +{
> +	u32 desc_size;
> +
> +	if (psdata_size > CPPI5_INFO0_HDESC_PSDATA_MAX_SIZE)
> +		return 0;
> +	//TODO_GS: align

:)

-- 
~Vinod
