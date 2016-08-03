From: Ian Campbell <ijc@hellion.org.uk>
Subject: [PATCH v2 1/2] ARM: dts: Remove use of skeleton.dtsi from bcm283x.dtsi
Date: Wed,  3 Aug 2016 15:12:44 +0100
Message-ID: <1470233565-30154-1-git-send-email-ijc@hellion.org.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Ian Campbell <ijc@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, arm@kernel.org
List-Id: devicetree@vger.kernel.org

This file is included from DTS files under arch/arm64 too (via
broadcom/bcm2837-rpi-3-b.dts and broadcom/bcm2837.dtsi). There is a desire
not to have skeleton.dtsi for ARM64. See commit 3ebee5a2e141 ("arm64: dts:
kill skeleton.dtsi") for rationale for its removal.

As well as the addition of #*-cells also requires adding the device_type to
the rpi memory node explicitly.

Note that this change results in the removal of an empty /aliases node from
bcm2835-rpi-a.dtb and bcm2835-rpi-a-plus.dtb. I have no hardware to check
if this is a problem or not.

It also results in some reordering of the nodes in the DTBs (the /aliases
and /memory nodes come later). This isn't supposed to matter but, again,
I've no hardware to check if it is true in this particular case.

Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: arm@kernel.org
---
v2: New patch to avoid needing to add skeleton.dtsi to arch/arm64
---
 arch/arm/boot/dts/bcm2835-rpi.dtsi | 1 +
 arch/arm/boot/dts/bcm283x.dtsi     | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index caf2707..e9b47b2 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -2,6 +2,7 @@
 
 / {
 	memory {
+		device_type = "memory";
 		reg = <0 0x10000000>;
 	};
 
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index b982522..445624a 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -2,7 +2,6 @@
 #include <dt-bindings/clock/bcm2835.h>
 #include <dt-bindings/clock/bcm2835-aux.h>
 #include <dt-bindings/gpio/gpio.h>
-#include "skeleton.dtsi"
 
 /* This include file covers the common peripherals and configuration between
  * bcm2835 and bcm2836 implementations, leaving the CPU configuration to
@@ -13,6 +12,8 @@
 	compatible = "brcm,bcm2835";
 	model = "BCM2835";
 	interrupt-parent = <&intc>;
+	#address-cells = <1>;
+	#size-cells = <1>;
 
 	chosen {
 		bootargs = "earlyprintk console=ttyAMA0";
-- 
2.8.1
