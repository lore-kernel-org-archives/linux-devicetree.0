From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 2/4] ARM: dts: iwg20d-q7: Enable HS-USB
Date: Tue, 10 Oct 2017 08:30:48 +0000
Message-ID: <KL1PR06MB17026EC0998692285F11A116B8750@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1507555281-57845-1-git-send-email-biju.das@bp.renesas.com>
 <1507555281-57845-3-git-send-email-biju.das@bp.renesas.com>
 <cbf92515-644c-b677-80dd-f33028a3829d@cogentembedded.com>
 <20171010073057.GK2518@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171010073057.GK2518@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 10 October 2017 08:31
> To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Cc: Biju Das <biju.das@bp.renesas.com>; Rob Herring <robh+dt@kernel.org>;
> Mark Rutland <mark.rutland@arm.com>; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>; Magnus Damm
> <magnus.damm@gmail.com>; Chris Paterson <Chris.Paterson2@renesas.com>;
> Fabrizio Castro <fabrizio.castro@bp.renesas.com>;
> devicetree@vger.kernel.org; linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH 2/4] ARM: dts: iwg20d-q7: Enable HS-USB
>
> On Mon, Oct 09, 2017 at 07:18:24PM +0300, Sergei Shtylyov wrote:
> > Hello!
> >
> > On 10/09/2017 04:21 PM, Biju Das wrote:
> >
> > >Enable HS-USB device for the iWave G20D-Q7 carrier board based on
> > >RZ/G1M.
> > >Also disable the host mode support on usb otg port by default to
> > >avoid pin conflicts.
> > >
> > >Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > >Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> > >---
> > >  arch/arm/boot/dts/iwg20d-q7-common.dtsi | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > >diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > >b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > >index 1c072c0..e6b50c6 100644
> > >--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > >+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > [...]
> > >@@ -72,7 +78,7 @@
> > >  };
> > >  &pci0 {
> > >-status =3D "okay";
> > >+status =3D "disabled";
> >
> >    I think you may just omit this prop -- you most prolly have it
> > "disabloed" in the R8A7743's DT.
>
> Yes, I expect so too.

Thanks for the comments. I will send v2 with dropping "status" property .

> > >  pinctrl-0 =3D <&usb0_pins>;
> > >  pinctrl-names =3D "default";
> > >  };
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
