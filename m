From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH 3/5] ARM: dts: NSP: Add PMU Support to DT
Date: Fri,  5 Feb 2016 17:43:22 -0500
Message-ID: <1454712204-30419-4-git-send-email-jonmason@broadcom.com>
References: <1454712204-30419-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1454712204-30419-1-git-send-email-jonmason@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add support for the ARM Performance Monitor Unit to the Northstar Plus
device tree.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index c37778e..415a0a6 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -45,14 +45,14 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
 			reg = <0x0>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
@@ -62,6 +62,13 @@
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+
 	mpcore {
 		compatible = "simple-bus";
 		ranges = <0x00000000 0x19000000 0x00023000>;
-- 
1.9.1
