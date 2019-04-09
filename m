Return-Path: <SRS0=bisc=SL=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 03/12] dt-bindings: usb: ehci-r8a77470 devicetree binding
 document
Date: Tue, 9 Apr 2019 07:29:41 +0000
Message-ID: 
 <OSBPR01MB210356D078E426189767D1EDB82D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
 <1554123232-58942-4-git-send-email-biju.das@bp.renesas.com>
 <5ca841e1.1c69fb81.20175.d3d6@mx.google.com>
In-Reply-To: <5ca841e1.1c69fb81.20175.d3d6@mx.google.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

Thanks for the review.  I guess we need to drop this patch, if the solution=
 proposed by Shimoda-San is acceptable by everyone.
The same result can be achieved without using this driver. I have posted V3=
 based on this. please see the link below.

https://patchwork.kernel.org/patch/10883263/

ehci-r8a77479 driver =3D generic ehci driver + phy initialization code of r=
car-gen3-usb2 driver.

Regards,
Biju

> Subject: Re: [PATCH 03/12] dt-bindings: usb: ehci-r8a77470 devicetree
> binding document
>=20
> On Mon,  1 Apr 2019 13:53:43 +0100, Biju Das wrote:
> > Add device tree binding document for Renesas r8a77470(a.k.a RZ/G1C)
> > on-chip EHCI controller driver.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > V1-->V2
> >   * New patch
> > ---
> >  .../devicetree/bindings/usb/ehci-r8a77470.txt      | 35
> ++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/usb/ehci-r8a77470.txt
> >
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
