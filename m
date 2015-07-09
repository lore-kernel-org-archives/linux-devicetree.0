From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 0/2] pci: xgene: Add multiple memory ranges support
Date: Thu, 09 Jul 2015 13:47:39 +0200
Message-ID: <1481643.dA4ocqzitg@wuerfel>
References: <46305464.n5SOjGAhJb@wuerfel> <cover.1435688121.git.dhdang@apm.com> <CADaLNDmpkdHT7B1fSEu9qtoVcj4ookvxh=BA4EUCvG=pp80s=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADaLNDmpkdHT7B1fSEu9qtoVcj4ookvxh=BA4EUCvG=pp80s=A@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 06 July 2015 16:28:43 Duc Dang wrote:
> On Tue, Jun 30, 2015 at 11:22 AM, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org> wrote:
> > This patch set adds 1 large (up to 64GB) memory window for each PCIe
> > controller nodes in X-Gene device tree and fix PCIe controller driver
> > to handle multiple memory ranges correctly. These changes are required
> > to support PCIe devices that has huge BAR.
> >
> > v2 changes:
> >         1. Separate device-tree changes and driver changes into different
> >         patches
> >         2. Explicitly define new large window as 64-bit prefetchable in dts
> >         3. Use IORESOURCE_PREFETCH flag to determine which PCIe controller
> >         register to be used to configure the memory ranges.
> >
> >  arch/arm64/boot/dts/apm/apm-storm.dtsi | 23 ++++++++++++++---------
> >  drivers/pci/host/pci-xgene.c           | 12 ++++++++++--
> >  2 files changed, 24 insertions(+), 11 deletions(-)
> 
> Hi Arnd, Bjorn,
> 
> Do you have additional comment on this v2 patch set?
> 
> 

The changes look ok to me now, but I'd mention in the changelog about
the fact that one of the windows is prefetchable and the other one
is not, and that only prefetchable BARs are now using the 64-bit
window.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
