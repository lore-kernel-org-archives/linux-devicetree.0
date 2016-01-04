From: Shannon Zhao <zhaoshenglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 3/4] arm64/arm, numa, dt: adding numa dt binding implementation
 for arm64 platforms.
Date: Mon, 4 Jan 2016 14:46:33 +0800
Message-ID: <568A1549.9070405@huawei.com>
References: <1451385148-13448-1-git-send-email-gkulkarni@caviumnetworks.com> <1451385148-13448-4-git-send-email-gkulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451385148-13448-4-git-send-email-gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Prasun.Kapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org
Cc: gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ganapatrao,


On 2015/12/29 18:32, Ganapatrao Kulkarni wrote:
> +static int __init early_init_parse_memory_node(unsigned long node)
> +{
> +	const __be32 *reg, *endp;
> +	int length;
> +	int nid;
> +
> +	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
> +
> +	/* We are scanning "memory" nodes only */
> +	if (type == NULL)
> +		return 0;
> +	else if (strcmp(type, "memory") != 0)
> +		return 0;
> +
> +	nid = early_init_of_get_numa_nid(node);
> +
> +	if (nid == NUMA_NO_NODE)
> +		return -EINVAL;
> +
> +	reg = of_get_flat_dt_prop(node, "reg", &length);
> +	endp = reg + (length / sizeof(__be32));
> +
> +	while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
> +		u64 base, size;
> +		struct memblock_region *mblk;
> +
> +		base = dt_mem_next_cell(dt_root_addr_cells, &reg);
> +		size = dt_mem_next_cell(dt_root_size_cells, &reg);
> +		pr_debug("NUMA-DT:  base = %llx , node = %u\n",
> +				base, nid);
> +
> +		for_each_memblock(memory, mblk) {
> +			if (mblk->base == base) {
> +				if (numa_add_memblk(nid,
> +							mblk->base,
> +							mblk->size) < 0)
> +					return -EINVAL;
> +				break;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}

Here it seems that you didn't address the comments[1] I gave on your
previous patch set.

[1] http://www.spinics.net/lists/devicetree/msg104493.html

Thanks,
-- 
Shannon

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
