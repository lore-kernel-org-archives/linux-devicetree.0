From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH linux-next v1 2/4] clk: renesas: Add binding document for AVB
 Counter Clock
Date: Sat, 03 Nov 2018 20:14:11 -0700
Message-ID: <154130125117.88331.5969014008610987799@swboyd.mtv.corp.google.com>
References: <20181025072349.15173-1-jiada_wang@mentor.com>
 <20181025072349.15173-3-jiada_wang@mentor.com>
 <154083775062.98144.11157403961171783929@swboyd.mtv.corp.google.com>
 <9f9fbf3a-4455-bdf3-0438-b39b9cdda112@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f9fbf3a-4455-bdf3-0438-b39b9cdda112@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiada Wang <jiada_wang@mentor.com>, geert+renesas@glider.be, horms@verge.net.au, magnus.damm@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jiada Wang (2018-10-31 05:00:49)
> On 2018/10/30 3:29, Stephen Boyd wrote:
> > Quoting jiada_wang@mentor.com (2018-10-25 00:23:47)
> >> +Required Properties:
> >> +  - compatible: Must be "renesas,clk-avb"
> >> +  - reg: Base address and length of the memory resource used by the A=
VB
> >> +  - #clock-cells: Must be 1
> >> +
> >> +Example
> >> +-------
> >> +
> >> +       clk_avb: avb-clock@ec5a011c {
> >> +               compatible =3D "renesas,clk-avb";
> >> +               reg =3D <0 0xec5a011c 0 0x24>;
> > This is an odd register offset. Is this just one clk inside of a larger
> > clk controller?
> >
> Yes, avb_counter clock is part of Audio Clock Generator reg: <0 =

> 0xec5a0000 0 0x140>,
> but "adg" has already been declared in R-Car GEN2/GEN3 SoC .dtsi file, =

> with reg: <0 0xec5a0000 0 0x100>,
> which leaves <0 0xec5a0100 0 0x140> currently not used by any module.
> =


So why can't we expand the register size in the dts file and update the
audio clock generator driver to register this avb clock too? Presumably
the mapping is large enough to cover the clk registers already so it is
more of a formality to expand the register size than a requirement.
