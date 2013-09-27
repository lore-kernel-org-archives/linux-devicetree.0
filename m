From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v7 3/4] drivers: of: add initialization code for dma reserved memory
Date: Fri, 27 Sep 2013 10:47:14 -0500
Message-ID: <AD54F66C-31F0-46DF-AEDA-D1E6CC5A5A2A@codeaurora.org>
References: <1377527959-5080-1-git-send-email-m.szyprowski@samsung.com> <1377527959-5080-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377527959-5080-4-git-send-email-m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nishanth Peethambaran <nishanth.p-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Aug 26, 2013, at 9:39 AM, Marek Szyprowski wrote:

> +/**
> + * of_reserved_mem_device_init() - assign reserved memory region to given device
> + *
> + * This function assign memory region pointed by "memory-region" device tree
> + * property to the given device.
> + */
> +void of_reserved_mem_device_init(struct device *dev)
> +{
> +	struct reserved_mem *region = get_dma_memory_region(dev);
> +	if (!region)
> +		return;
> +
> +	if (region->cma) {
> +		dev_set_cma_area(dev, region->cma);
> +		pr_info("Assigned CMA %s to %s device\n", region->name,
> +			dev_name(dev));
> +	} else {

I don't think its a reasonable assumption that a 'reserved-memory-region' is necessary dma coherent if its not cma.

> +		if (dma_declare_coherent_memory(dev, region->base, region->base,
> +		    region->size, DMA_MEMORY_MAP | DMA_MEMORY_EXCLUSIVE) != 0)
> +			pr_info("Declared reserved memory %s to %s device\n",
> +				region->name, dev_name(dev));
> +	}
> +}
> +

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
