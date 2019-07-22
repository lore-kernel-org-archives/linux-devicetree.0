From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v5 00/13] Allwinner A64/H6 IR support
Date: Mon, 22 Jul 2019 20:48:47 +0200
Message-ID: <CAJiuCcetkGEpD_BrOvipi3yhy_TWgFYSVuLoExcw5=7nyPhY7A@mail.gmail.com>
References: <20190607231100.5894-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190607231100.5894-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This series received ack from device-tree, media and sunxi maintainers.

Can patch 2/3/4 goes to linux-media and the rest to linux-sunxi ?

Thanks,
Cl=C3=A9ment

On Sat, 8 Jun 2019 at 01:11, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>=
 wrote:
>
> Hi,
>
> A64 IR support series[1] pointed out that an A31 bindings should be
> introduced.
>
> This series introduce the A31 compatible bindings, then switch it on
> the already existing board.
>
> Finally introduce A64 and H6 support.
>
> I have reenable the other H6 boards IR support as Ondrej solve the issue.
>
> Regards,
> Cl=C3=A9ment
>
> [1] https://lore.kernel.org/patchwork/patch/1031390/#1221464
> [2] https://lkml.org/lkml/2019/5/27/321
> [3] https://patchwork.kernel.org/patch/10975563/
>
> Changes since v4:
>  - Reuse defines for RXSTA bits definition
>
> Changes since v3:
>  - Reenable IR for other H6 boards
>  - Add RXSTA bits definition
>  - Add Sean Young's "Acked-by" tags
>
> Changes since v2:
>  - Disable IR for other H6 boards
>  - Split DTS patch for H3/H5
>  - Introduce IR quirks
>
> Cl=C3=A9ment P=C3=A9ron (11):
>   dt-bindings: media: sunxi-ir: Add A31 compatible
>   media: rc: Introduce sunxi_ir_quirks
>   media: rc: sunxi: Add A31 compatible
>   media: rc: sunxi: Add RXSTA bits definition
>   ARM: dts: sunxi: Prefer A31 bindings for IR
>   ARM: dts: sunxi: Prefer A31 bindings for IR
>   dt-bindings: media: sunxi-ir: Add A64 compatible
>   dt-bindings: media: sunxi-ir: Add H6 compatible
>   arm64: dts: allwinner: h6: Add IR receiver node
>   arm64: dts: allwinner: h6: Enable IR on H6 boards
>   arm64: defconfig: Enable IR SUNXI option
>
> Igors Makejevs (1):
>   arm64: dts: allwinner: a64: Add IR node
>
> Jernej Skrabec (1):
>   arm64: dts: allwinner: a64: Enable IR on Orange Pi Win
>
>  .../devicetree/bindings/media/sunxi-ir.txt    | 11 ++-
>  arch/arm/boot/dts/sun6i-a31.dtsi              |  2 +-
>  arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
>  arch/arm/boot/dts/sun9i-a80.dtsi              |  2 +-
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  2 +-
>  .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++
>  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 +
>  .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  4 +
>  .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  4 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 ++++
>  arch/arm64/configs/defconfig                  |  1 +
>  drivers/media/rc/sunxi-cir.c                  | 88 ++++++++++++++-----
>  13 files changed, 135 insertions(+), 26 deletions(-)
>
> --
> 2.20.1
>
