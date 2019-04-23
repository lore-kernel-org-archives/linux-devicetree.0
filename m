From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: usb-xhci: Add r8a774c0 support
Date: Tue, 23 Apr 2019 15:32:59 +0000
Message-ID: <TY1PR01MB1770DB45DCD263C6933B9210C0230@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1544732471-6730-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYXPR01MB1775A4A3AF86097F284C4A08C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <20190301161624.GA19937@kroah.com>
 <TYXPR01MB17756DBAF2FD7A1F2A9B82B0C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TYXPR01MB17756DBAF2FD7A1F2A9B82B0C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "mathias.nyman@intel.com" <mathias.nyman@intel.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hello Simon,

I know you don't normally take this type of patches, but this one has been =
around for more than 4 months now, and I am losing hope here...

Do you think you can this patch?

Thanks,
Fab

> From: linux-kernel-owner@vger.kernel.org <linux-kernel-owner@vger.kernel.=
org> On Behalf Of Fabrizio Castro
> Sent: 01 March 2019 16:37
> Subject: RE: [PATCH] dt-bindings: usb-xhci: Add r8a774c0 support
>=20
> Hello Greg,
>=20
> Thank you for your reply!
>=20
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: 01 March 2019 16:16
> > To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Cc: linux-usb@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel=
@vger.kernel.org; Simon Horman <horms@verge.net.au>;
> > Geert Uytterhoeven <geert+renesas@glider.be>; Chris Paterson <Chris.Pat=
erson2@renesas.com>; Biju Das
> > <biju.das@bp.renesas.com>; linux-renesas-soc@vger.kernel.org; Rob Herri=
ng <robh+dt@kernel.org>; Mark Rutland
> > <mark.rutland@arm.com>
> > Subject: Re: [PATCH] dt-bindings: usb-xhci: Add r8a774c0 support
> >
> > On Fri, Mar 01, 2019 at 11:25:33AM +0000, Fabrizio Castro wrote:
> > > Hello Greg,
> > >
> > > I am sorry to bother you.
> > > Do you think you take this patch?
> >
> > device tree bindings need an ack from the DT maintainers before I can
> > take them.  Also, this is for xhci, the xhci maintainer is responsible
> > for those, not me :)
>=20
> I am so sorry.
>=20
> The patch has been reviewed by Geert Uytterhoeven, Simon Horman, and Rob =
Herring already.
>=20
> Mathias, are you the one taking the patches for Documentation/devicetree/=
bindings/usb/usb-xhci.txt now?
>=20
> Thanks,
> Fab
>=20
> >
> > thanks,
> >
> > greg k-h
