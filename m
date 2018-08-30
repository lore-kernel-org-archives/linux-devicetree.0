From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 0/6] Document r8a774a1 USB bindings
Date: Thu, 30 Aug 2018 03:01:15 +0000
Message-ID: <OSBPR01MB22938FC34C6AD58FF8A5B285D8080@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1535097375-5561-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535097375-5561-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@ti.com>, Biju Das <biju.das@bp.renesas.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio-san,

> From: Fabrizio Castro, Sent: Friday, August 24, 2018 4:56 PM
> To: Vinod Koul <vkoul@kernel.org>; Rob Herring <robh+dt@kernel.org>; Mark=
 Rutland <mark.rutland@arm.com>
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Greg Kroah-Hartman =
<gregkh@linuxfoundation.org>; Kishon Vijay
> Abraham I <kishon@ti.com>; Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesa=
s.com>; Biju Das <biju.das@bp.renesas.com>;
> dmaengine@vger.kernel.org; devicetree@vger.kernel.org; linux-usb@vger.ker=
nel.org; Simon Horman <horms@verge.net.au>;
> Geert Uytterhoeven <geert+renesas@glider.be>; Chris Paterson <Chris.Pater=
son2@renesas.com>;
> linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH 0/6] Document r8a774a1 USB bindings
>=20
> Dear All,
>=20
> this series aims at documenting USB related dt-bindings for the
> r8a774a1.
>=20
> Applies on next-20180823.
>=20
> Thanks,
> Fab
>=20
> Biju Das (1):
>   dt-bindings: dmaengine: usb-dmac: Add binding for r8a774a1
>=20
> Fabrizio Castro (5):
>   dt-bindings: rcar-gen3-phy-usb2: Add r8a774a1 support
>   dt-bindings: rcar-gen3-phy-usb3: Add r8a774a1 support
>   dt-bindings: usb-xhci: Add r8a774a1 support
>   dt-bindings: usb: renesas_usbhs: Add r8a774a1 support
>   usb: gadget: udc: renesas_usb3: Add r8a774a1 support

Thank you for the patch.
For this series:

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
