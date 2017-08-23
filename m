From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] PCI: mediatek: Add MSI support for MT2712 and
 MT7622
Date: Wed, 23 Aug 2017 09:04:26 +0800
Message-ID: <1503450266.11985.3.camel@mtkswgap22>
References: <1502715868-17651-1-git-send-email-honghui.zhang@mediatek.com>
         <20170822213602.GK6948@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170822213602.GK6948-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, xinping.qian-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-08-22 at 16:36 -0500, Bjorn Helgaas wrote:
> On Mon, Aug 14, 2017 at 09:04:25PM +0800, honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > MT2712 and MT7622's PCIe host controller support MSI, but only 32bit MSI
> > address are supportted. It connect to GIC with the same IRQ number of INTx
> > IRQ, so it shares the same IRQ with INTx IRQ.
> > 
> > This patchset add MSI support for MT2712 and MT7622.
> > Also do some code fixup and cleanups.
> > 
> > Change Since V1:
> >  - Add the first two patches into this patchset.
> >  - Using -ENODEV instead of PTR_ERR if msi_domain == NULL
> >  - Change the error logs with consistency of lower-case
> >  - Using has_msi instead of support_msi to make the parameter name a bit shorter
> > 
> > Honghui Zhang (3):
> >   PCI: mediatek: Fix return value in case of error
> >   PCI: mediatek: take use of bus->sysdata to get host private data
> >   PCI: mediatek: add msi support for MT2712 and MT7622
> > 
> >  drivers/pci/host/pcie-mediatek.c | 157 +++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 151 insertions(+), 6 deletions(-)
> 
> Just waiting for an ack from Ryder...

For whole series:

Acked-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
