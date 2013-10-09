From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [RFC] Architecture independent pcibios?
Date: Wed, 9 Oct 2013 11:04:28 +0100
Message-ID: <20131009100428.GH25606@e102652-lin.cambridge.arm.com>
References: <20131008144211.GA25231@e102652-lin.cambridge.arm.com>
 <CAErSpo5=sUJDZGm+zHw+b1h_a1YYbaGBshAutAoPBZYUCRbYkw@mail.gmail.com>
 <525438F6.3090600@gmail.com>
 <1381264135.645.230.camel@pasglop>
 <20131009090923.GE25606@e102652-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20131009090923.GE25606@e102652-lin.cambridge.arm.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring <robherring2@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Michal Simek <monstr@monstr.eu>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 09, 2013 at 10:09:23AM +0100, Liviu Dudau wrote:
> On Tue, Oct 08, 2013 at 09:28:55PM +0100, Benjamin Herrenschmidt wrot=
e:
> > On Tue, 2013-10-08 at 11:55 -0500, Rob Herring wrote:
> >=20
> > > > I wonder if pci_process_bridge_OF_ranges() would fit somewhere =
in
> > > > drivers/of?  The implementations I looked at are mostly concern=
ed with
> > > > parsing OF resources, and they don't have much to do with PCI
> > > > directly.
> > >=20
> > > This was being done until Ben weighed in:
> > >=20
> > > https://lkml.org/lkml/2013/5/4/103
> >=20
> > Well, I proposed an alternative (better) approach which I of course=
 had
> > no time to actually implement yet :-)
>=20
> In order to avoid any confusion, could you please point me again to t=
he
> relevant message(s) where you proposed your approach?

Sorry, I'm being sloppy. I've made the wrong assumption that the link l=
isted
above was only Ben talking about why it cannot get into powerpc. Now I =
see
that it is also the place where Ben talks about moving the "intermediar=
y"
set of resources out of struct pci_controller.

Is there anything else that I might be missing?

Cheers,
Liviu

>=20
> >=20
> > I have done the changes I needed to do to powerpc
> > pci_process_bridge_OF_ranges so it would be possible to move that n=
ow to
> > a generic place, but I still think it's not a great idea. It means =
the
> > pci_controller structure with its resources will have to become gen=
eric
> > which somewhat overlaps with the pci_host_bridge that Bjorn introdu=
ced,
> > so that's really not great.
> >=20
> > I still think an arch with DT and simpler PCI code that powerpc cou=
ld
> > start looking at the transition to a better model that I hinted at.=
=2E.
>=20
> As tempting as it is to start anew and with a cleaner code, I am wary
> that porting the existing platforms to the new code will take longer
> that way. My intentions are to make the (probably infrequent) task of
> adding a new architecture to the PCI infrastructure a simple and
> straighforward task. But adding code for my platform is no guarantee
> that new ones will have an easier job.
>=20
> Best regards,
> Liviu
>=20
> >=20
> > Cheers,
> > Ben.
> >=20
> >=20
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
