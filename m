From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v2] dt-bindings: PCI: rcar: Add device tree support for
 r8a774c0
Date: Tue, 5 Feb 2019 15:45:38 +0000
Message-ID: <TY1PR01MB17700A4F43A8F64656E1EDDAC06E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1545134562-22450-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190201174005.GD22887@e107981-ln.cambridge.arm.com>
 <20190205153656.aywg4ewpyp34i633@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190205153656.aywg4ewpyp34i633@verge.net.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Simon, hello Lorenzo

> From: Simon Horman <horms@verge.net.au>
> Sent: 05 February 2019 15:37
> Subject: Re: [PATCH v2] dt-bindings: PCI: rcar: Add device tree support f=
or r8a774c0
>
> On Fri, Feb 01, 2019 at 05:40:05PM +0000, Lorenzo Pieralisi wrote:
> > On Tue, Dec 18, 2018 at 12:02:42PM +0000, Fabrizio Castro wrote:
> > > Add PCIe support for the RZ/G2E (a.k.a. R8A774C0).
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v1->v2:
> > > * Dropped change to the description of "phys" optional property accor=
ding
> > >   to Geert's comment
> > >
> > >  Documentation/devicetree/bindings/pci/rcar-pci.txt | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > Hi Fabrizio,
> >
> > Apologies for the delay in responding.
> >
> > Should I take this patch via the PCI tree ?
>
> Thanks, that would the preferred option from my point of view.

I agree, and thank you for replying Simon, as Lorenzo's email was
caught in my spam filter somehow, and I would have missed it if
it wasn't for your reply.

Thanks,
Fab

>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
> >
> > Thanks,
> > Lorenzo
> >
> > >
> > > diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt b/Doc=
umentation/devicetree/bindings/pci/rcar-pci.txt
> > > index 976ef7b..6904882 100644
> > > --- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
> > > +++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> > > @@ -3,6 +3,7 @@
> > >  Required properties:
> > >  compatible: "renesas,pcie-r8a7743" for the R8A7743 SoC;
> > >      "renesas,pcie-r8a7744" for the R8A7744 SoC;
> > > +    "renesas,pcie-r8a774c0" for the R8A774C0 SoC;
> > >      "renesas,pcie-r8a7779" for the R8A7779 SoC;
> > >      "renesas,pcie-r8a7790" for the R8A7790 SoC;
> > >      "renesas,pcie-r8a7791" for the R8A7791 SoC;
> > > @@ -13,7 +14,8 @@ compatible: "renesas,pcie-r8a7743" for the R8A7743 =
SoC;
> > >      "renesas,pcie-r8a77990" for the R8A77990 SoC;
> > >      "renesas,pcie-rcar-gen2" for a generic R-Car Gen2 or
> > >       RZ/G1 compatible device.
> > > -    "renesas,pcie-rcar-gen3" for a generic R-Car Gen3 compatible dev=
ice.
> > > +    "renesas,pcie-rcar-gen3" for a generic R-Car Gen3 or
> > > +     RZ/G2 compatible device.
> > >
> > >      When compatible with the generic version, nodes must list the
> > >      SoC-specific version corresponding to the platform first
> > > --
> > > 2.7.4
> > >
> >


Renesas Electronics Europe GmbH,Geschaeftsfuehrer/President : Michael Hanna=
wald, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse =
10, 40472 Duesseldorf, Germany,Handelsregister/Commercial Register: Duessel=
dorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr.=
/WEEE reg. no.: DE 14978647
