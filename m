From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] MIPS: DTS: cavium-octeon: provide model attribute
Date: Mon, 15 Feb 2016 06:26:17 +0100
Message-ID: <1455513977-934-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: devicetree@vger.kernel.org

Downstream packages like Debian flash-kernel rely on
/proc/device-tree/model
to determine how to install an updated kernel image.

Most dts files provide this property.
It is suggested by IEEE Std 1275-1994.

This patch adds a model attribute for Octeon CPUs.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts | 1 +
 arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts b/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
index 9c48e05..a746678 100644
--- a/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
+++ b/arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dts
@@ -8,6 +8,7 @@
  */
 / {
 	compatible = "cavium,octeon-3860";
+	model = "Cavium Octeon 3XXX";
 	#address-cells = <2>;
 	#size-cells = <2>;
 	interrupt-parent = <&ciu>;
diff --git a/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts b/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
index 79b46fc..c8a292a 100644
--- a/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
+++ b/arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts
@@ -8,6 +8,7 @@
  */
 / {
 	compatible = "cavium,octeon-6880";
+	model = "Cavium Octeon 68XX";
 	#address-cells = <2>;
 	#size-cells = <2>;
 	interrupt-parent = <&ciu2>;
-- 
2.1.4
