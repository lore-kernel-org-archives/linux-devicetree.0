From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v8 3/9] pci: Introduce pci_register_io_range() helper
 function.
Date: Wed, 2 Jul 2014 15:23:03 +0100
Message-ID: <20140702142303.GJ2173@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <8556461.i7qCGvGY5a@wuerfel>
 <20140701204508.GA19569@bart.dudau.co.uk>
 <7343032.WUqPgbXNQS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7343032.WUqPgbXNQS@wuerfel>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Liviu Dudau <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org>, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Device Tree ML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Suravee Suthikulanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 02, 2014 at 01:30:31PM +0100, Arnd Bergmann wrote:
> On Tuesday 01 July 2014 21:45:09 Liviu Dudau wrote:
> > On Tue, Jul 01, 2014 at 09:36:10PM +0200, Arnd Bergmann wrote:
> > > On Tuesday 01 July 2014 19:43:28 Liviu Dudau wrote:
> > >=20
> > > This still conflicts with the other allocator you have in patch 9
> > > for pci_remap_iospace: nothing guarantees that the mapping is the
> > > same for both.
> > >=20
> > > Also, this is a completely pointless exercise at this moment, bec=
ause
> > > nobody cares about the result of pci_address_to_pio on architectu=
res
> > > that don't already provide this function. If we ever get a proper
> > > Open Firmware implementation that wants to put hardcoded PCI devi=
ces
> > > into DT, we can add an implementation, but for now this seems ove=
rkill.
> > >=20
> > > The allocator in pci_register_io_range seems reasonable, why not =
merge
> > > this function with pci_remap_iospace() as I have asked you multip=
le
> > > times before? Just make it return the io_offset so the caller can
> > > put that into the PCI host resources.
> >=20
> > Hi Arnd,
> >=20
> > While I agree with you that at some moment the allocators were inco=
nsistent
> > wrt each other, for this version I would respectfully disagree on t=
his.
> > The allocator in pci_register_io_range() only makes sure that the r=
anges
> > are not overlapping, it doesn't do any mapping whatsoever, while
> > pci_remap_iospace() does only an ioremap_page_range(). The idea is =
that
> > you get the offset out of pci_address_to_pio() and apply it to
> > pci_remap_iospace().
>=20
> Ok, got it now, I'm sorry I didn't read this properly at first.
>=20
> Your solution looks correct to me, just using different
> tradeoffs to what I was expecting: You get a working pci_address_to_p=
io()
> function, which is probably never needed, but in turn you need to
> keep the state of each host bridge in a global list.

Just a reminder that with my patchset I *do* start using pci_address_to=
_pio()
in order to correctly parse the IO ranges from DT.

Best regards,
Liviu

>=20
> 	Arnd
>=20
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
