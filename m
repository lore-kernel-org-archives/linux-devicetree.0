From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 00/10] Allwinner A64/H6 IR support
Date: Mon, 27 May 2019 16:59:35 +0200
Message-ID: <CAJiuCcdnQa0TArduT4yBbUyd+dOaM0cQ1JcRUQLXLR6s_5e8sA@mail.gmail.com>
References: <20190526222536.10917-1-peron.clem@gmail.com> <20190527134805.j7t4ffstrnhdml47@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527134805.j7t4ffstrnhdml47@core.my.home>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ond=C5=99ej,

On Mon, 27 May 2019 at 15:48, Ond=C5=99ej Jirman <megous@megous.com> wrote:
>
> Hi Cl=C3=A9ment,
>
> On Mon, May 27, 2019 at 12:25:26AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi,
> >
> > A64 IR support series[1] pointed out that an A31 bindings should be
> > introduced.
> >
> > This series introduce the A31 compatible bindings, then switch it on
> > the already existing board.
> >
> > Finally introduce A64 and H6 support.
>
> Does H6 support actually work? I don't see any driver changes and last ti=
me
> I tried with the exact same bindings, I got RCU stalls shortly after boot=
.

Actually, I have tested only on H6 on my Beelink GS1 with a "NEC" remote.

I have manually toggle the protocols and do a simple cat in /dev/input/even=
t0
# echo nec > /sys/class/rc/rc0/protocols
# cat /dev/input/event0 | hexdump
0000000 0093 0000 0000 0000 8bfb 0009 0000 0000
0000010 0004 0004 8028 0000 0093 0000 0000 0000
0000020 8bfb 0009 0000 0000 0000 0000 0000 0000
0000030 0093 0000 0000 0000 55be 000a 0000 0000
0000040 0004 0004 8028 0000 0093 0000 0000 0000
0000050 55be 000a 0000 0000 0000 0000 0000 0000
0000060 0093 0000 0000 0000 fa42 000d 0000 0000
0000070 0004 0004 8028 0000 0093 0000 0000 0000
0000080 fa42 000d 0000 0000 0000 0000 0000 0000
0000090 0093 0000 0000 0000 c41a 000e 0000 0000
00000a0 0004 0004 8028 0000 0093 0000 0000 0000
00000b0 c41a 000e 0000 0000 0000 0000 0000 0000


Which kernel did you test with? Do you have any log?

Thanks,
Cl=C3=A9ment

>
> Enabling/disabling ir node was enough to trigger/stop the RCU stalls on H=
6.
>
> regards,
>         o.
>
> > Regards,
> > Cl=C3=A9ment
> >
> > [1] https://lore.kernel.org/patchwork/patch/1031390/#1221464
> >
> > Changes since v1:
> >  - Document reset lines as required since A31
> >  - Explain the memory mapping difference in commit log
> >  - Fix misspelling "Allwiner" to "Allwinner"
> >
> > Cl=C3=A9ment P=C3=A9ron (8):
> >   dt-bindings: media: sunxi-ir: add A31 compatible
> >   media: rc: sunxi: Add A31 compatible
> >   ARM: dts: sunxi: prefer A31 instead of A13 for ir
> >   dt-bindings: media: sunxi-ir: Add A64 compatible
> >   dt-bindings: media: sunxi-ir: Add H6 compatible
> >   arm64: dts: allwinner: h6: Add IR receiver node
> >   arm64: dts: allwinner: h6: Enable IR on H6 boards
> >   arm64: defconfig: enable IR SUNXI option
> >
> > Igors Makejevs (1):
> >   arm64: dts: allwinner: a64: Add IR node
> >
> > Jernej Skrabec (1):
> >   arm64: dts: allwinner: a64: Enable IR on Orange Pi Win
> >
> >  .../devicetree/bindings/media/sunxi-ir.txt    | 11 +++++++++--
> >  arch/arm/boot/dts/sun6i-a31.dtsi              |  2 +-
> >  arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
> >  arch/arm/boot/dts/sun9i-a80.dtsi              |  2 +-
> >  arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  2 +-
> >  .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 ++++
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++++++++++++++++
> >  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 ++++
> >  .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  4 ++++
> >  .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  4 ++++
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 +++++++++++++++++++
> >  arch/arm64/configs/defconfig                  |  1 +
> >  drivers/media/rc/sunxi-cir.c                  |  1 +
> >  13 files changed, 68 insertions(+), 6 deletions(-)
> >
> > --
> > 2.20.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
