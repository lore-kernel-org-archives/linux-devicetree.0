Return-Path: <SRS0=URY0=UR=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: PCI: rcar: Add device tree support for
 r8a774a1
Date: Tue, 18 Jun 2019 10:38:21 +0000
Message-ID: 
 <OSBPR01MB2103F1D063171E45B4E5034DB8EA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1559891016-56157-1-git-send-email-biju.das@bp.renesas.com>
 <20190612114629.wpazihf5ea3g4wjn@verge.net.au>
 <20190614163351.GA30511@e121166-lin.cambridge.arm.com>
In-Reply-To: <20190614163351.GA30511@e121166-lin.cambridge.arm.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hello Lorenzo and Simon,

Thanks for the feedback.

> Subject: Re: [PATCH] dt-bindings: PCI: rcar: Add device tree support for
> r8a774a1
>=20
> On Wed, Jun 12, 2019 at 01:46:29PM +0200, Simon Horman wrote:
> > On Fri, Jun 07, 2019 at 08:03:36AM +0100, Biju Das wrote:
> > > Add PCIe support for the RZ/G2M (a.k.a. R8A774A1).
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>=20
> Should I pick this up and send it via the PCI tree ?
>=20
> Just let me know please, thanks.

Simon,=20
What do you think ?

Regards,
Biju

>=20
> > > ---
> > >  Documentation/devicetree/bindings/pci/rcar-pci.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt
> b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> > > index 6904882..45bba9f 100644
> > > --- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
> > > +++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
> > > @@ -3,6 +3,7 @@
> > >  Required properties:
> > >  compatible: "renesas,pcie-r8a7743" for the R8A7743 SoC;
> > >  	    "renesas,pcie-r8a7744" for the R8A7744 SoC;
> > > +	    "renesas,pcie-r8a774a1" for the R8A774A1 SoC;
> > >  	    "renesas,pcie-r8a774c0" for the R8A774C0 SoC;
> > >  	    "renesas,pcie-r8a7779" for the R8A7779 SoC;
> > >  	    "renesas,pcie-r8a7790" for the R8A7790 SoC;
> > > --
> > > 2.7.4
> > >
