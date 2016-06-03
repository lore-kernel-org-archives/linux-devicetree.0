From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] pci: Add PCIe driver for Rockchip Soc
Date: Fri, 3 Jun 2016 09:55:47 +0100
Message-ID: <20160603085547.GB24547@red-moon>
References: <1463740105-7061-1-git-send-email-shawn.lin@rock-chips.com>
 <1463740156-7148-1-git-send-email-shawn.lin@rock-chips.com>
 <57483CAA.8000005@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57483CAA.8000005-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 27, 2016 at 01:25:14PM +0100, Marc Zyngier wrote:

[...]

> > +	} else {
> > +		bus = pci_scan_root_bus(&pdev->dev, 0,
> > +					&rockchip_pcie_ops, port, &res);
> > +	}
> > +	if (!bus)
> > +		return -ENOMEM;
> > +
> > +	if (!pci_has_flag(PCI_PROBE_ONLY)) {
> 
> Why do you have catter for the PCI_PROBE_ONLY case? Nobody should ever
> use that for properly implemented HW.

I think that's just copy and paste and it is a useless check given
that the only way we can set that flag on ARM/ARM64 is through DT
(of_pci_check_probe_only()) and I doubt that systems probing this
driver really require a PCI_PROBE_ONLY set-up.

So, unless you can explain to us why it is really needed, please
remove the:

if (!pci_has_flag(PCI_PROBE_ONLY))

check.

Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
