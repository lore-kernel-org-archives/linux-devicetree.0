From: Liu Gang <Gang.Liu@nxp.com>
Subject: [PATCH] arm64: dts: ls2080a: Add 'dma-coherent' for ls2080a PCI nodes
Date: Thu, 8 Sep 2016 10:31:44 +0800
Message-ID: <1473301904-27259-1-git-send-email-Gang.Liu@nxp.com>
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
To: robh+dt@kernel.org, shawnguo@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, scott.wood@nxp.com
Cc: minghuan.lian@nxp.com, Liu Gang <Gang.Liu@nxp.com>, mingkai.hu@nxp.com
List-Id: devicetree@vger.kernel.org

The 'dma-coherent' indicates that the hardware IP block can ensure
the coherency of the data transferred from/to the IP block. This
can avoid the software cache flush/invalid actions, and improve
the performance significantly.

The PCI IP block of ls2080a has this capability, so adding this
feature to improve the PCI performance.

Signed-off-by: Liu Gang <Gang.Liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index e3b6034..4eba766 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -588,6 +588,7 @@
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
+			dma-coherent;
 			num-lanes = <4>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x10 0x00010000 0x0 0x00010000   /* downstream I/O */
@@ -612,6 +613,7 @@
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
+			dma-coherent;
 			num-lanes = <4>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x12 0x00010000 0x0 0x00010000   /* downstream I/O */
@@ -636,6 +638,7 @@
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
+			dma-coherent;
 			num-lanes = <8>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x14 0x00010000 0x0 0x00010000   /* downstream I/O */
@@ -660,6 +663,7 @@
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
+			dma-coherent;
 			num-lanes = <4>;
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x16 0x00010000 0x0 0x00010000   /* downstream I/O */
-- 
2.1.0.27.g96db324
