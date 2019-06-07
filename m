From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 00/13] Allwinner A64/H6 IR support
Date: Sat,  8 Jun 2019 01:10:47 +0200
Message-ID: <20190607231100.5894-1-peron.clem@gmail.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBDW65PTQKGQEB6VD5GI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

A64 IR support series[1] pointed out that an A31 bindings should be
introduced.

This series introduce the A31 compatible bindings, then switch it on
the already existing board.

Finally introduce A64 and H6 support.

I have reenable the other H6 boards IR support as Ondrej solve the issue.

Regards,
Cl=C3=A9ment

[1] https://lore.kernel.org/patchwork/patch/1031390/#1221464
[2] https://lkml.org/lkml/2019/5/27/321
[3] https://patchwork.kernel.org/patch/10975563/

Changes since v4:
 - Reuse defines for RXSTA bits definition

Changes since v3:
 - Reenable IR for other H6 boards
 - Add RXSTA bits definition
 - Add Sean Young's "Acked-by" tags

Changes since v2:
 - Disable IR for other H6 boards
 - Split DTS patch for H3/H5
 - Introduce IR quirks

Cl=C3=A9ment P=C3=A9ron (11):
  dt-bindings: media: sunxi-ir: Add A31 compatible
  media: rc: Introduce sunxi_ir_quirks
  media: rc: sunxi: Add A31 compatible
  media: rc: sunxi: Add RXSTA bits definition
  ARM: dts: sunxi: Prefer A31 bindings for IR
  ARM: dts: sunxi: Prefer A31 bindings for IR
  dt-bindings: media: sunxi-ir: Add A64 compatible
  dt-bindings: media: sunxi-ir: Add H6 compatible
  arm64: dts: allwinner: h6: Add IR receiver node
  arm64: dts: allwinner: h6: Enable IR on H6 boards
  arm64: defconfig: Enable IR SUNXI option

Igors Makejevs (1):
  arm64: dts: allwinner: a64: Add IR node

Jernej Skrabec (1):
  arm64: dts: allwinner: a64: Enable IR on Orange Pi Win

 .../devicetree/bindings/media/sunxi-ir.txt    | 11 ++-
 arch/arm/boot/dts/sun6i-a31.dtsi              |  2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
 arch/arm/boot/dts/sun9i-a80.dtsi              |  2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  2 +-
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 +
 .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  4 +
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  4 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 ++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/media/rc/sunxi-cir.c                  | 88 ++++++++++++++-----
 13 files changed, 135 insertions(+), 26 deletions(-)

--=20
2.20.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190607231100.5894-1-peron.clem%40gmail.com.
For more options, visit https://groups.google.com/d/optout.
