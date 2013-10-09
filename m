From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [RFC] Architecture independent pcibios?
Date: Wed, 9 Oct 2013 11:45:54 +0100
Message-ID: <20131009104553.GI25606@e102652-lin.cambridge.arm.com>
References: <20131008144211.GA25231@e102652-lin.cambridge.arm.com>
 <CAErSpo5=sUJDZGm+zHw+b1h_a1YYbaGBshAutAoPBZYUCRbYkw@mail.gmail.com>
 <525438F6.3090600@gmail.com>
 <1381264135.645.230.camel@pasglop>
 <20131009090923.GE25606@e102652-lin.cambridge.arm.com>
 <1381315068.4330.1.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1381315068.4330.1.camel@pasglop>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Rob Herring <robherring2@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Michal Simek <monstr@monstr.eu>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 09, 2013 at 11:37:48AM +0100, Benjamin Herrenschmidt wrote:
> On Wed, 2013-10-09 at 10:09 +0100, Liviu Dudau wrote:
> > On Tue, Oct 08, 2013 at 09:28:55PM +0100, Benjamin Herrenschmidt wr=
ote:
> > > On Tue, 2013-10-08 at 11:55 -0500, Rob Herring wrote:
> > >
> > > > > I wonder if pci_process_bridge_OF_ranges() would fit somewher=
e in
> > > > > drivers/of?  The implementations I looked at are mostly conce=
rned with
> > > > > parsing OF resources, and they don't have much to do with PCI
> > > > > directly.
> > > >
> > > > This was being done until Ben weighed in:
> > > >
> > > > https://lkml.org/lkml/2013/5/4/103
> > >
> > > Well, I proposed an alternative (better) approach which I of cour=
se had
> > > no time to actually implement yet :-)
> >=20
> > In order to avoid any confusion, could you please point me again to=
 the
> > relevant message(s) where you proposed your approach?
>=20
> The one pointed to by the above URL ?
>=20
> > > I have done the changes I needed to do to powerpc
> > > pci_process_bridge_OF_ranges so it would be possible to move that=
 now to
> > > a generic place, but I still think it's not a great idea. It mean=
s the
> > > pci_controller structure with its resources will have to become g=
eneric
> > > which somewhat overlaps with the pci_host_bridge that Bjorn intro=
duced,
> > > so that's really not great.
> > >
> > > I still think an arch with DT and simpler PCI code that powerpc c=
ould
> > > start looking at the transition to a better model that I hinted a=
t...
> >=20
> > As tempting as it is to start anew and with a cleaner code, I am wa=
ry
> > that porting the existing platforms to the new code will take longe=
r
> > that way. My intentions are to make the (probably infrequent) task =
of
> > adding a new architecture to the PCI infrastructure a simple and
> > straighforward task. But adding code for my platform is no guarante=
e
> > that new ones will have an easier job.
>=20
> It still makes little sense to generalize a pci_controller with
> resources & offset on top of the generic pci_host_bridge with apertur=
es.

Agreed. I'm looking on how to move functions that use pci_controller to
use pci_host_bridge.

Semantic question: what is the perceived difference between a pci_contr=
oller
and a pci_host_bridge? Are they just historical naming artifacts of the
same concept? (person A deciding to do a cleanup of the code and picks =
a
new name in order not to upset the old APIs)

Best regards,
Liviu

>=20
> Ben.
>=20
> > Best regards,
> > Liviu
> >=20
> > >
> > > Cheers,
> > > Ben.
> > >
> > >
> > >
> >=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
