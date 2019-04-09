Return-Path: <SRS0=dwc1=SL=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 03/12] dt-bindings: usb: ehci-r8a77470 devicetree binding
 document
Date: Tue, 9 Apr 2019 10:39:19 +0000
Message-ID: 
 <TYAPR01MB4271F4407213CCC5469E1B8BD82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
 <1554123232-58942-4-git-send-email-biju.das@bp.renesas.com>
 <5ca841e1.1c69fb81.20175.d3d6@mx.google.com>
 <OSBPR01MB210356D078E426189767D1EDB82D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB210356D078E426189767D1EDB82D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Biju-san,

> From: Biju Das, Sent: Tuesday, April 9, 2019 4:30 PM
>=20
> Hi Rob,
>=20
> Thanks for the review.  I guess we need to drop this patch, if the soluti=
on proposed by Shimoda-San is acceptable by everyone.
> The same result can be achieved without using this driver. I have posted =
V3 based on this. please see the link below.
>=20
> https://patchwork.kernel.org/patch/10883263/
>=20
> ehci-r8a77479 driver =3D generic ehci driver + phy initialization code of=
 rcar-gen3-usb2 driver.

I accept v3 based patches (for now I checked patch 1 to 4 only though).

Best regards,
Yoshihiro Shimoda
