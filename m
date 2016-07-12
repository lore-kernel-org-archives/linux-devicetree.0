From: Alan Tull <atull@opensource.altera.com>
Subject: [PATCH 1/2] ARM: socfpga: add bindings doc for arria10 fpga manager
Date: Tue, 12 Jul 2016 14:07:08 -0500
Message-ID: <20160712190709.5964-2-atull@opensource.altera.com>
References: <20160712190709.5964-1-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160712190709.5964-1-atull@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Alan Tull <atull@opensource.altera.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>, delicious.quinoa@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a device tree bindings document for the SoCFPGA Arria10
FPGA Manager driver.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 .../bindings/fpga/altera-socfpga-a10-fpga-mgr.txt     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-socfpga-a10-fpga-mgr.txt

diff --git a/Documentation/devicetree/bindings/fpga/altera-socfpga-a10-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/altera-socfpga-a10-fpga-mgr.txt
new file mode 100644
index 0000000..2fd8e7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altera-socfpga-a10-fpga-mgr.txt
@@ -0,0 +1,19 @@
+Altera SOCFPGA Arria10 FPGA Manager
+
+Required properties:
+- compatible : should contain "altr,socfpga-a10-fpga-mgr"
+- reg        : base address and size for memory mapped io.
+               - The first index is for FPGA manager register access.
+               - The second index is for writing FPGA configuration data.
+- resets     : Phandle and reset specifier for the device's reset.
+- clocks     : Clocks used by the device.
+
+Example:
+
+	fpga_mgr: fpga-mgr@ffd03000 {
+		compatible = "altr,socfpga-a10-fpga-mgr";
+		reg = <0xffd03000 0x100
+		       0xffcfe400 0x20>;
+		clocks = <&l4_mp_clk>;
+		resets = <&rst FPGAMGR_RESET>;
+	};
-- 
2.9.1
