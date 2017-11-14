From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] arm: dts: ls1021a: Specify interrupt-affinity for pmu node
Date: Tue, 14 Nov 2017 16:09:48 +0100
Message-ID: <1510672189-13306-1-git-send-email-rasmus.villemoes@prevas.dk>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: Esben Haabendal <eha@deif.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rasmus Villemoes <rasmus.villemoes@prevas.dk>
List-Id: devicetree@vger.kernel.org

From: Esben Haabendal <eha@deif.com>

This avoids the warning

  hw perfevents: no interrupt-affinity property for /pmu, guessing.

Signed-off-by: Esben Haabendal <eha@deif.com>
[RV: adapt commit log to the warning emitted in current mainline]
Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 arch/arm/boot/dts/ls1021a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 9319e1f..d62af07 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -106,6 +106,7 @@
 		compatible = "arm,cortex-a7-pmu";
 		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
 
 	soc {
-- 
2.7.4
