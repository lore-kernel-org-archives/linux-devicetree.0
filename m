From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/4] PCI: pci-host-generic: Fix lookup of
 linux,pci-probe-only property
Date: Mon, 17 Aug 2015 10:01:32 +0100
Message-ID: <20150817090132.GC1688@arm.com>
References: <1439569159-10051-1-git-send-email-marc.zyngier@arm.com>
 <1439569159-10051-3-git-send-email-marc.zyngier@arm.com>
 <20150814164051.GF26431@google.com>
 <20150814164324.GC22809@arm.com>
 <CAErSpo5abs2Qj25Bs+JVg87ve346f_RVz7jhNwqdv856+WvXQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAErSpo5abs2Qj25Bs+JVg87ve346f_RVz7jhNwqdv856+WvXQA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org" <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "agraf-l3A5Bk7waGM@public.gmane.org" <agraf-l3A5Bk7waGM@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 14, 2015 at 09:26:21PM +0100, Bjorn Helgaas wrote:
> On Fri, Aug 14, 2015 at 11:43 AM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Fri, Aug 14, 2015 at 05:40:51PM +0100, Bjorn Helgaas wrote:
> >> Do we need support for pci-probe-only in pci-host-generic at all?
> >> You're removing the use in amd-overdrive.dts, and there are no other
> >> DTs in the kernel tree that mention it.
> >>
> >> If we can live without it, that would be nice.  It seems like a relic from
> >> days when we couldn't reliably assign resources.  (I'm not saying we can do
> >> that reliably even today, but I'd rather make it reliable than turn it
> >> off.)
> >
> > Kvmtool certainly uses it (and generates its own DT, hence why you don't
> > see it in mainline). Not sure about qemu, though.
> 
> Do you know why kvmtool wants probe-only?  Would something break if we
> didn't support probe-only?  I guess we'd be looking for a case where
> Linux assigns resources and that assignment doesn't work with kvmtool?

It's basically because the BARs aren't writable other than to find the
region size. It could fixed with a bit of pain, but it doesn't help older
kvmtools that do work with mainline today.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
