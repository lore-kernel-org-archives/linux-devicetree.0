From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] dt-bindings: usb: renesas_usbhs: Add r8a774c0 support
Date: Fri, 14 Dec 2018 06:01:01 +0000
Message-ID: <TY2PR01MB2297D670A9D3B8D4B5BC0389D8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <1544732463-6685-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544732463-6685-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

> From: Fabrizio Castro, Sent: Friday, December 14, 2018 5:21 AM
>=20
> Document RZ/G2E (R8A774C0) SoC bindings.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

By the way, I'm not sure, but I'm wondering that we need to add
.compatible renesas,usbhs-r8a774c0 with .data USBHS_TYPE_RCAR_GEN3_WITH_PLL
like r8a77990 to the drivers/usb/renesas_usbhs/common.c.
What do you think?

Best regards,
Yoshihiro Shimoda

> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index 90719f5..d93b6a1 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -7,6 +7,7 @@ Required properties:
>  	- "renesas,usbhs-r8a7744" for r8a7744 (RZ/G1N) compatible device
>  	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
>  	- "renesas,usbhs-r8a774a1" for r8a774a1 (RZ/G2M) compatible device
> +	- "renesas,usbhs-r8a774c0" for r8a774c0 (RZ/G2E) compatible device
>  	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
>  	- "renesas,usbhs-r8a7791" for r8a7791 (R-Car M2-W) compatible device
>  	- "renesas,usbhs-r8a7792" for r8a7792 (R-Car V2H) compatible device
> --
> 2.7.4
