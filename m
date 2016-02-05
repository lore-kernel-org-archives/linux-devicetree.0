From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH 2/5] ARM: dts: NSP: Fix CPU DT issue
Date: Fri,  5 Feb 2016 17:43:21 -0500
Message-ID: <1454712204-30419-3-git-send-email-jonmason@broadcom.com>
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

There is a double definition of the CPUs present in the device tree.
Remove unnecessary cpu device tree definition.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index c5b0c09c..c37778e 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -68,18 +68,6 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		cpus {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cpu@0 {
-				device_type = "cpu";
-				compatible = "arm,cortex-a9";
-				next-level-cache = <&L2>;
-				reg = <0x0>;
-			};
-		};
-
 		a9pll: arm_clk@00000 {
 			#clock-cells = <0>;
 			compatible = "brcm,nsp-armpll";
-- 
1.9.1
