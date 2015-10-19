From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH 4/8] arm64: dts: berlin4ct: add watchdog nodes
Date: Mon, 19 Oct 2015 16:49:45 +0800
Message-ID: <1445244589-4838-5-git-send-email-jszhang@marvell.com>
References: <1445244589-4838-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1445244589-4838-1-git-send-email-jszhang@marvell.com>
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

The Marvell Berlin BG4CT has 3 watchdogs which are compatible with the
snps,dw-wdt driver sit in the sysmgr domain. This patch adds the
corresponding device tree nodes.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm64/boot/dts/marvell/berlin4ct.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
index a3b5f1d..8eddf10 100644
--- a/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
+++ b/arch/arm64/boot/dts/marvell/berlin4ct.dtsi
@@ -241,6 +241,30 @@
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
+			wdt0: watchdog@3000 {
+				compatible = "snps,dw-wdt";
+				reg = <0x3000 0x100>;
+				clocks = <&osc>;
+				interrupts = <0>;
+				status = "disabled";
+			};
+
+			wdt1: watchdog@4000 {
+				compatible = "snps,dw-wdt";
+				reg = <0x4000 0x100>;
+				clocks = <&osc>;
+				interrupts = <1>;
+				status = "disabled";
+			};
+
+			wdt2: watchdog@5000 {
+				compatible = "snps,dw-wdt";
+				reg = <0x5000 0x100>;
+				clocks = <&osc>;
+				interrupts = <2>;
+				status = "disabled";
+			};
+
 			sm_gpio0: gpio@8000 {
 				compatible = "snps,dw-apb-gpio";
 				reg = <0x8000 0x400>;
-- 
2.6.1
