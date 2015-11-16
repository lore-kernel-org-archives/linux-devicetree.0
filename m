From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH RESEND 1/8] arm: dts: berlin2q: add watchdog nodes
Date: Mon, 16 Nov 2015 19:09:47 +0800
Message-ID: <1447672194-483-2-git-send-email-jszhang@marvell.com>
References: <1447672194-483-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1447672194-483-1-git-send-email-jszhang@marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com
Cc: Jisheng Zhang <jszhang@marvell.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Marvell Berlin BG2Q has 3 watchdogs which are compatible with the
snps,dw-wdt driver sit in the sysmgr domain. This patch adds the
corresponding device tree nodes.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index a3ecde5..fac4315 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -483,6 +483,30 @@
 			ranges = <0 0xfc0000 0x10000>;
 			interrupt-parent = <&sic>;
 
+			wdt0: watchdog@1000 {
+				compatible = "snps,dw-wdt";
+				reg = <0x1000 0x100>;
+				clocks = <&refclk>;
+				interrupts = <0>;
+				status = "disabled";
+			};
+
+			wdt1: watchdog@2000 {
+				compatible = "snps,dw-wdt";
+				reg = <0x2000 0x100>;
+				clocks = <&refclk>;
+				interrupts = <1>;
+				status = "disabled";
+			};
+
+			wdt2: watchdog@3000 {
+				compatible = "snps,dw-wdt";
+				reg = <0x3000 0x100>;
+				clocks = <&refclk>;
+				interrupts = <2>;
+				status = "disabled";
+			};
+
 			sm_gpio1: gpio@5000 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x5000 0x400>;
-- 
2.6.1
