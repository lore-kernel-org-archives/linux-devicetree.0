From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] dt-bindings: usb: renesas_usbhs: Add r8a774c0 support
Date: Fri, 14 Dec 2018 09:15:22 +0000
Message-ID: <TY2PR01MB22970241F86719C84841D929D8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <1544732463-6685-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TY2PR01MB2297D670A9D3B8D4B5BC0389D8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <TYXPR01MB1775F0716AF9A20220FF961CC0A10@TYXPR01MB1775.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TYXPR01MB1775F0716AF9A20220FF961CC0A10@TYXPR01MB1775.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Fabrizio-san,

> From: Fabrizio Castro, Sent: Friday, December 14, 2018 5:16 PM
>=20
> Hello Yoshihiro-san,
>=20
> Thank you for your feedback!
>=20
> > From: Yoshihiro Shimoda
> > Sent: 14 December 2018 06:01
> > Subject: RE: [PATCH] dt-bindings: usb: renesas_usbhs: Add r8a774c0 supp=
ort
> >
> > Hi Fabrizio,
> >
> > > From: Fabrizio Castro, Sent: Friday, December 14, 2018 5:21 AM
> > >
> > > Document RZ/G2E (R8A774C0) SoC bindings.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Thank you for the patch!
> >
> > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > By the way, I'm not sure, but I'm wondering that we need to add
> > .compatible renesas,usbhs-r8a774c0 with .data USBHS_TYPE_RCAR_GEN3_WITH=
_PLL
> > like r8a77990 to the drivers/usb/renesas_usbhs/common.c.
> > What do you think?
>=20
> Yeah, you are right, I am going to send a patch for that shortly.

Thank you for submitting a patch!
I have reviewed you patch and submitted my Acked-by.

Best regards,
Yoshihiro Shimoda
