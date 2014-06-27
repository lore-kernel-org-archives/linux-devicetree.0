From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 1/6] pci: Introduce pci_register_io_range() helper
 function.
Date: Fri, 27 Jun 2014 14:38:21 +0100
Message-ID: <20140627133821.GI15296@arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <6381366.2IfqZj1r0B@wuerfel>
 <20140627124949.GR26276@arm.com>
 <7528887.J1DnSBg239@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7528887.J1DnSBg239@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 27, 2014 at 02:16:28PM +0100, Arnd Bergmann wrote:
> On Friday 27 June 2014 13:49:49 Will Deacon wrote:
> > On Fri, Jun 27, 2014 at 12:03:34PM +0100, Arnd Bergmann wrote:
> > > On Thursday 26 June 2014 19:44:21 Rob Herring wrote:
> > > > I don't agree arm32 is harder than microblaze. Yes, converting ALL of
> > > > arm would be, but that is not necessary. With Liviu's latest branch
> > > > the hacks I previously needed are gone (thanks!), and this is all I
> > > > need to get Versatile PCI working (under QEMU):
> > > 
> > > I meant converting all of arm32 would be harder, but I agree we don't
> > > have to do it. It would be nice to convert all of the drivers/pci/host
> > > drivers though, iow all multiplatform-enabled ones, and leaving the
> > > current arm32 pci implementation for the platforms we don't want to
> > > convert to multiplatform anyway (footbridge, iop, ixp4xx, ks8695 (?),
> > > pxa, sa1100).
> > 
> > I'm more than happy to convert the generic host controller we merged
> > recently, but I'd probably want the core changes merged first so that I
> > know I'm not wasting my time!
> 
> That is definitely fine with me, but it's Bjorn's decision.

Or the changes to the generic host controller can be part of Liviu's
patch series (maybe together with other PCI host drivers like
designware, as time allows).

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
