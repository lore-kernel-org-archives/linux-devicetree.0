From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] PCI: add missing DT binding for linux,pci-domain property
Date: Thu, 6 Nov 2014 10:05:18 +0000
Message-ID: <20141106100518.GI8916@e106497-lin.cambridge.arm.com>
References: <1415101660-26450-1-git-send-email-l.stach@pengutronix.de>
 <20141105231743.GI6168@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20141105231743.GI6168@google.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 05, 2014 at 11:17:43PM +0000, Bjorn Helgaas wrote:
> On Tue, Nov 04, 2014 at 12:47:40PM +0100, Lucas Stach wrote:
> > This property was added by 41e5c0f81d3e
> > (of/pci: Add pci_get_new_domain_nr() and of_get_pci_domain_nr())
> > without the required binding documentation. As this property
> > will be supported by a number of host bridge drivers going forward,
> > add it to the common PCI binding doc.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>=20
> I merged 41e5c0f81d3e through my tree, and I could merge something li=
ke
> this if a consensus develops with some acks.  But I'll just let you g=
uys
> handle it unless you poke me again.

While I think the "linux,pci-domain" property *must* be documented, I
would like to get a consensus first on the usage. If we agree that
the property is mandatory to all host bridge drivers that use OF then
we need to patch existing drivers (partially done through Lorenzo's
patches, but other arches are ignoring it). If we say all *new* drivers
need to use it then we also need to come up with a strategy on how to
deal with old vs new school drivers.

My preferred approach is the 3rd way: "linux,pci-domain" becomes part o=
f
the core PCI infrastructure (and we find the common ground with ACPI).
That way the host bridge drivers don't have to do anything, but the DT
creators have to specify a value.

Pinging Rob to try to get a peek on this thoughts.

Best regards,
Liviu

>=20
> > ---
> > This is a non-critical fix, but may still qualify for 3.18-rc as
> > the property was added in this release cycle.
> > ---
> >  Documentation/devicetree/bindings/pci/pci.txt | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Docume=
ntation/devicetree/bindings/pci/pci.txt
> > index 41aeed38926d..b754f786ed5e 100644
> > --- a/Documentation/devicetree/bindings/pci/pci.txt
> > +++ b/Documentation/devicetree/bindings/pci/pci.txt
> > @@ -7,3 +7,13 @@ And for the interrupt mapping part:
> > =20
> >  Open Firmware Recommended Practice: Interrupt Mapping
> >  http://www.openfirmware.org/1275/practice/imap/imap0_9d.pdf
> > +
> > +Additionally to the properties specified in the above standards a =
host bridge
> > +driver implementation may support the following properties:
> > +
> > +- linux,pci-domain:
> > +   If present this property assigns a fixed PCI domain number to a=
 host bridge,
> > +   otherwise an unstable (across boots) unique number will be assi=
gned.
> > +   It is recommended to either not set this property at all or set=
 it for all
> > +   host bridges in the system, otherwise potentially conflicting d=
omain numbers
> > +   may be assigned to root buses behind different host bridges.
> > --=20
> > 2.1.1
> >=20
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
