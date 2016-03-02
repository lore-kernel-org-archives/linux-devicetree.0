From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 0/6] ARM64: meson: GXBaby (S905) and Vega S95 enablement
Date: Wed,  2 Mar 2016 03:34:55 +0100
Message-ID: <1456886101-22967-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-meson@googlegroups.com
Cc: Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>, Nicolas Saenz <nicolassaenzj@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, =?UTF-8?q?Andr=C3=A9=20Przywara?= <andre.przywara@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series adds initial support for the Amlogic S905 based
Tronsmart Vega S95 Pro, Meta and Telos TV boxes.

v2:
* Pick up previously acked "tronsmart" patch instead (Matthias)
* Drop ARM_GIC selection (Sudeep)
* Change some compatible strings (Sudeep, Andr=C3=A9)
* Squash some node changes/additions

Note: On the Vega S95 I need to change TEXT_OFFSET as follows,
in order to avoid the vendor U-Boot overwriting itself (fwiu);
for the Mini Mx that's reportedly not necessary.

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 354d75402ace..b7cebdb8b1ce 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -62,7 +62,7 @@ head-y                :=3D arch/arm64/kernel/head.o
 ifeq ($(CONFIG_ARM64_RANDOMIZE_TEXT_OFFSET), y)
 TEXT_OFFSET :=3D $(shell awk 'BEGIN {srand(); printf "0x%03x000\n", in=
t(512 * rand())}')
 else
-TEXT_OFFSET :=3D 0x00080000
+TEXT_OFFSET :=3D 0x01080000
 endif
=20
 # KASAN_SHADOW_OFFSET =3D VA_START + (1 << (VA_BITS - 3)) - (1 << 61)

This in turn runs into an apparent regression introduced with the
text offset randomization:

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 6ebd204da16a..afdec27c8871 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -48,7 +48,7 @@
 #elif (PAGE_OFFSET & 0x1fffff) !=3D 0
 #error PAGE_OFFSET must be at least 2MB aligned
 #elif TEXT_OFFSET > 0x1fffff
-#error TEXT_OFFSET must be less than 2MB
+//#error TEXT_OFFSET must be less than 2MB
 #endif
=20
 #define KERNEL_START   _text

https://en.opensuse.org/HCL:VegaS95

https://github.com/afaerber/linux/commits/vegas95-next

Regards,
Andreas

Cc: Andr=C3=A9 Przywara <andre.przywara@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: devicetree@vger.kernel.org

Andreas F=C3=A4rber (5):
  ARM64: Enable Amlogic Meson GXBaby platform
  Documentation: devicetree: amlogic: Document Meson GXBaby
  ARM64: dts: Prepare configs for Amlogic Meson GXBaby
  Documentation: devicetree: amlogic: Document Tronsmart Vega S95 board=
s
  ARM64: dts: amlogic: Add Tronsmart Vega S95 configs

Matthias Brugger (1):
  devicetree: bindings: Add vendor prefix for Tronsmart

 Documentation/devicetree/bindings/arm/amlogic.txt  |   7 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm64/Kconfig.platforms                       |   5 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   7 +
 .../boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts  |  55 +++++++
 .../boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts   |  55 +++++++
 .../boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts |  55 +++++++
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |  55 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        | 183 +++++++++++++=
++++++++
 10 files changed, 424 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/Makefile
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-met=
a.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro=
=2Edts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-tel=
os.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dts=
i
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi

--=20
2.6.2
