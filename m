Return-Path: <SRS0=Pvvy=MO=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: usb: renesas_usb3: add bindings for
 r8a77990
Date: Tue, 2 Oct 2018 12:35:07 +0000
Message-ID: 
 <TY2PR01MB229731FDB2C43B022021E781D8E80@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: 
 <1538481507-24821-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1538481507-24821-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <87sh1o8ruz.fsf@linux.intel.com>
In-Reply-To: <87sh1o8ruz.fsf@linux.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Felipe Balbi <balbi@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Felipe-san,

> From: Felipe Balbi, Sent: Tuesday, October 2, 2018 9:18 PM
>=20
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
>=20
> > This patch adds bindings for r8a77990 (R-Car E3).
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > index b22f0a5..d366555 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > @@ -6,6 +6,7 @@ Required properties:
> >  	- "renesas,r8a7795-usb3-peri"
> >  	- "renesas,r8a7796-usb3-peri"
> >  	- "renesas,r8a77965-usb3-peri"
> > +	- "renesas,r8a77990-usb3-peri"
> >  	- "renesas,rcar-gen3-usb3-peri" for a generic R-Car Gen3 or RZ/G2
> >  	  compatible device
>=20
> oops:
>=20
> checking file Documentation/devicetree/bindings/usb/renesas_usb3.txt
> Hunk #1 FAILED at 6.
> 1 out of 1 hunk FAILED
>=20
> could you rebase against testing/next?

Sorry for lack information.
If possible, would you review/apply the following patch at first?

https://patchwork.kernel.org/patch/10574879/

Greg-san's repo already merged the patch like below:

commit 28da90f19cdec24d669d75942fec227f4de37abd
Author: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Date:   Fri Aug 24 08:56:15 2018 +0100

    usb: gadget: udc: renesas_usb3: Add r8a774a1 support

    Document RZ/G2M (R8A774A1) SoC bindings.

    Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
    Reviewed-by: Biju Das <biju.das@bp.renesas.com>
    Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
    Reviewed-by: Rob Herring <robh@kernel.org>
    Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


I think that almost all patches I or other guys sent for usb gadget are alr=
eady
merged into Greg-san's repo like below:

29f7915 Merge 4.19-rc6 into usb-next
<snip>
4d2a863 usb: renesas_usbhs: add support for R-Car E3
bcddbd3 dt-bindings: usb: renesas_usbhs: add bindings for r8a77990
6b983ac usb: renesas_usbhs: rcar3: Use OTG mode for R-Car D3
eb757ff Revert "usb: renesas_usbhs: set the mode by using extcon state for =
non-o
91b20c5 Revert "usb: renesas_usbhs: add extcon notifier to set mode for non=
-otg
<snip>
3df0e24 usb: renesas_usbhs: Add multiple clocks management
8e0d368 dt-bindings: usb: renesas_usbhs: add clock-names property
f181dbb usb: renesas_usbhs: Add reset_control
<snip>
28da90f usb: gadget: udc: renesas_usb3: Add r8a774a1 support
3938e13 dt-bindings: usb: renesas_usbhs: Add r8a774a1 support
...

Best regards,
Yoshihiro Shimoda

> --
> balbi
