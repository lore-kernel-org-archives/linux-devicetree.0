From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: usb: renesas_usbhs: Add r8a774c0 support
Date: Fri, 14 Dec 2018 09:37:32 +0000
Message-ID: <TY1PR01MB1770B22A29EB0FB0402676A2C0A10@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1544732463-6685-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TY2PR01MB2297D670A9D3B8D4B5BC0389D8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
 <TYXPR01MB1775F0716AF9A20220FF961CC0A10@TYXPR01MB1775.jpnprd01.prod.outlook.com>
 <TY2PR01MB22970241F86719C84841D929D8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TY2PR01MB22970241F86719C84841D929D8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Thank you Yoshihiro-san

> From: Yoshihiro Shimoda
> Sent: 14 December 2018 09:15
> Subject: RE: [PATCH] dt-bindings: usb: renesas_usbhs: Add r8a774c0 suppor=
t
>
> Hello Fabrizio-san,
>
> > From: Fabrizio Castro, Sent: Friday, December 14, 2018 5:16 PM
> >
> > Hello Yoshihiro-san,
> >
> > Thank you for your feedback!
> >
> > > From: Yoshihiro Shimoda
> > > Sent: 14 December 2018 06:01
> > > Subject: RE: [PATCH] dt-bindings: usb: renesas_usbhs: Add r8a774c0 su=
pport
> > >
> > > Hi Fabrizio,
> > >
> > > > From: Fabrizio Castro, Sent: Friday, December 14, 2018 5:21 AM
> > > >
> > > > Document RZ/G2E (R8A774C0) SoC bindings.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > Thank you for the patch!
> > >
> > > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > >
> > > By the way, I'm not sure, but I'm wondering that we need to add
> > > .compatible renesas,usbhs-r8a774c0 with .data USBHS_TYPE_RCAR_GEN3_WI=
TH_PLL
> > > like r8a77990 to the drivers/usb/renesas_usbhs/common.c.
> > > What do you think?
> >
> > Yeah, you are right, I am going to send a patch for that shortly.
>
> Thank you for submitting a patch!
> I have reviewed you patch and submitted my Acked-by.
>
> Best regards,
> Yoshihiro Shimoda



[https://www2.renesas.eu/media/email/unicef.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
