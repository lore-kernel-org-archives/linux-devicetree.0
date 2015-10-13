From: Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 1/4] arm64: dts: prepare foundation-v8.dts to cope with GICv3
Date: Tue, 13 Oct 2015 10:37:46 +0100
Message-ID: <1444729069-27922-2-git-send-email-andre.przywara@arm.com>
References: <1444729069-27922-1-git-send-email-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444729069-27922-1-git-send-email-andre.przywara@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk
Cc: devicetree@vger.kernel.org, drjones@redhat.com, marc.zyngier@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

To prepare the ARM foundation model to support GICv3, we adjust
the #address-cells property of the current GICv2 node to be
compatible with the two cells required for GICv3 later.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/arm/foundation-v8.dts | 88 +++++++++++++++----------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dts b/arch/arm64/boot/dts/arm/foundation-v8.dts
index 4eac8dc..3c5595d 100644
--- a/arch/arm64/boot/dts/arm/foundation-v8.dts
+++ b/arch/arm64/boot/dts/arm/foundation-v8.dts
@@ -75,7 +75,7 @@
 	gic: interrupt-controller@2c001000 {
 		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
-		#address-cells = <0>;
+		#address-cells = <2>;
 		interrupt-controller;
 		reg = <0x0 0x2c001000 0 0x1000>,
 		      <0x0 0x2c002000 0 0x1000>,
@@ -116,49 +116,49 @@
 
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 63>;
-		interrupt-map = <0 0  0 &gic 0  0 4>,
-				<0 0  1 &gic 0  1 4>,
-				<0 0  2 &gic 0  2 4>,
-				<0 0  3 &gic 0  3 4>,
-				<0 0  4 &gic 0  4 4>,
-				<0 0  5 &gic 0  5 4>,
-				<0 0  6 &gic 0  6 4>,
-				<0 0  7 &gic 0  7 4>,
-				<0 0  8 &gic 0  8 4>,
-				<0 0  9 &gic 0  9 4>,
-				<0 0 10 &gic 0 10 4>,
-				<0 0 11 &gic 0 11 4>,
-				<0 0 12 &gic 0 12 4>,
-				<0 0 13 &gic 0 13 4>,
-				<0 0 14 &gic 0 14 4>,
-				<0 0 15 &gic 0 15 4>,
-				<0 0 16 &gic 0 16 4>,
-				<0 0 17 &gic 0 17 4>,
-				<0 0 18 &gic 0 18 4>,
-				<0 0 19 &gic 0 19 4>,
-				<0 0 20 &gic 0 20 4>,
-				<0 0 21 &gic 0 21 4>,
-				<0 0 22 &gic 0 22 4>,
-				<0 0 23 &gic 0 23 4>,
-				<0 0 24 &gic 0 24 4>,
-				<0 0 25 &gic 0 25 4>,
-				<0 0 26 &gic 0 26 4>,
-				<0 0 27 &gic 0 27 4>,
-				<0 0 28 &gic 0 28 4>,
-				<0 0 29 &gic 0 29 4>,
-				<0 0 30 &gic 0 30 4>,
-				<0 0 31 &gic 0 31 4>,
-				<0 0 32 &gic 0 32 4>,
-				<0 0 33 &gic 0 33 4>,
-				<0 0 34 &gic 0 34 4>,
-				<0 0 35 &gic 0 35 4>,
-				<0 0 36 &gic 0 36 4>,
-				<0 0 37 &gic 0 37 4>,
-				<0 0 38 &gic 0 38 4>,
-				<0 0 39 &gic 0 39 4>,
-				<0 0 40 &gic 0 40 4>,
-				<0 0 41 &gic 0 41 4>,
-				<0 0 42 &gic 0 42 4>;
+		interrupt-map = <0 0  0 &gic 0 0 0  0 4>,
+				<0 0  1 &gic 0 0 0  1 4>,
+				<0 0  2 &gic 0 0 0  2 4>,
+				<0 0  3 &gic 0 0 0  3 4>,
+				<0 0  4 &gic 0 0 0  4 4>,
+				<0 0  5 &gic 0 0 0  5 4>,
+				<0 0  6 &gic 0 0 0  6 4>,
+				<0 0  7 &gic 0 0 0  7 4>,
+				<0 0  8 &gic 0 0 0  8 4>,
+				<0 0  9 &gic 0 0 0  9 4>,
+				<0 0 10 &gic 0 0 0 10 4>,
+				<0 0 11 &gic 0 0 0 11 4>,
+				<0 0 12 &gic 0 0 0 12 4>,
+				<0 0 13 &gic 0 0 0 13 4>,
+				<0 0 14 &gic 0 0 0 14 4>,
+				<0 0 15 &gic 0 0 0 15 4>,
+				<0 0 16 &gic 0 0 0 16 4>,
+				<0 0 17 &gic 0 0 0 17 4>,
+				<0 0 18 &gic 0 0 0 18 4>,
+				<0 0 19 &gic 0 0 0 19 4>,
+				<0 0 20 &gic 0 0 0 20 4>,
+				<0 0 21 &gic 0 0 0 21 4>,
+				<0 0 22 &gic 0 0 0 22 4>,
+				<0 0 23 &gic 0 0 0 23 4>,
+				<0 0 24 &gic 0 0 0 24 4>,
+				<0 0 25 &gic 0 0 0 25 4>,
+				<0 0 26 &gic 0 0 0 26 4>,
+				<0 0 27 &gic 0 0 0 27 4>,
+				<0 0 28 &gic 0 0 0 28 4>,
+				<0 0 29 &gic 0 0 0 29 4>,
+				<0 0 30 &gic 0 0 0 30 4>,
+				<0 0 31 &gic 0 0 0 31 4>,
+				<0 0 32 &gic 0 0 0 32 4>,
+				<0 0 33 &gic 0 0 0 33 4>,
+				<0 0 34 &gic 0 0 0 34 4>,
+				<0 0 35 &gic 0 0 0 35 4>,
+				<0 0 36 &gic 0 0 0 36 4>,
+				<0 0 37 &gic 0 0 0 37 4>,
+				<0 0 38 &gic 0 0 0 38 4>,
+				<0 0 39 &gic 0 0 0 39 4>,
+				<0 0 40 &gic 0 0 0 40 4>,
+				<0 0 41 &gic 0 0 0 41 4>,
+				<0 0 42 &gic 0 0 0 42 4>;
 
 		ethernet@2,02000000 {
 			compatible = "smsc,lan91c111";
-- 
2.5.1
