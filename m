From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH v4 1/2] dma: Add Xilinx Central DMA DT Binding Documentation
Date: Thu, 21 May 2015 22:39:54 +0530
Message-ID: <1432228194-6760-1-git-send-email-appanad@xilinx.com>
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
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, galak@codeaurora.org, appand@xilinx.com, soren.brinkmann@xilinx.com
Cc: devicetree@vger.kernel.org, Kedareswara rao Appana <appanad@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Srikanth Thokala <sthokal@xilinx.com>
List-Id: devicetree@vger.kernel.org

Device-tree binding documentation of Xilinx Central DMA Engine.

Signed-off-by: Srikanth Thokala <sthokal@xilinx.com>
Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
---
This patch is rebased on the commit
Merge tag 'nfs-for-4.1-2' of git://git.linux-nfs.org/projects/trondmy/linux-nfs

Changes in v4:
- None.
Changes in v3:
- Used proper alignment for all the properties.
Changes in v2:
- Change property 'xlnx,data-width' to 'xlnx,datawidth' in the description
  to match the implementation.

 .../devicetree/bindings/dma/xilinx/xilinx_cdma.txt | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt
new file mode 100644
index 0000000..d1637de
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt
@@ -0,0 +1,54 @@
+Xilinx AXI CDMA engine, it does transfers between memory-mapped source
+address and a memory-mapped destination address.
+
+Required properties:
+- compatible		: Should be "xlnx,axi-cdma-1.00.a"
+- #dma-cells		: Should be <1>, see "dmas" property below
+- reg			: Should contain cdma registers location and length.
+- dma-channel child node: Should have only one channel
+
+Optional properties:
+- xlnx,include-sg	: Tells whether configured for Scatter-mode in
+			  the hardware.
+
+Required child node properties:
+- compatible		: It should be "xlnx,axi-cdma-channel".
+- interrupts		: Should contain per channel CDMA interrupts.
+- xlnx,datawidth	: Should contain the stream data width, take values
+			  {32,64...1024}.
+
+Option child node properties:
+- xlnx,include-dre	: Tells whether hardware is configured for Data
+			  Realignment Engine.
+
+Example:
+++++++++
+
+axi_cdma_0: axicdma@7e200000 {
+       compatible = "xlnx,axi-cdma-1.00.a";
+       #dma_cells = <1>;
+       reg = < 0x7e200000 0x10000 >;
+       dma-channel@7e200000 {
+               compatible = "xlnx,axi-cdma-channel";
+               interrupts = < 0 55 4 >;
+               xlnx,datawidth = <0x40>;
+       } ;
+} ;
+
+
+* DMA client
+
+Required properties:
+- dmas		: a list of <[Central DMA device phandle] [Channel ID]> pairs,
+		  where Channel ID is '0' for write/tx and '1' for read/rx
+                  channel.
+- dma-names	: a list of DMA channel names, one per "dmas" entry
+
+Example:
+++++++++
+
+cdmatest_0: cdmatest@0 {
+       compatible ="xlnx,axi-cdma-test-1.00.a";
+       dmas = <&axi_cdma_0 0>;
+       dma-names = "cdma";
+} ;
-- 
2.1.2
