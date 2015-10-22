From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v11 3/6] PCI: designware: Add ARM64 support
Date: Thu, 22 Oct 2015 13:28:53 -0500
Message-ID: <20151022182853.GC21237@localhost>
References: <1444991021-109306-1-git-send-email-wangzhou1@hisilicon.com>
 <1444991021-109306-4-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444991021-109306-4-git-send-email-wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, Liviu.Dudau-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiujiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Zhou,

On Fri, Oct 16, 2015 at 06:23:38PM +0800, Zhou Wang wrote:
> This patch tries to unify ARM32 and ARM64 PCIe in designware driver. Delete
> function dw_pcie_setup, dw_pcie_scan_bus, dw_pcie_map_irq and struct hw_pci,
> move related operations to dw_pcie_host_init.
> 
> This patch also try to use of_pci_get_host_bridge_resources for ARM32 and ARM64
> according to the suggestion for Gabriele[1]
> 
> This patch reverts commit f4c55c5a3f7f ("PCI: designware: Program ATU with
> untranslated address") based on 1/6 in this series. we delete *_mod_base in
> pcie-designware. This was discussed in [2]
> 
> I have compiled the driver with multi_v7_defconfig. However, I don't have
> ARM32 PCIe related board to do test. It will be appreciated if someone could
> help to test it.

There's a lot going on this patch.  Can you split it up at all?  For
example, maybe:

  - Revert f4c55c5a3f7f (and move to right after the related [1/6]
    patch

  - Switch to using of_pci_get_host_bridge_resources()

  - Replacing the call of pci_common_init_dev() with equivalent code in
    pcie-designware.c.  This one in particular needs to be easy to review.
    It's not clear to me that this new code is equivalent.  For example,
    pci_common_init_dev() calls pcie_bus_configure_settings(), but I don't
    see that in your new code.

You already have acks and tested-by, so I assume you probably did all the
right things, but it will help me out a lot if you can break it into
bite-sized pieces.  It's always better to make patches too small rather
than too large, because it's trivial to squash them back together if
needed.  I think we're going to have some conflicts between this and other
pcie-designware.c changes, and small patches will also make those easier to
resolve.

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
