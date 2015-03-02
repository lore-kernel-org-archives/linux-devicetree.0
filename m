From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH] ARM: dts: at919260/at91sam9g20: fix SRAM device tree node
Date: Mon, 2 Mar 2015 14:03:29 +0800
Message-ID: <1425276209-4899-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nicolas.ferre@atmel.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, wenyou.yang@atmel.com, robh+dt@kernel.org, galak@codeaurora.org, linux@maxim.org.za, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fix PM does not work on the at91sam9g20ek board
--->8---
at91_pm_sram_init: failed to find sram device!
---<8---

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---
 arch/arm/boot/dts/at91sam9260.dtsi |    9 +++++++--
 arch/arm/boot/dts/at91sam9g20.dtsi |    9 +++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
index fff0ee6..d1eb27c 100644
--- a/arch/arm/boot/dts/at91sam9260.dtsi
+++ b/arch/arm/boot/dts/at91sam9260.dtsi
@@ -69,9 +69,14 @@
 		};
 	};
 
-	sram0: sram@002ff000 {
+	sram0: sram@00200000 {
 		compatible = "mmio-sram";
-		reg = <0x002ff000 0x2000>;
+		reg = <0x00200000 0x1000>;
+	};
+
+	sram1: sram@00300000 {
+		compatible = "mmio-sram";
+		reg = <0x00300000 0x1000>;
 	};
 
 	ahb {
diff --git a/arch/arm/boot/dts/at91sam9g20.dtsi b/arch/arm/boot/dts/at91sam9g20.dtsi
index f593016..eb9a62d 100644
--- a/arch/arm/boot/dts/at91sam9g20.dtsi
+++ b/arch/arm/boot/dts/at91sam9g20.dtsi
@@ -16,13 +16,14 @@
 		reg = <0x20000000 0x08000000>;
 	};
 
-	sram0: sram@002ff000 {
-		status = "disabled";
+	sram0: sram@00200000 {
+		compatible = "mmio-sram";
+		reg = <0x00200000 0x4000>;
 	};
 
-	sram1: sram@002fc000 {
+	sram1: sram@00300000 {
 		compatible = "mmio-sram";
-		reg = <0x002fc000 0x8000>;
+		reg = <0x00300000 0x4000>;
 	};
 
 	ahb {
-- 
1.7.9.5
