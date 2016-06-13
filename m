From: Tomasz Figa <tfiga@google.com>
Subject: Re: [PATCH v2 6/7] iommu/rockchip: use DMA API to map, to flush cache
Date: Mon, 13 Jun 2016 19:21:26 +0900
Message-ID: <CAAFQd5DDCd8VcdEhEASAK7NMBnVJWuUxgGURtsa2KQBKsgsxUQ@mail.gmail.com>
References: <1465392392-2003-1-git-send-email-zhengsq@rock-chips.com>
 <1465392392-2003-7-git-send-email-zhengsq@rock-chips.com> <CAAFQd5Da+Eg=eiRUgLSS_qPjGbG474KYWDC=GaAMS8A_CuQ3Mg@mail.gmail.com>
 <575E834C.30305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <575E834C.30305@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shunqian.zheng@gmail.com
Cc: Shunqian Zheng <zhengsq@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, Joerg Roedel <joro@8bytes.org>, linux@armlinux.org.uk, dri-devel <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "open list:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Rob Herring
	<robh+dt@kernel.org>, simon xue <xxm@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org" <mark.yao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2016 at 6:56 PM, Shunqian Zheng
<shunqian.zheng@gmail.com> wrote:
> Hi
>
> On 2016=E5=B9=B406=E6=9C=8810=E6=97=A5 17:10, Tomasz Figa wrote:
>>
>> Hi,
>>
>> On Wed, Jun 8, 2016 at 10:26 PM, Shunqian Zheng <zhengsq@rock-chips.=
com>
>> wrote:
>>>
>>> Use DMA API instead of architecture internal functions like
>>> __cpuc_flush_dcache_area() etc.
>>>
>>> To support the virtual device like DRM the virtual slave iommu
>>> added in the previous patch, attaching to which the DRM can use
>>> it own domain->dev for dma_map_*(), dma_sync_*() even VOP is disabl=
ed.
>>>
>>> With this patch, this driver is available for ARM64 like RK3399.
>>>
>> Could we instead simply allocate coherent memory for page tables usi=
ng
>> dma_alloc_coherent() and skip any flushing on CPU side completely? I=
f
>> I'm looking correctly, the driver only reads back the page directory
>> when checking if there is a need to allocate new page table, so ther=
e
>> shouldn't be any significant penalty for disabling the cache.
>
> I try to use dma_alloc_coherent() to replace the dma_map_single(),
> but it doesn't work for me properly.
> Because the DRM uses the iommu_dma_ops instead the swiotlb_dma_ops af=
ter
> attaching
> to iommu, so when the iommu domain need to alloc a new page in
> rk_iommu_map(),
> it would call:
> rk_iommu_map()  --> dma_alloc_coherent()  --> ops->alloc()  --> iommu=
_map()
> --> rk_iommu_map()

It shouldn't call iommu_map(), because the IOMMU is not behind another
IOMMU. Are you sure you called dma_alloc_coherent() on behalf of the
IOMMU struct device and not the DRM device?

Best regards,
Tomasz
