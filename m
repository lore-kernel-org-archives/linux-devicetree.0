From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 3/4] arm64/arm, numa, dt: adding numa dt binding
 implementation for arm64 platforms.
Date: Mon, 4 Jan 2016 12:48:25 +0530
Message-ID: <CAFpQJXUfOcRQcEChyAWahu2zFdf_1Xe0FrErJ_ydyeWKRA=QqA@mail.gmail.com>
References: <1451385148-13448-1-git-send-email-gkulkarni@caviumnetworks.com>
	<1451385148-13448-4-git-send-email-gkulkarni@caviumnetworks.com>
	<568A1549.9070405@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <568A1549.9070405-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shannon Zhao <zhaoshenglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngie>
List-Id: devicetree@vger.kernel.org

Hi Shannon,

On Mon, Jan 4, 2016 at 12:16 PM, Shannon Zhao <zhaoshenglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
> Hi Ganapatrao,
>
>
> On 2015/12/29 18:32, Ganapatrao Kulkarni wrote:
>> +static int __init early_init_parse_memory_node(unsigned long node)
>> +{
>> +     const __be32 *reg, *endp;
>> +     int length;
>> +     int nid;
>> +
>> +     const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
>> +
>> +     /* We are scanning "memory" nodes only */
>> +     if (type == NULL)
>> +             return 0;
>> +     else if (strcmp(type, "memory") != 0)
>> +             return 0;
>> +
>> +     nid = early_init_of_get_numa_nid(node);
>> +
>> +     if (nid == NUMA_NO_NODE)
>> +             return -EINVAL;
>> +
>> +     reg = of_get_flat_dt_prop(node, "reg", &length);
>> +     endp = reg + (length / sizeof(__be32));
>> +
>> +     while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
>> +             u64 base, size;
>> +             struct memblock_region *mblk;
>> +
>> +             base = dt_mem_next_cell(dt_root_addr_cells, &reg);
>> +             size = dt_mem_next_cell(dt_root_size_cells, &reg);
>> +             pr_debug("NUMA-DT:  base = %llx , node = %u\n",
>> +                             base, nid);
>> +
>> +             for_each_memblock(memory, mblk) {
>> +                     if (mblk->base == base) {
>> +                             if (numa_add_memblk(nid,
>> +                                                     mblk->base,
>> +                                                     mblk->size) < 0)
>> +                                     return -EINVAL;
>> +                             break;
>> +                     }
>> +             }
>> +     }
>> +
>> +     return 0;
>> +}
>
> Here it seems that you didn't address the comments[1] I gave on your
> previous patch set.
sorry, i have missed your comment.
i will update it.
>
> [1] http://www.spinics.net/lists/devicetree/msg104493.html
>
> Thanks,
> --
> Shannon
>
thanks
Ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
