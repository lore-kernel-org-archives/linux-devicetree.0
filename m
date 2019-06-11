From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 0/6] Add USB2.0/CMT/TMU support to HiHope RZ/G2M
Date: Tue, 11 Jun 2019 13:12:04 +0000
Message-ID: <TYXPR01MB1775725F45944C969BCDD49EC0ED0@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
List-Id: devicetree@vger.kernel.org

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 11 June 2019 14:07
> Subject: [PATCH 0/6] Add USB2.0/CMT/TMU support to HiHope RZ/G2M
>=20
> Dear All,
>=20
> this series adds USB2.0/CMT/TMU support to the HiHope RZ/G2M.

Ah, I forgot to mention that this series depends on:
https://patchwork.kernel.org/cover/10980861/
https://patchwork.kernel.org/patch/10980997/
https://patchwork.kernel.org/patch/10986211/

Thanks,
Fab

>=20
> Thanks,
> Fab
>=20
> Fabrizio Castro (6):
>   arm64: dts: renesas: r8a774a1: Fix USB 2.0 clocks
>   arm64: dts: renesas: hihope-common: Add USB 2.0 support
>   arm64: dts: renesas: r8a774a1: Add CMT device nodes
>   clk: renesas: r8a774a1: Add TMU clock
>   dt-bindings: timer: renesas: tmu: Document r8a774a1 bindings
>   arm64: dts: renesas: r8a774a1: Add TMU device nodes
>=20
>  .../devicetree/bindings/timer/renesas,tmu.txt      |   1 +
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi     |  76 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi          | 151 +++++++++++++++=
++++--
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c            |   5 +
>  4 files changed, 225 insertions(+), 8 deletions(-)
>=20
> --
> 2.7.4
