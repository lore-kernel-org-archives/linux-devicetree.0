Return-Path: <SRS0=byPw=N6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400104.outbound.protection.outlook.com ([40.107.140.104]:53808
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726175AbeKSSuq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 19 Nov 2018 13:50:46 -0500
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
Date: Mon, 19 Nov 2018 08:27:44 +0000
Message-ID: <OSBPR01MB2103D5EEB54FB45B637AF93BB8D80@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi All,

Gentle reminder, Is this patch looks ok to you? Or any changes needed.

Regards,
Biju

> -----Original Message-----
> From: Biju Das <biju.das@bp.renesas.com>
> Sent: 26 October 2018 09:25
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>
> Cc: Biju Das <biju.das@bp.renesas.com>; Simon Horman
> <horms@verge.net.au>; Magnus Damm <magnus.damm@gmail.com>;
> linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Daniel Lezcano
> <daniel.lezcano@linaro.org>; Thomas Gleixner <tglx@linutronix.de>; John
> Stultz <john.stultz@linaro.org>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>
> Subject: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
>
> This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch is tested against renesas-dev
>
> I have executed on inconsistency-check, nanosleep and clocksource_switch
> selftests on this arm64 SoC. The inconsistency-check and nanosleep tests =
are
> working fine.The clocksource_switch asynchronous test is failing due to
> inconsistency-check failure on "arch_sys_counter".
>
> But if i skip the clocksource_switching of "arch_sys_counter", the
> asynchronous test is passing for CMT0/1/2/3 timer.
>
> Has any one noticed this issue?
> ---
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 70
> ++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> index 1ec6aaa..d62febd0 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -401,6 +401,76 @@
>  reg =3D <0 0xe6060000 0 0x50c>;
>  };
>
> +cmt0: timer@e60f0000 {
> +compatible =3D "renesas,r8a7796-cmt0",
> +     "renesas,rcar-gen3-cmt0";
> +reg =3D <0 0xe60f0000 0 0x1004>;
> +interrupts =3D <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 303>;
> +clock-names =3D "fck";
> +power-domains =3D <&sysc
> R8A7796_PD_ALWAYS_ON>;
> +resets =3D <&cpg 303>;
> +status =3D "disabled";
> +};
> +
> +cmt1: timer@e6130000 {
> +compatible =3D "renesas,r8a7796-cmt1",
> +     "renesas,rcar-gen3-cmt1";
> +reg =3D <0 0xe6130000 0 0x1004>;
> +interrupts =3D <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 302>;
> +clock-names =3D "fck";
> +power-domains =3D <&sysc
> R8A7796_PD_ALWAYS_ON>;
> +resets =3D <&cpg 302>;
> +status =3D "disabled";
> +};
> +
> +cmt2: timer@e6140000 {
> +compatible =3D "renesas,r8a7796-cmt1",
> +     "renesas,rcar-gen3-cmt1";
> +reg =3D <0 0xe6140000 0 0x1004>;
> +interrupts =3D <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 301>;
> +clock-names =3D "fck";
> +power-domains =3D <&sysc
> R8A7796_PD_ALWAYS_ON>;
> +resets =3D <&cpg 301>;
> +status =3D "disabled";
> +};
> +
> +cmt3: timer@e6148000 {
> +compatible =3D "renesas,r8a7796-cmt1",
> +     "renesas,rcar-gen3-cmt1";
> +reg =3D <0 0xe6148000 0 0x1004>;
> +interrupts =3D <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
> +     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>;
> +clocks =3D <&cpg CPG_MOD 300>;
> +clock-names =3D "fck";
> +power-domains =3D <&sysc
> R8A7796_PD_ALWAYS_ON>;
> +resets =3D <&cpg 300>;
> +status =3D "disabled";
> +};
> +
>  cpg: clock-controller@e6150000 {
>  compatible =3D "renesas,r8a7796-cpg-mssr";
>  reg =3D <0 0xe6150000 0 0x1000>;
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
