From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v5 5/7] pci: Use parent domain number when allocating
 child busses.
Date: Wed, 5 Mar 2014 08:16:33 +0000
Message-ID: <20140305081633.GC1692@e106497-lin.cambridge.arm.com>
References: <1393948204-11555-1-git-send-email-Liviu.Dudau@arm.com>
 <1393948204-11555-6-git-send-email-Liviu.Dudau@arm.com>
 <CACoXjcmKKObSFignRWZAuOmmvfFtLf5O04Y5romJ=c6a9Jriqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CACoXjcmKKObSFignRWZAuOmmvfFtLf5O04Y5romJ=c6a9Jriqg@mail.gmail.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Tanmay Inamdar <tinamdar@apm.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 05, 2014 at 01:49:13AM +0000, Tanmay Inamdar wrote:
> Hello,
>=20
> On Tue, Mar 4, 2014 at 7:50 AM, Liviu Dudau <Liviu.Dudau@arm.com> wro=
te:
> > pci_alloc_child_bus() uses the newly allocated child bus to figure
> > out the domain number that is going to use for setting the device
> > name. A better option is to use the parent bus domain number.
> >
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> >
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 26237a0..a12cda5 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -677,7 +677,7 @@ static struct pci_bus *pci_alloc_child_bus(stru=
ct pci_bus *parent,
> >          * now as the parent is not properly set up yet.
> >          */
> >         child->dev.class =3D &pcibus_class;
> > -       dev_set_name(&child->dev, "%04x:%02x", pci_domain_nr(child)=
, busnr);
> > +       dev_set_name(&child->dev, "%04x:%02x", pci_domain_nr(parent=
), busnr);
> >
> >         /*
> >          * Set up the primary, secondary and subordinate
> > --
> > 1.9.0
> >
>=20
> This patch is not required after the fix in pci_domain_nr for arm64.
>=20

True. Thanks for testing this!

Liviu

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
