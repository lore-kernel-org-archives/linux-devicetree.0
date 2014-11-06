From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] PCI: add missing DT binding for linux,pci-domain property
Date: Thu, 6 Nov 2014 12:36:42 +0000
Message-ID: <20141106123642.GT8916@e106497-lin.cambridge.arm.com>
References: <1415101660-26450-1-git-send-email-l.stach@pengutronix.de>
 <20141105231743.GI6168@google.com>
 <20141106100518.GI8916@e106497-lin.cambridge.arm.com>
 <3491668.yjzKoIEZd4@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <3491668.yjzKoIEZd4@wuerfel>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 06, 2014 at 11:42:41AM +0000, Arnd Bergmann wrote:
> On Thursday 06 November 2014 10:05:18 Liviu Dudau wrote:
> > On Wed, Nov 05, 2014 at 11:17:43PM +0000, Bjorn Helgaas wrote:
> > > On Tue, Nov 04, 2014 at 12:47:40PM +0100, Lucas Stach wrote:
> > > > This property was added by 41e5c0f81d3e
> > > > (of/pci: Add pci_get_new_domain_nr() and of_get_pci_domain_nr()=
)
> > > > without the required binding documentation. As this property
> > > > will be supported by a number of host bridge drivers going forw=
ard,
> > > > add it to the common PCI binding doc.
> > > >=20
> > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > >=20
> > > I merged 41e5c0f81d3e through my tree, and I could merge somethin=
g like
> > > this if a consensus develops with some acks.  But I'll just let y=
ou guys
> > > handle it unless you poke me again.
> >=20
> > While I think the "linux,pci-domain" property *must* be documented,=
 I
> > would like to get a consensus first on the usage. If we agree that
> > the property is mandatory to all host bridge drivers that use OF th=
en
> > we need to patch existing drivers (partially done through Lorenzo's
> > patches, but other arches are ignoring it). If we say all *new* dri=
vers
> > need to use it then we also need to come up with a strategy on how =
to
> > deal with old vs new school drivers.
> >=20
> > My preferred approach is the 3rd way: "linux,pci-domain" becomes pa=
rt of
> > the core PCI infrastructure (and we find the common ground with ACP=
I).
> > That way the host bridge drivers don't have to do anything, but the=
 DT
> > creators have to specify a value.
> >=20
> > Pinging Rob to try to get a peek on this thoughts.
>=20
> Parsing "linux,pci-domain" from the PCI core code seems like the best
> solution to me, but we still have to support dtbs that don't contain
> it. Lorenzo's patch gets this right I think.

Agree. But we are not covering other architectures that use OF yet.

>=20
> ACPI is easy here, because it already requires the domain to be
> explicit.

I was thinking more along the line of code sharing.

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
