Return-Path: <SRS0=bLyw=SN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410102.outbound.protection.outlook.com ([40.107.141.102]:17269
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726139AbfDKIbA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 11 Apr 2019 04:31:00 -0400
From: Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH v2 00/20] Add more support to the RZ/G1C (r8a77470) SoC
Date: Thu, 11 Apr 2019 08:30:54 +0000
Message-ID: <TYAPR01MB2285FDDBEC874A3A0621C3CEB72F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, hideo inayoshi <h-inayoshi@jinso.co.jp>, "nv-dung@jinso.co.jp" <nv-dung@jinso.co.jp>, "na-hoan@jinso.co.jp" <na-hoan@jinso.co.jp>
List-ID: <devicetree@vger.kernel.org>

Hello Cao,

> From: devicetree-owner@vger.kernel.org <devicetree-owner@vger.kernel.org>
> On Behalf Of Cao Van Dong
> Sent: 11 April 2019 08:54
>=20
> Dear everyone,
>=20
> This series adds HSCIF,MSIOF,PWM,CAN,VIN,Audio,Audio-
> DMAC,Ether,VSP,FDP1,LVDS support
> for the RZ/G1C (r8a77470) SoC. It is based on the renesas-drivers-2019-04=
-02-
> v5.1-rc3 tag

Thank you for your work to upstream more support for the RZ/G1C!

> of renesas-drivers tree. Currently, I only add patches to the tree and co=
mpiled.
> Unfortunately, RZ/G1C board is not available, so I have not tested these =
patches
> on this board yet.
>=20
> cc Biju,
> I know it is very difficult. however I still want to ask if you can help =
me test
> them?
The problem here is that Biju and the team only have iwg23s-sbc boards [1],=
 which only expose these interfaces on external headers, in many cases with=
out the require transceivers etc., meaning that testing is difficult.

This is why we omitted them from the initial RZ/G1C upstreaming.

Some interfaces are pretty low risk, so the maintainers may well accept som=
e of your patches without testing I guess?

[1] https://www.iwavesystems.com/product/single-board-computer/rzg1c/rz-g1c=
-single-board-computer.html

> If possible, I will send the .dts file separately to you.
I think you'd also need PFC changes.

Kind regards, Chris

> Because I am known you can be available this board. Thanks!
>=20
> Cao Van Dong (20):
>   ARM: dts: r8a77470: Add HSCIF support
>   ARM: dts: r8a77470: Add MSIOF support
>   ARM: dts: r8a77470: Add PWM support
>   ARM: dts: r8a77470: Add CAN support
>   ARM: dts: r8a77470: Add VIN support
>   ARM: dts: r8a77470: Add Audio support
>   ARM: dts: r8a77470: Add Audio-DMAC support
>   ARM: dts: r8a77470: Add Ether support
>   ARM: dts: r8a77470: Add VSP support
>   ARM: dts: r8a77470: Add FDP1 support
>   ARM: dts: r8a77470: Add LVDS support
>   ARM: dts: r8a77470: Add audio clocks
>   ARM: dts: r8a77470: Add can clocks
>   dt-bindings: display: renesas: lvds: Add r8a77470 support
>   media: dt-bindings: media: rcar_vin: Document r8a77470 bindings
>   ASoC: rsnd: Document r8a77470 bindings
>   dt-bindings: pwm: Document r8a77470 bindings
>   sh_eth: Document r8a77470 bindings
>   spi: sh-msiof: Document r8a77470 bindings
>   dt-bindings: can: rcar_can: Document r8a77470 bindings
>=20
>  .../bindings/display/bridge/renesas,lvds.txt       |   1 +
>  .../devicetree/bindings/media/rcar_vin.txt         |   1 +
>  .../devicetree/bindings/net/can/rcar_can.txt       |   1 +
>  Documentation/devicetree/bindings/net/sh_eth.txt   |   1 +
>  .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   |   1 +
>  .../devicetree/bindings/sound/renesas,rsnd.txt     |   1 +
>  Documentation/devicetree/bindings/spi/sh-msiof.txt |   1 +
>  arch/arm/boot/dts/r8a77470.dtsi                    | 608 +++++++++++++++=
++++++
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                |   1 +
>  9 files changed, 616 insertions(+)
>=20
> --
> 2.7.4
