From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/3] pci: remove msi_controller registration API
Date: Tue, 14 Mar 2017 15:15:24 -0500
Message-ID: <20170314201524.GF26264@bhelgaas-glaptop.roam.corp.google.com>
References: <1488292276-11106-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1488292276-11106-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 03:31:13PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> This small patch series aims at removing the small msi_controller
> registration API implemented in drivers/of/of_pci.c.
> 
> In order to do so, it moves the last two users of this API to the
> generic MSI support:
> 
>  - The pci-aardvark driver is moved to use the generic MSI
>    support. This driver is both the provider of the MSI capability and
>    the consumer of this capability.
> 
>  - The pci-mvebu driver is cleaned up from using the msi_controller
>    registration API. This driver is only consuming MSI capabilies from
>    another driver (irq-armada-370-xp) which was migrated to the
>    generic MSI support some time ago. Therefore, this patch is simply
>    removing dead code.
> 
> Finally, the last commit removed the now unused API.
> 
> Changes between v2 and v3 are described in each individual patch.
> 
> Thanks,
> 
> Thomas
> 
> Thomas Petazzoni (3):
>   pci: pci-aardvark: move to MSI handling using generic MSI support
>   pci: pci-mvebu: remove useless MSI enabling code
>   of: pci: remove unused MSI controller helpers
> 
>  drivers/of/of_pci.c             |  45 -----------
>  drivers/pci/host/pci-aardvark.c | 173 ++++++++++++++++------------------------
>  drivers/pci/host/pci-mvebu.c    |  17 ----
>  include/linux/of_pci.h          |  11 ---
>  4 files changed, 67 insertions(+), 179 deletions(-)

Applied to pci/msi for v4.12, thanks!

I think Marc's ack on 1/30 applies to the first two, so I added it to them.

Oh, and I'll drop the other aardvark change that removes the same bits of
unused "msi-parent" code from advk_pcie_probe().

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
