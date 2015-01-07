From: Mayuresh Chitale <mchitale@apm.com>
Subject: [PATCH 2/4] Documentation: dt-bindings: Add the binding info for APM
 X-Gene PCIe DMA driver
Date: Wed,  7 Jan 2015 10:58:55 +0530
Message-ID: <1420608537-12296-3-git-send-email-mchitale@apm.com>
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

This patch adds the device tree binding information for X-Gene PCIe DMA driver.

Signed-off-by: Mayuresh Chitale <mchitale@apm.com>
Signed-off-by: Tanmay Inamdar <tinamdar@apm.com>
---
 Documentation/devicetree/bindings/dma/xgene-pciedma.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/xgene-pciedma.txt

diff --git a/Documentation/devicetree/bindings/dma/xgene-pciedma.txt b/Documentation/devicetree/bindings/dma/xgene-pciedma.txt
new file mode 100644
index 0000000..52ee87a
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/xgene-pciedma.txt
@@ -0,0 +1,16 @@
+* X-Gene PCIe Direct Memory Access Controller
+
+Required properties:
+- compatible :
+	- "apm,xgene-pciedma" for pcie DMA on X-Gene SoC
+- interrupts : An interrupt-specifier which is used to handle DMA interrupts
+
+Examples:
+		pciedma0 {
+			status = "disabled";
+			compatible = "apm,xgene-pciedma";
+			reg = < 0x0 0x1F2B0154 0x0 0xC
+				0x0 0x1F2B0058 0x0 0x8>;
+			reg-names = "cfg", "intr";
+			interrupts = <0x0 0xC6 0x4>;
+		};
-- 
2.2.1.212.gc5b9256
