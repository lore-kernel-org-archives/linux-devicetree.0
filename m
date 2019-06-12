From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv5 04/20] PCI: mobiveil: Remove the flag
 MSI_FLAG_MULTI_PCI_MSI
Date: Wed, 12 Jun 2019 11:54:10 +0100
Message-ID: <20190612105410.GA9918@redmoon>
References: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
 <20190412083635.33626-5-Zhiqiang.Hou@nxp.com>
 <20190611165935.GA22836@redmoon>
 <3b883516-1d63-1504-bdc9-22ac9c6f2d46@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3b883516-1d63-1504-bdc9-22ac9c6f2d46@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: "Z.q. Hou" <zhiqiang.hou@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Xiaowei Bao <xiaowei.bao@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 11, 2019 at 06:29:49PM +0100, Marc Zyngier wrote:
> On 11/06/2019 17:59, Lorenzo Pieralisi wrote:
> > On Fri, Apr 12, 2019 at 08:35:36AM +0000, Z.q. Hou wrote:
> >> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >>
> >> The current code does not support multiple MSIs, so remove
> >> the corresponding flag from the msi_domain_info structure.
> > 
> > Please explain me what's the problem before removing multi MSI
> > support.
> 
> The reason seems to be the following code in the allocator:
> 
>         WARN_ON(nr_irqs != 1);
>         mutex_lock(&msi->lock);
> 
>         bit = find_first_zero_bit(msi->msi_irq_in_use, msi->num_of_vectors);
>         if (bit >= msi->num_of_vectors) {
>                 mutex_unlock(&msi->lock);
>                 return -ENOSPC;
>         }
> 
>         set_bit(bit, msi->msi_irq_in_use);
> 
> So instead of fixing the allocator, the author prefers disabling
> the feature. I'm not sure whether that is an acceptable outcome...

:) No it is not that's why I asked and I am waiting for an answer.

Lorenzo
