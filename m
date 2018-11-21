Return-Path: <SRS0=YZ5O=OA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:13088
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726001AbeKUVBm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 21 Nov 2018 16:01:42 -0500
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
Date: Wed, 21 Nov 2018 10:27:41 +0000
Message-ID: <OSBPR01MB2103BCCCF78DA986B112C8A8B8DA0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
 <20181121102421.yxndb3dyfxput25f@verge.net.au>
In-Reply-To: <20181121102421.yxndb3dyfxput25f@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thanks for the feedback.

> -----Original Message-----
> From: Simon Horman <horms@verge.net.au>
> Sent: 21 November 2018 10:24
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Daniel Lezcano
> <daniel.lezcano@linaro.org>; Thomas Gleixner <tglx@linutronix.de>; John
> Stultz <john.stultz@linaro.org>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
>
> On Fri, Oct 26, 2018 at 09:25:07AM +0100, Biju Das wrote:
> > This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > This patch is tested against renesas-dev
> >
> > I have executed on inconsistency-check, nanosleep and
> > clocksource_switch selftests on this arm64 SoC. The
> > inconsistency-check and nanosleep tests are working fine.The
> > clocksource_switch asynchronous test is failing due to inconsistency-ch=
eck
> failure on "arch_sys_counter".
> >
> > But if i skip the clocksource_switching of "arch_sys_counter", the
> > asynchronous test is passing for CMT0/1/2/3 timer.
> >
> > Has any one noticed this issue?
>
> I am reluctant to apply this patch until there is a better understanding =
of the
> issue above.

If I understand correctly this patch has no issue at all. The problem is re=
lated to ARM architecture  timer.
Please correct me if you think otherwise.

Regards,
Biju



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
