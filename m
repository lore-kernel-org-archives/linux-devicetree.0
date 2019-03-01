From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: usb-xhci: Add r8a774c0 support
Date: Fri, 1 Mar 2019 11:25:33 +0000
Message-ID: <TYXPR01MB1775A4A3AF86097F284C4A08C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1544732471-6730-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544732471-6730-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hello Greg,

I am sorry to bother you.
Do you think you take this patch?

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 13 December 2018 20:21
> Subject: [PATCH] dt-bindings: usb-xhci: Add r8a774c0 support
>=20
> Document RZ/G2E (R8A774C0) SoC bindings.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documen=
tation/devicetree/bindings/usb/usb-xhci.txt
> index fea8b15..97400e8 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -10,6 +10,7 @@ Required properties:
>      - "renesas,xhci-r8a7743" for r8a7743 SoC
>      - "renesas,xhci-r8a7744" for r8a7744 SoC
>      - "renesas,xhci-r8a774a1" for r8a774a1 SoC
> +    - "renesas,xhci-r8a774c0" for r8a774c0 SoC
>      - "renesas,xhci-r8a7790" for r8a7790 SoC
>      - "renesas,xhci-r8a7791" for r8a7791 SoC
>      - "renesas,xhci-r8a7793" for r8a7793 SoC
> --
> 2.7.4
