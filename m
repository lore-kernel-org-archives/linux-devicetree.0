From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v8 6/9] pci: Introduce a domain number for
 pci_host_bridge.
Date: Fri, 11 Jul 2014 10:30:07 +0100
Message-ID: <20140711093007.GN6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-7-git-send-email-Liviu.Dudau@arm.com>
 <20140708005954.GC22939@google.com>
 <20140708104655.GC6501@e106497-lin.cambridge.arm.com>
 <CAErSpo75ovmGoeSHKJN0nckGDy-0gpn8kLPfHQ79CtcXxhPydw@mail.gmail.com>
 <20140708224847.GC4980@e106497-lin.cambridge.arm.com>
 <CAErSpo5rBt0iF2HGeDD-UH6_sPCoC647VCw0Q1v_0Rdpvcir-w@mail.gmail.com>
 <20140710094758.GA6501@e106497-lin.cambridge.arm.com>
 <CAErSpo5ZNCY31NztT0cLFbRVsBZqMsZ0LbTFNOTQCZUU3F7qJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAErSpo5ZNCY31NztT0cLFbRVsBZqMsZ0LbTFNOTQCZUU3F7qJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Suravee Suthikulanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Device Tree ML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 10, 2014 at 11:36:10PM +0100, Bjorn Helgaas wrote:
> On Thu, Jul 10, 2014 at 3:47 AM, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wr=
ote:
>=20
> > I don't see a way out of adding new PCI interfaces if we want to ha=
ve support in
> > the PCI framework for unifying existing architectures. Of course, t=
here is the painful
> > alternative of changing the existing APIs and fixing arches in one =
go, but like you've
> > said is going to be messy. I don't think I (or the people and compa=
nies wanting PCIe
> > on arm64) should cop out and pick a quick fix that adds sysdata str=
ucture into arm64
> > just to avoid new APIs, as this is not going to help anyone in long=
 term. What I can
> > do is to create a set of parallel APIs for pci_{scan,create}_root_b=
us() that take
> > a pci_host_bridge pointer and start converting architectures one by=
 one to that API
> > while deprecating the existing one. That way we can add arm64 easil=
y as it would be
> > the first architecture to use new code without breaking things *and=
* we provide a
> > migration path.
>=20
> A lot of the v7 discussion was about pci_register_io_range().  I
> apologize, because I think I really derailed things there and it was
> unwarranted.  Arnd was right that migrating other arches should be a
> separate effort.  I *think* I was probably thinking about the proposa=
l
> of adding pci_create_root_bus_in_domain(), and my reservations about
> that got transferred to the pci_register_io_range() discussion.  In
> any case, I'm completely fine with pci_register_io_range() now.
>=20
> Most of the rest of the v7 discussion was about "Introduce a domain
> number for pci_host_bridge."  I think we should add arm64 using the
> existing pci_scan_root_bus() and keep the domain number in the arm64
> sysdata structure like every other arch does.  Isn't that feasible?
> We can worry about domain unification later.

Thanks!

I'm really not that keen to add sysdata support in the arch code as it
requires initialisation code that I have tried to eliminate. What I'm
going to suggest for my v9 is a parallel set of APIs that arm64 will
be the first to use without changing the existing pci_{scan,create}_bus=
()
functions and then the conversion process will migrate arches to the ne=
w API.

Best regards,
Liviu

>=20
> I haven't followed closely enough to know what other objections peopl=
e had.
>=20
> Bjorn
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
