From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 4/4] arm64: dts: ti: k3-j721e-main: Add IPC sub-mailbox nodes
 for all R5Fs & DSPs
Date: Mon, 22 Jul 2019 15:20:24 -0500
Message-ID: <20190722202024.14867-5-s-anna@ti.com>
References: <20190722202024.14867-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722202024.14867-1-s-anna@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the sub-mailbox nodes that are used to communicate between MPU and
various remote processors present in the J721E SoCs. These include the
R5F remote processors in the dual-R5F cluster (MCU_R5FSS0) in the MCU
domain and the two dual-R5F clusters (MAIN_R5FSS0 & MAIN_R5FSS1) in the
MAIN domain; the two C66x DSP remote processors and the single C71x DSP
remote processor in the MAIN domain. The parent mailbox cluster nodes
are also enabled.

The sub-mailbox nodes utilize the System Mailbox clusters 0 through 4.
These sub-mailbox nodes are added to match the hard-coded mailbox
configuration used within the TI RTOS IPC software packages. The R5F
processor sub-systems are assumed to be running in Split mode, so a
sub-mailbox node is used by each of the R5F cores. The sub-mailbox node
for the first R5F core in each cluster is used in case of Lockstep mode.

NOTE:
The GIC_SPI interrupts to be used are dynamically allocated and managed
by the System Firmware through the ti-sci-intr irqchip driver. So, only
valid interrupts (each cluster's User 0 IRQ output) that are used by the
sub-mailbox devices are enabled. This is done to minimize the number of
NavSS Interrupt Router outputs utilized.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 60 +++++++++++++++++++++--
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 319d423b3440..2985c73154fd 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -102,7 +102,18 @@
 			#mbox-cells = <1>;
 			ti,mbox-num-users = <4>;
 			ti,mbox-num-fifos = <16>;
-			status = "disabled";
+			interrupt-parent = <&main_navss_intr>;
+			interrupts = <214 0>;
+
+			mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
+				ti,mbox-rx = <0 0 0>;
+				ti,mbox-tx = <1 0 0>;
+			};
+
+			mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
+				ti,mbox-rx = <2 0 0>;
+				ti,mbox-tx = <3 0 0>;
+			};
 		};
 
 		mailbox0_cluster1: mailbox@31f81000 {
@@ -111,7 +122,18 @@
 			#mbox-cells = <1>;
 			ti,mbox-num-users = <4>;
 			ti,mbox-num-fifos = <16>;
-			status = "disabled";
+			interrupt-parent = <&main_navss_intr>;
+			interrupts = <215 0>;
+
+			mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
+				ti,mbox-rx = <0 0 0>;
+				ti,mbox-tx = <1 0 0>;
+			};
+
+			mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
+				ti,mbox-rx = <2 0 0>;
+				ti,mbox-tx = <3 0 0>;
+			};
 		};
 
 		mailbox0_cluster2: mailbox@31f82000 {
@@ -120,7 +142,18 @@
 			#mbox-cells = <1>;
 			ti,mbox-num-users = <4>;
 			ti,mbox-num-fifos = <16>;
-			status = "disabled";
+			interrupt-parent = <&main_navss_intr>;
+			interrupts = <216 0>;
+
+			mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
+				ti,mbox-rx = <0 0 0>;
+				ti,mbox-tx = <1 0 0>;
+			};
+
+			mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
+				ti,mbox-rx = <2 0 0>;
+				ti,mbox-tx = <3 0 0>;
+			};
 		};
 
 		mailbox0_cluster3: mailbox@31f83000 {
@@ -129,7 +162,18 @@
 			#mbox-cells = <1>;
 			ti,mbox-num-users = <4>;
 			ti,mbox-num-fifos = <16>;
-			status = "disabled";
+			interrupt-parent = <&main_navss_intr>;
+			interrupts = <217 0>;
+
+			mbox_c66_0: mbox-c66-0 {
+				ti,mbox-rx = <0 0 0>;
+				ti,mbox-tx = <1 0 0>;
+			};
+
+			mbox_c66_1: mbox-c66-1 {
+				ti,mbox-rx = <2 0 0>;
+				ti,mbox-tx = <3 0 0>;
+			};
 		};
 
 		mailbox0_cluster4: mailbox@31f84000 {
@@ -138,7 +182,13 @@
 			#mbox-cells = <1>;
 			ti,mbox-num-users = <4>;
 			ti,mbox-num-fifos = <16>;
-			status = "disabled";
+			interrupt-parent = <&main_navss_intr>;
+			interrupts = <218 0>;
+
+			mbox_c71_0: mbox-c71-0 {
+				ti,mbox-rx = <0 0 0>;
+				ti,mbox-tx = <1 0 0>;
+			};
 		};
 
 		mailbox0_cluster5: mailbox@31f85000 {
-- 
2.22.0
