From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 5/8] ARM: bcm2835: Move the CPU/peripheral include out of common RPi DT.
Date: Wed, 16 Dec 2015 15:55:12 -0800
Message-ID: <1450310115-22163-6-git-send-email-eric@anholt.net>
References: <1450310115-22163-1-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450310115-22163-1-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

For Raspberry Pi 2, we want to use the same general pin assignment
bits, but need to use bcm2836.dtsi for the CPU instead.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts | 1 +
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts | 1 +
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts | 1 +
 arch/arm/boot/dts/bcm2835-rpi-b.dts      | 1 +
 arch/arm/boot/dts/bcm2835-rpi.dtsi       | 2 --
 5 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
index b2bff43..228614f 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
@@ -1,4 +1,5 @@
 /dts-v1/;
+#include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
index 668442b..ef54050 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
@@ -1,4 +1,5 @@
 /dts-v1/;
+#include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
index eab8b591..86f1f2f 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
@@ -1,4 +1,5 @@
 /dts-v1/;
+#include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm2835-rpi-b.dts
index ff6b2d1..4859e9d 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b.dts
@@ -1,4 +1,5 @@
 /dts-v1/;
+#include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index 3572f03..3afb9fe 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -1,5 +1,3 @@
-#include "bcm2835.dtsi"
-
 / {
 	memory {
 		reg = <0 0x10000000>;
-- 
2.6.2
