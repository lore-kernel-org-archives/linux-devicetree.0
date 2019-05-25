From: "kernelci.org bot" <bot@kernelci.org>
Subject: clk/clk-next boot bisection: v5.2-rc1-4-gf191a146bcee on
 meson-g12a-x96-max
Date: Fri, 24 May 2019 18:00:06 -0700 (PDT)
Message-ID: <5ce89396.1c69fb81.16e3d.2c5c@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com, mgalka@collabora.com, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org, matthew.hart@linaro.orgkhilman@baylibre.com, enric.balletbo@collabora.com, Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

clk/clk-next boot bisection: v5.2-rc1-4-gf191a146bcee on meson-g12a-x96-max

Summary:
  Start:      f191a146bcee Merge branch 'clk-fixes' into clk-next
  Details:    https://kernelci.org/boot/id/5ce8391259b514c80a7a362c
  Plain log:  https://storage.kernelci.org//clk/clk-next/v5.2-rc1-4-gf191a1=
46bcee/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/boot-me=
son-g12a-x96-max.txt
  HTML log:   https://storage.kernelci.org//clk/clk-next/v5.2-rc1-4-gf191a1=
46bcee/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/boot-me=
son-g12a-x96-max.html
  Result:     11a7bea17c9e arm64: dts: meson: g12a: add pinctrl support con=
trollers

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       clk
  URL:        https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
  Branch:     clk-next
  Target:     meson-g12a-x96-max
  CPU arch:   arm64
  Lab:        lab-baylibre
  Compiler:   gcc-8
  Config:     defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Test suite: boot

Breaking commit found:

---------------------------------------------------------------------------=
----
commit 11a7bea17c9e0a36daab934d83e15a760f402147
Author: Jerome Brunet <jbrunet@baylibre.com>
Date:   Mon Mar 18 10:58:45 2019 +0100

    arm64: dts: meson: g12a: add pinctrl support controllers
    =

    Add the peripheral and always-on pinctrl controllers to the g12a soc.
    =

    Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
    Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
    Signed-off-by: Kevin Hilman <khilman@baylibre.com>

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-g12a.dtsi
index abfa167751af..5e07e4ca3f4b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -104,6 +104,29 @@
 				#address-cells =3D <2>;
 				#size-cells =3D <2>;
 				ranges =3D <0x0 0x0 0x0 0x34400 0x0 0x400>;
+
+				periphs_pinctrl: pinctrl@40 {
+					compatible =3D "amlogic,meson-g12a-periphs-pinctrl";
+					#address-cells =3D <2>;
+					#size-cells =3D <2>;
+					ranges;
+
+					gpio: bank@40 {
+						reg =3D <0x0 0x40  0x0 0x4c>,
+						      <0x0 0xe8  0x0 0x18>,
+						      <0x0 0x120 0x0 0x18>,
+						      <0x0 0x2c0 0x0 0x40>,
+						      <0x0 0x340 0x0 0x1c>;
+						reg-names =3D "gpio",
+							    "pull",
+							    "pull-enable",
+							    "mux",
+							    "ds";
+						gpio-controller;
+						#gpio-cells =3D <2>;
+						gpio-ranges =3D <&periphs_pinctrl 0 0 86>;
+					};
+				};
 			};
 =

 			hiu: bus@3c000 {
@@ -150,6 +173,25 @@
 					clocks =3D <&xtal>, <&clkc CLKID_CLK81>;
 					clock-names =3D "xtal", "mpeg-clk";
 				};
