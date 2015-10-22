From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v11 4/6] PCI: hisi: Add PCIe host support for HiSilicon
 SoC Hip05
Date: Thu, 22 Oct 2015 13:46:22 -0500
Message-ID: <20151022184622.GD21237@localhost>
References: <1444991021-109306-1-git-send-email-wangzhou1@hisilicon.com>
 <1444991021-109306-5-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444991021-109306-5-git-send-email-wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, Liviu.Dudau-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiujiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Zhou,

This looks pretty good to me; just a mask question and add a printk.

On Fri, Oct 16, 2015 at 06:23:39PM +0800, Zhou Wang wrote:
> This patch adds PCIe host support for HiSilicon SoC Hip05.
> ...

> +#define PCIE_SUBCTRL_SYS_STATE4_REG                     0x6818
> +#define PCIE_LTSSM_LINKUP_STATE                         0x11
> +#define PCIE_LTSSM_STATE_MASK                           0x3F

Fabio unified some of this; see
  https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/commit/?h=pci/host-designware&id=4788fe6ebf4594c9a95b620cbff05147c8504823
  https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/commit/?h=pci/host-designware&id=b09464f77dd252a782da1f4e9925c1dbce4540ac

So the question is, why do you use a 6-bit (0x3f) LTSSM_STATE_MASK?
We think we can use a 5-bit mask (0x1f) for all the other
DesignWare-based systems.

> +/* Hip05 PCIe host only supports 32-bit config access */

Thanks for the comment asserting that Hip05 only supports 32-bit
config access.  I assume you confirmed that with the hardware
designers.  As far as I can tell, this *is* a hardware defect, and at
the minimum, I want a printk at driver probe-time so a dmesg log will
have a clue that read/modify/write on config space might do the wrong
thing.

> +static int hisi_pcie_cfg_read(struct pcie_port *pp, int where, int size,
> +			      u32 *val)
> ...

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
