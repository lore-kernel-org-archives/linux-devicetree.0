From: Mayuresh Chitale <mchitale@apm.com>
Subject: [PATCH 3/4] arm64: dts: Add APM X-Gene PCIe DMA device tree nodes
Date: Wed,  7 Jan 2015 10:58:56 +0530
Message-ID: <1420608537-12296-4-git-send-email-mchitale@apm.com>
References: <1420608537-12296-1-git-send-email-mchitale@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420608537-12296-1-git-send-email-mchitale@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dan.j.williams@intel.com, vinod.koul@intel.com, dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org, arnd@arndb.de, jcm@redhat.com, patches@apm.com, Mayuresh Chitale <mchitale@apm.com>, ddutile@redhat.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the device tree nodes for APM X-Gene PCIe DMA engine.
Since X-Gene SOC supports maximum 5 PCIe ports, 5 dts nodes
are added.

Signed-off-by: Mayuresh Chitale <mchitale@apm.com>
Signed-off-by: Tanmay Inamdar <tinamdar@apm.com>
---
 arch/arm64/boot/dts/apm/apm-storm.dtsi | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index f1ad9c2..2993d1e 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -469,6 +469,46 @@
 			clocks = <&pcie4clk 0>;
 		};
 
+		xpdma0: dma0@1f2b0154 {
+			status = "disabled";
+			compatible = "apm,xgene-pciedma";
+			reg = < 0x0 0x1f2b0154 0x0 0xc
+				0x0 0x1f2b0058 0x0 0x8>;
+			interrupts = <0x0 0xc6 0x4>;
+		};
+
+		xpdma1: dma1@1f2c0154 {
+			status = "disabled";
+			compatible = "apm,xgene-pciedma";
+			reg = < 0x0 0x1f2c0154 0x0 0xc
+				0x0 0x1f2c0058 0x0 0x8>;
+			interrupts = <0x0 0xcc 0x4>;
+		};
+
+		xpdma2: dma2@1f2d0154 {
+			status = "disabled";
+			compatible = "apm,xgene-pciedma";
+			reg = < 0x0 0x1f2d0154 0x0 0xc
+				0x0 0x1f2d0058 0x0 0x8>;
+			interrupts = <0x0 0xd2 0x4>;
+		};
+
+		xpdma3: dma3@1f500154 {
+			status = "disabled";
+			compatible = "apm,xgene-pciedma";
+			reg = < 0x0 0x1f500154 0x0 0xc
+				0x0 0x1f500058 0x0 0x8>;
+			interrupts = <0x0 0xd8 0x4>;
+		};
+
+		xpdma4: dma4@1f510154 {
+			status = "disabled";
+			compatible = "apm,xgene-pciedma";
+			reg = < 0x0 0x1f510154 0x0 0xc
+				0x0 0x1f510058 0x0 0x8>;
+			interrupts = <0x0 0xde 0x4>;
+		};
+
 		serial0: serial@1c020000 {
 			status = "disabled";
 			device_type = "serial";
-- 
2.2.1.212.gc5b9256