+
+				ao_pinctrl: pinctrl@14 {
+					compatible =3D "amlogic,meson-g12a-aobus-pinctrl";
+					#address-cells =3D <2>;
+					#size-cells =3D <2>;
+					ranges;
+
+					gpio_ao: bank@14 {
+						reg =3D <0x0 0x14 0x0 0x8>,
+						      <0x0 0x1c 0x0 0x8>,
+						      <0x0 0x24 0x0 0x14>;
+						reg-names =3D "mux",
+							    "ds",
+							    "gpio";
+						gpio-controller;
+						#gpio-cells =3D <2>;
+						gpio-ranges =3D <&ao_pinctrl 0 0 15>;
+					};
+				};
 			};
 =

 			sec_AO: ao-secure@140 {
---------------------------------------------------------------------------=
----


Git bisection log:

---------------------------------------------------------------------------=
----
git bisect start
# good: [62e59c4e69b3cdbad67e3c2d49e4df4cfe1679e3] clk: Remove io.h from cl=
k-provider.h
git bisect good 62e59c4e69b3cdbad67e3c2d49e4df4cfe1679e3
# bad: [f191a146bcee3dfd62a501432d22a55ef67858b4] Merge branch 'clk-fixes' =
into clk-next
git bisect bad f191a146bcee3dfd62a501432d22a55ef67858b4
# good: [e7a1414f9dc3498c4c35b9ca266d539e8bccab53] Merge tag 'media/v5.1-2'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect good e7a1414f9dc3498c4c35b9ca266d539e8bccab53
# good: [cccd559e98c05b669bdc37b01802f920cff1d6dd] Merge tag 'fbdev-v5.2' o=
f git://github.com/bzolnier/linux
git bisect good cccd559e98c05b669bdc37b01802f920cff1d6dd
# good: [a455eda33faafcaac1effb31d682765b14ef868c] Merge branch 'linus' of =
git://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal
git bisect good a455eda33faafcaac1effb31d682765b14ef868c
# bad: [e8a1d70117116c8d96c266f0b99e931717670eaf] Merge tag 'armsoc-dt' of =
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad e8a1d70117116c8d96c266f0b99e931717670eaf
# bad: [64f32d9d30063149eb10d7be3a23b5e1f44247c8] Merge tag 'renesas-arm64-=
dt2-for-v5.2' of https://git.kernel.org/pub/scm/linux/kernel/git/horms/rene=
sas into arm/dt
git bisect bad 64f32d9d30063149eb10d7be3a23b5e1f44247c8
# bad: [da9a4c3d32eb699db68dd8f3e633ec035879d818] Merge tag 'omap-for-v5.2/=
dt-ti-sysc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/=
linux-omap into arm/dt
git bisect bad da9a4c3d32eb699db68dd8f3e633ec035879d818
# bad: [bbf7499dc033831ae91125a88a062910cdc62cf2] Merge tag 'aspeed-5.2-dev=
icetree' of git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed into =
arm/dt
git bisect bad bbf7499dc033831ae91125a88a062910cdc62cf2
# bad: [f6f9683c5aedff214433fa130e67a79f08a47fdb] Merge tag 'v5.2-rockchip-=
dts32-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockc=
hip into arm/dt
git bisect bad f6f9683c5aedff214433fa130e67a79f08a47fdb
# bad: [e2cffeb398f4830b004774444809ee256b9bc653] arm64: dts: meson-g12a: A=
dd CMA reserved memory
git bisect bad e2cffeb398f4830b004774444809ee256b9bc653
# bad: [11a7bea17c9e0a36daab934d83e15a760f402147] arm64: dts: meson: g12a: =
add pinctrl support controllers
git bisect bad 11a7bea17c9e0a36daab934d83e15a760f402147
# good: [7e09092aee006b21d830b99f8498b5640b8711f6] arm64: dts: meson-gxl-s9=
05d-phicomm-n1: add status LED
git bisect good 7e09092aee006b21d830b99f8498b5640b8711f6
# good: [965c827ac37e71f76d3ac55c75ac08909f2a4eed] arm64: dts: meson: g12a:=
 add efuse
git bisect good 965c827ac37e71f76d3ac55c75ac08909f2a4eed
# good: [b019f4a4199f865b054262ff78f606ca70f7b981] arm64: dts: meson: g12a:=
 Add AO Clock + Reset Controller support
git bisect good b019f4a4199f865b054262ff78f606ca70f7b981
# first bad commit: [11a7bea17c9e0a36daab934d83e15a760f402147] arm64: dts: =
meson: g12a: add pinctrl support controllers
---------------------------------------------------------------------------=
----
