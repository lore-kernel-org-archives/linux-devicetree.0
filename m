From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 2/4] arm64: dts: ti: k3-am65-base-board: Add IPC
 sub-mailbox nodes for R5Fs
Date: Wed, 24 Jul 2019 19:10:18 -0500
Message-ID: <20190725001020.23781-3-s-anna@ti.com>
References: <20190725001020.23781-1-s-anna@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190725001020.23781-1-s-anna@ti.com>
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
the two R5F remote processors present in the MCU domain to the AM654
EVM base board. These sub-mailbox nodes utilize the System Mailbox
clusters 0 and 1. The interrupts associated with the Mailbox Cluster
User interrupt used by the sub-mailbox nodes are also added. The GIC_SPI
interrupt to be used is dynamically allocated and managed by the System
Firmware through the ti-sci-intr irqchip driver. All the remaining
mailbox clusters are currently not used on A53 core, and so are disabled.

The sub-mailbox nodes added match the hard-coded mailbox configuration
used within the TI RTOS IPC software packages. The Cortex R5F processor
sub-system is assumed to be running in Split mode, so a sub-mailbox node
is used by each of the R5F cores. Only the sub-mailbox node from cluster 0
is used in case of Lockstep mode.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2:
 - Sub-mailboxes added in board dts file instead of base dtsi file
 - Unused mailbox clusters 2 through 11 disabled
 - Patch description and title updated
v1: https://patchwork.kernel.org/patch/11053405/

 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 52c245d36db9..579b7a474f35 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -279,3 +279,61 @@
 &pcie1_ep {
 	status = "disabled";
 };
+
+&mailbox0_cluster0 {
+	interrupts = <164 0>;
+
+	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
+		ti,mbox-tx = <1 0 0>;
+		ti,mbox-rx = <0 0 0>;
+	};
+};
+
+&mailbox0_cluster1 {
+	interrupts = <165 0>;
+
+	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
+		ti,mbox-tx = <1 0 0>;
+		ti,mbox-rx = <0 0 0>;
+	};
+};
+
+&mailbox0_cluster2 {
+	status = "disabled";
+};
+
+&mailbox0_cluster3 {
+	status = "disabled";
+};
+
+&mailbox0_cluster4 {
+	status = "disabled";
+};
+
+&mailbox0_cluster5 {
+	status = "disabled";
+};
+
+&mailbox0_cluster6 {
+	status = "disabled";
+};
+
+&mailbox0_cluster7 {
+	status = "disabled";
+};
+
+&mailbox0_cluster8 {
+	status = "disabled";
+};
+
+&mailbox0_cluster9 {
+	status = "disabled";
+};
+
+&mailbox0_cluster10 {
+	status = "disabled";
+};
+
+&mailbox0_cluster11 {
+	status = "disabled";
+};
-- 
2.22.0
