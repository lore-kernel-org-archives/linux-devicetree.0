Return-Path: <SRS0=iC7B=MO=linux.intel.com=felipe.balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: usb: renesas_usb3: add bindings for r8a77990
In-Reply-To: <TY2PR01MB229731FDB2C43B022021E781D8E80@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <1538481507-24821-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1538481507-24821-2-git-send-email-yoshihiro.shimoda.uh@renesas.com> <87sh1o8ruz.fsf@linux.intel.com> <TY2PR01MB229731FDB2C43B022021E781D8E80@TY2PR01MB2297.jpnprd01.prod.outlook.com>
Date: Tue, 02 Oct 2018 15:52:38 +0300
Message-ID: <87pnws8q95.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> Hi Felipe-san,
>
>> From: Felipe Balbi, Sent: Tuesday, October 2, 2018 9:18 PM
>>=20
>> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
>>=20
>> > This patch adds bindings for r8a77990 (R-Car E3).
>> >
>> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> > ---
>> >  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
>> b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
>> > index b22f0a5..d366555 100644
>> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
>> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
>> > @@ -6,6 +6,7 @@ Required properties:
>> >  	- "renesas,r8a7795-usb3-peri"
>> >  	- "renesas,r8a7796-usb3-peri"
>> >  	- "renesas,r8a77965-usb3-peri"
>> > +	- "renesas,r8a77990-usb3-peri"
>> >  	- "renesas,rcar-gen3-usb3-peri" for a generic R-Car Gen3 or RZ/G2
>> >  	  compatible device
>>=20
>> oops:
>>=20
>> checking file Documentation/devicetree/bindings/usb/renesas_usb3.txt
>> Hunk #1 FAILED at 6.
>> 1 out of 1 hunk FAILED
>>=20
>> could you rebase against testing/next?
>
> Sorry for lack information.
> If possible, would you review/apply the following patch at first?
>
> https://patchwork.kernel.org/patch/10574879/
>
> Greg-san's repo already merged the patch like below:
>
> commit 28da90f19cdec24d669d75942fec227f4de37abd
> Author: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Date:   Fri Aug 24 08:56:15 2018 +0100
>
>     usb: gadget: udc: renesas_usb3: Add r8a774a1 support
>
>     Document RZ/G2M (R8A774A1) SoC bindings.
>
>     Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>     Reviewed-by: Biju Das <biju.das@bp.renesas.com>
>     Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>     Reviewed-by: Rob Herring <robh@kernel.org>
>     Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
>
> I think that almost all patches I or other guys sent for usb gadget are a=
lready
> merged into Greg-san's repo like below:

oh, understood. I can rebase my pull request on Greg's branch,
then. Greg, would you prefer that to avoid duplicated commits?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAluzahYACgkQzL64meEa
mQZHbxAAlYlJ/eTDNfGNwx5waQmLP0EVrAzUHe7ltiuI5bw39+bsy547xiEWE3eO
RUnoJNkxDo4abGy5wjskP19ENP3uvL+hOB0n5L1xgcTK9WDGrzTPTGzinf+Hlz1O
v0J+QysE9wGwLhvMHsBR5WkhILj/XA6YeMbcawnMxke7FivtHV/JHWa/Flzem+st
WzIKz/ElMYDGMai2UbhmDecdFmUKZSJumFLpmGksKQmOQayTDmEP0Y0sklfxRSkV
CTi+hSLrFkZgrdKRrl1s8haRhf52bKibkm+7Z4jEDKCphWXeYZUNiSOzrWITMETZ
n182Orr/owyJ6VQ+b3XEP8wAnMbF+FPMsDaAttEankJ4BmG6ahfrKKHslh+oP8Lg
BPn+27ltK7MVURSg/6LCdkmmiHxdT1Tuj7EIguUAadvdjdS9qsZslGKIsPDf6Bay
jBc+NgJ7Ny/v9oWmhdWGcaAqxbSR2JI3uQD066H82ZrdGZL+mcyf97IYvfn/7kuM
spJabViB5x1ZMkNfZIrJkaX+L3VoJr/0ZGAnctO7nu1Z5foqf0WP9MYovh2kY1Ep
pwS48AvdbZBoq+BuNI8Vn+iEii2KCDcKkFK9XxNhatkYPdqEu0dkUIhzx+wcJB+i
oEAIPoYkQBzt/wgsMkgQat86h78rIiMw4zPPnymgyBbmIDRDkbw=
=HKjn
-----END PGP SIGNATURE-----
--=-=-=--
