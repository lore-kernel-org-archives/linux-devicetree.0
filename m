From: Bhupesh Sharma <bhupesh.sharma@freescale.com>
Subject: [PATCH v2 2/2] dts/ls2080a: Update DTSI to add support of SP805 WDT
Date: Fri, 11 Dec 2015 17:17:47 +0530
Message-ID: <1449834467-30283-3-git-send-email-bhupesh.sharma@freescale.com>
References: <1449834467-30283-1-git-send-email-bhupesh.sharma@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1449834467-30283-1-git-send-email-bhupesh.sharma@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, olof@lixom.net, devicetree@vger.kernel.org, robh@kernel.org, will.deacon@arm.com
Cc: LeoLi@freescale.com, bhupesh.sharma@freescale.com, Catalin.Marinas@arm.com, stuart.yoder@freescale.com, scottwood@freescale.com, bhupesh.linux@gmail.com
List-Id: devicetree@vger.kernel.org

This patch updates the LS2080a DTSI (DTS Include) file to add
support for eight SP805 Watchdog units which can be used to
reset the eight Cortex-A57 cores available on LS2080A.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@freescale.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi |   56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index e81cd48..7b0f411 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -193,6 +193,62 @@
 			interrupts = <0 32 0x4>; /* Level high type */
 		};
 
+		cluster1_core0_watchdog: wdt@c000000 {
+			compatible = "arm,sp805-wdt", "arm,primecell";
+			reg = <0x0 0xc000000 0x0 0x1000>;
+			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+			clock-names = "apb_pclk", "wdog_clk";
+		};
+
+		cluster1_core1_watchdog: wdt@c010000 {
+			compatible = "arm,sp805-wdt", "arm,primecell";
+			reg = <0x0 0xc010000 0x0 0x1000>;
+			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+			clock-names = "apb_pclk", "wdog_clk";
+		};
+
+		cluster2_core0_watchdog: wdt@c100000 {
+			compatible = "arm,sp805-wdt", "arm,primecell";
+			reg = <0x0 0xc100000 0x0 0x1000>;
+			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+			clock-names = "apb_pclk", "wdog_clk";
+		};
+
+		cluster2_core1_watchdog: wdt@c110000 {
+			compatible = "arm,sp805-wdt", "arm,primecell";
+			reg = <0x0 0xc110000 0x0 0x1000>;
+			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+			clock-names = "apb_pclk", "wdog_clk";
+		};
+
+		cluster3_core0_watchdog: wdt@c200000 {
+			compatible = "arm,sp805-wdt", "arm,primecell";
+			reg = <0x0 0xc200000 0x0 0x1000>;
+			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+			clock-names = "apb_pclk", "wdog_clk";
+		};
+
+		cluster3_core1_watchdog: wdt@c210000 {
+			compatible = "arm,sp805-wdt", "arm,primecell";
+			reg = <0x0 0xc210000 0x0 0x1000>;
+			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+			clock-names = "apb_pclk", "wdog_clk";
+		};
+
+		cluster4_core0_watchdog: wdt@c300000 {
+			compatible = "arm,sp805-wdt", "arm,primecell";
+			reg = <0x0 0xc300000 0x0 0x1000>;
+			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+			clock-names = "apb_pclk", "wdog_clk";
+		};
+
+		cluster4_core1_watchdog: wdt@c310000 {
+			compatible = "arm,sp805-wdt", "arm,primecell";
+			reg = <0x0 0xc310000 0x0 0x1000>;
+			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
+			clock-names = "apb_pclk", "wdog_clk";
+		};
+
 		fsl_mc: fsl-mc@80c000000 {
 			compatible = "fsl,qoriq-mc";
 			reg = <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
-- 
1.7.9.5
