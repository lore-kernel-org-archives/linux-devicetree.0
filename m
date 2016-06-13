From: Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 6/7] iommu/rockchip: use DMA API to map, to flush cache
Date: Mon, 13 Jun 2016 19:41:26 +0900
Message-ID: <CAAFQd5AXq9c0X6nQOvbgiBNgJp3UfDNmwC7iQnFGunE=7zdO1A@mail.gmail.com>
References: <1465392392-2003-1-git-send-email-zhengsq@rock-chips.com>
 <1465392392-2003-7-git-send-email-zhengsq@rock-chips.com> <CAAFQd5Da+Eg=eiRUgLSS_qPjGbG474KYWDC=GaAMS8A_CuQ3Mg@mail.gmail.com>
 <575E834C.30305@gmail.com> <CAAFQd5DDCd8VcdEhEASAK7NMBnVJWuUxgGURtsa2KQBKsgsxUQ@mail.gmail.com>
 <575E8B6F.1040103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575E8B6F.1040103-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shunqian.zheng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Rob Herring
	<robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, simon xue <xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org>,
	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2016 at 7:31 PM, Shunqian Zheng
<shunqian.zheng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> HI,
>
>
> On 2016=E5=B9=B406=E6=9C=8813=E6=97=A5 18:21, Tomasz Figa wrote:
>>
>> On Mon, Jun 13, 2016 at 6:56 PM, Shunqian Zheng
>> <shunqian.zheng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>> Hi
>>>
>>> On 2016=E5=B9=B406=E6=9C=8810=E6=97=A5 17:10, Tomasz Figa wrote:
>>>>
>>>> Hi,
>>>>
>>>> On Wed, Jun 8, 2016 at 10:26 PM, Shunqian Zheng <zhengsq@rock-chip=
s.com>
>>>> wrote:
>>>>>
>>>>> Use DMA API instead of architecture internal functions like
>>>>> __cpuc_flush_dcache_area() etc.
>>>>>
>>>>> To support the virtual device like DRM the virtual slave iommu
>>>>> added in the previous patch, attaching to which the DRM can use
>>>>> it own domain->dev for dma_map_*(), dma_sync_*() even VOP is disa=
bled.
>>>>>
>>>>> With this patch, this driver is available for ARM64 like RK3399.
>>>>>
>>>> Could we instead simply allocate coherent memory for page tables u=
sing
>>>> dma_alloc_coherent() and skip any flushing on CPU side completely?=
 If
>>>> I'm looking correctly, the driver only reads back the page directo=
ry
>>>> when checking if there is a need to allocate new page table, so th=
ere
>>>> shouldn't be any significant penalty for disabling the cache.
>>>
>>> I try to use dma_alloc_coherent() to replace the dma_map_single(),
>>> but it doesn't work for me properly.
>>> Because the DRM uses the iommu_dma_ops instead the swiotlb_dma_ops =
after
>>> attaching
>>> to iommu, so when the iommu domain need to alloc a new page in
>>> rk_iommu_map(),
>>> it would call:
>>> rk_iommu_map()  --> dma_alloc_coherent()  --> ops->alloc()  -->
>>> iommu_map()
>>> --> rk_iommu_map()
>>
>> It shouldn't call iommu_map(), because the IOMMU is not behind anoth=
er
>> IOMMU. Are you sure you called dma_alloc_coherent() on behalf of the
>> IOMMU struct device and not the DRM device?
>
> I called dma_alloc_coherent() with DRM device but not the IOMMU devic=
e,
> because DRM didn't attach to any iommu. Even allocating an virtual on=
e when
> attaching, the iommu->dev
> is DRM device though.
> Am I right here?

What I meant, is that even though rk_iommu_map() is called for DRM
device, the page table allocation happening inside should be called
for the IOMMU device itself, because it's the consumer of these page
tables.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
