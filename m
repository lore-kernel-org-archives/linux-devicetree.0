From: <Yuantian.Tang@freescale.com>
Subject: [PATCH v4] ARM: dts: ls1021a: add sata node to dts
Date: Tue, 15 Dec 2015 15:14:14 +0800
Message-ID: <1450163654-15836-1-git-send-email-Yuantian.Tang@freescale.com>
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
To: shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tang Yuantian <Yuantian.Tang@freescale.com>
List-Id: devicetree@vger.kernel.org

From: Tang Yuantian <Yuantian.Tang@freescale.com>

Added sata node to ls1021aqds and ls1021atwr board to support
sata function.

Signed-off-by: Tang Yuantian <Yuantian.Tang@freescale.com>
---
v4:
	- sorted the node alphabetically
v3:
	- refine the title and commit message
	- added a status property so that sata can be controlled
	by board specific dts.
v2:
	- put reg-names right after reg property

 arch/arm/boot/dts/ls1021a-qds.dts |  4 ++++
 arch/arm/boot/dts/ls1021a-twr.dts |  4 ++++
 arch/arm/boot/dts/ls1021a.dtsi    | 11 +++++++++++
 3 files changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021a-qds.dts
index 0521e68..9408753 100644
--- a/arch/arm/boot/dts/ls1021a-qds.dts
+++ b/arch/arm/boot/dts/ls1021a-qds.dts
@@ -320,6 +320,10 @@
 	status = "okay";
 };
 
+&sata {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
index fbb89d1..d44f4d5 100644
--- a/arch/arm/boot/dts/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/ls1021a-twr.dts
@@ -212,6 +212,10 @@
 	status = "okay";
 };
 
+&sata {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 9430a99..da9bd7e 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -143,6 +143,17 @@
 			status = "disabled";
 		};
 
+		sata: sata@3200000 {
+			compatible = "fsl,ls1021a-ahci";
+			reg = <0x0 0x3200000 0x0 0x10000>,
+			      <0x0 0x20220520 0x0 0x4>;
+			reg-names = "ahci", "sata-ecc";
+			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&platform_clk 1>;
+			dma-coherent;
+			status = "disabled";
+		};
+
 		scfg: scfg@1570000 {
 			compatible = "fsl,ls1021a-scfg", "syscon";
 			reg = <0x0 0x1570000 0x0 0x10000>;
-- 
2.1.0.27.g96db324
