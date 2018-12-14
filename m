From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] usb: gadget: udc: renesas_usb3: Add bindings for r8a774c0
Date: Fri, 14 Dec 2018 08:58:49 +0000
Message-ID: <TY2PR01MB22979B32566BCD1614272A2ED8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <1544732538-7049-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544732538-7049-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

> From: Fabrizio Castro, Sent: Friday, December 14, 2018 5:22 AM
>=20
> Document RZ/G2E (R8A774C0) SoC bindings.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> index d366555..35039e7 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> @@ -3,6 +3,7 @@ Renesas Electronics USB3.0 Peripheral driver
>  Required properties:
>    - compatible: Must contain one of the following:
>  	- "renesas,r8a774a1-usb3-peri"
> +	- "renesas,r8a774c0-usb3-peri"
>  	- "renesas,r8a7795-usb3-peri"
>  	- "renesas,r8a7796-usb3-peri"
>  	- "renesas,r8a77965-usb3-peri"
> --
> 2.7.4
