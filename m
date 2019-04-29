Return-Path: <SRS0=r54Y=S7=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH V5 06/13] dt-bindings: usb: renesas_usbhs: Add support for
 r8a77470
Date: Mon, 29 Apr 2019 09:16:01 +0000
Message-ID: 
 <OSBPR01MB2103DD45B93A448E2C8C6911B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
 <1554907730-14792-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554907730-14792-7-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Greg,

Does this patch looks ok to you?=20

Regards,
Biju

> -----Original Message-----
> From: Biju Das <biju.das@bp.renesas.com>
> Sent: 10 April 2019 15:49
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>
> Cc: Biju Das <biju.das@bp.renesas.com>; Simon Horman
> <horms@verge.net.au>; Magnus Damm <magnus.damm@gmail.com>;
> linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>
> Subject: [PATCH V5 06/13] dt-bindings: usb: renesas_usbhs: Add support fo=
r
> r8a77470
>=20
> Document support for RZ/G1C (R8A77470) SoC.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v4-->v5
>   * No change
> v3-->v4
>   * No change
> V2-->V3
>   * No change
> V1-->V2
>   * New patch
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index d93b6a1..b8acc2a 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -6,6 +6,7 @@ Required properties:
>  	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
>  	- "renesas,usbhs-r8a7744" for r8a7744 (RZ/G1N) compatible device
>  	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
> +	- "renesas,usbhs-r8a77470" for r8a77470 (RZ/G1C) compatible device
>  	- "renesas,usbhs-r8a774a1" for r8a774a1 (RZ/G2M) compatible
> device
>  	- "renesas,usbhs-r8a774c0" for r8a774c0 (RZ/G2E) compatible device
>  	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
> --
> 2.7.4
