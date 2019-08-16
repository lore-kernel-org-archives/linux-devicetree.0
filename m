From: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v9 08/21] iommu/io-pgtable-arm-v7s: Extend MediaTek 4GB
 Mode
Date: Fri, 16 Aug 2019 15:22:20 +0800
Message-ID: <1565940140.20346.21.camel@mhfsdcap03>
References: <1565423901-17008-1-git-send-email-yong.wu@mediatek.com>
         <1565423901-17008-9-git-send-email-yong.wu@mediatek.com>
         <20190814144059.ruyc45yoqkwpbuga@willie-the-truck>
         <1565858869.12818.51.camel@mhfsdcap03>
         <20190815095123.rzgtpklvhtjlqir4@willie-the-truck>
         <1565864318.14278.4.camel@mhfsdcap03>
         <20190815115021.7pbv5s2qbgsuitvh@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190815115021.7pbv5s2qbgsuitvh@willie-the-truck>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>, Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, Matthias Kaehlcke <mka@chromium.org>, cui.zhang@mediatek.com, chao.hao@mediatek.com, ming-fan.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, 2019-08-15 at 12:50 +0100, Will Deacon wrote:
> Ok, I think speaking to Robin helped me a bit with this...
> 
> On Thu, Aug 15, 2019 at 06:18:38PM +0800, Yong Wu wrote:
> > On Thu, 2019-08-15 at 10:51 +0100, Will Deacon wrote:
> > > On Thu, Aug 15, 2019 at 04:47:49PM +0800, Yong Wu wrote:
> > > > On Wed, 2019-08-14 at 15:41 +0100, Will Deacon wrote:
> > > > > On Sat, Aug 10, 2019 at 03:58:08PM +0800, Yong Wu wrote:
> > > > > > MediaTek extend the arm v7s descriptor to support the dram over 4GB.
> > > > > > 
> > > > > > In the mt2712 and mt8173, it's called "4GB mode", the physical address
> > > > > > is from 0x4000_0000 to 0x1_3fff_ffff, but from EMI point of view, it
> > > > > > is remapped to high address from 0x1_0000_0000 to 0x1_ffff_ffff, the
> > > > > > bit32 is always enabled. thus, in the M4U, we always enable the bit9
> > > > > > for all PTEs which means to enable bit32 of physical address. Here is
> > > > > > the detailed remap relationship in the "4GB mode":
> > > > > > CPU PA         ->    HW PA
> > > > > > 0x4000_0000          0x1_4000_0000 (Add bit32)
> > > > > > 0x8000_0000          0x1_8000_0000 ...
> > > > > > 0xc000_0000          0x1_c000_0000 ...
> > > > > > 0x1_0000_0000        0x1_0000_0000 (No change)
> 
> [...]
> 
> > > > > The way I would like this quirk to work is that the io-pgtable code
> > > > > basically sets bit 9 in the pte when bit 32 is set in the physical address,
> > > > > and sets bit 4 in the pte when bit 33 is set in the physical address. It
> > > > > would then do the opposite when converting a pte to a physical address.
> > > > > 
> > > > > That way, your driver can call the page table code directly with the high
> > > > > addresses and we don't have to do any manual offsetting or range checking
> > > > > in the page table code.
> > > > 
> > > > In this case, the mt8183 can work successfully while the "4gb
> > > > mode"(mt8173/mt2712) can not.
> > > > 
> > > > In the "4gb mode", As the remap relationship above, we should always add
> > > > bit32 in pte as we did in [2]. and need add bit32 in the
> > > > "iova_to_phys"(Not always add.). That means the "4gb mode" has a special
> > > > flow:
> > > > a. Always add bit32 in paddr_to_iopte.
> > > > b. Add bit32 only when PA < 0x40000000 in iopte_to_paddr.
> > > 
> > > I think this is probably at the heart of my misunderstanding. What is so
> > > special about PAs (is this HW PA or CPU PA?) below 0x40000000? Is this RAM
> > > or something else?
> > 
> > SRAM and HW register that IOMMU can not access.
> 
> Ok, so redrawing your table from above, I think we can say something like:
> 
> 
> CPU Physical address
> ====================
> 
> 0G	1G	2G	3G	4G	5G
> |---A---|---B---|---C---|---D---|---E---|
> +--I/O--+------------Memory-------------+
> 
> 
> IOMMU output physical address
> =============================
> 
> 				4G	5G	6G	7G	8G
> 				|---E---|---B---|---C---|---D---|
> 				+------------Memory-------------+
> 
> 
> Do you agree? 

Quite right.


> If so, what happens to region 'A' (the I/O region) in the
> IOMMU output physical address space. Is it accessible?

No. IOMMU can not access region 'A' above.

> 
> Anyway, I think it's the job of the driver to convert between the two
> address spaces, so that:
> 
>   - On ->map(), bit 32 of the CPU physical address is set before calling
>     into the iopgtable code
> 
>   - The result from ->iova_to_phys() should be the result from the
>     iopgtable code, but with the top bit cleared for addresses over
>     5G.
> 
> This assumes that:
> 
>   1. We're ok setting bit 9 in the ptes mapping region 'E'.
>   2. The IOMMU page-table walker uses CPU physical addresses
> 
> Are those true?

Yes. Then this patch would be close to the one[1] I sent in v8.

Do I need to split this patch into 2 ones?:
a).the pagetable code that support 34bit PA when MTK quirk is enabled.
It only has the symmetric code handle BIT32/BIT33. Besides, I will add
CONFIG_PHYS_ADDR_T_64BIT in the iopte_to_addr as commented before.

b) MTK code that apply the special "4gb mode" flow. And the "oas" will
always is 34 bit since v7s has already supported our case.

[1]http://lists.infradead.org/pipermail/linux-mediatek/2019-June/020991.html

> 
> Thanks,
> 
> Will
