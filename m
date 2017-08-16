From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCHv2 1/3] dt: xilinx: zynqmp: Add bindings for PM firmware
Date: Wed, 16 Aug 2017 14:24:56 +0200
Message-ID: <2935be9896d54020720919e7dab7c2f86bdc83a3.1502886277.git.michal.simek@xilinx.com>
References: <cover.1502886277.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1502886277.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1502886277.git.michal.simek@xilinx.com>
References: <cover.1502886277.git.michal.simek@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Cc: edgar.iglesias@xilinx.com, Rob Herring <robh@kernel.org>, monstr@monstr.eu, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: Soren Brinkmann <soren.brinkmann@xilinx.com>

Document the DT bindings for the Zynq UltraScale+ PM Firmware.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Changes in v2:
- Move to bindings/firmware and also add it to firmware node
  Reported-by Rob

 .../bindings/firmware/xlnx,zynqmp-pm.txt           | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/xlnx,zynqmp-pm.txt

diff --git a/Documentation/devicetree/bindings/firmware/xlnx,zynqmp-pm.txt b/Documentation/devicetree/bindings/firmware/xlnx,zynqmp-pm.txt
new file mode 100644
index 000000000000..7de0c82758b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/xlnx,zynqmp-pm.txt
@@ -0,0 +1,22 @@
+Xilinx Zynq MPSoC Firmware Device Tree Bindings
+
+The zynqmp-pm node describes the interface to platform firmware.
+
+Required properties:
+ - compatible:	Must contain:  "xlnx,zynqmp-pm"
+ - method:	The method of calling the PM-API firmware layer.
+		Permitted values are:
+		 - "smc" : To be used in configurations without a hypervisor
+		 - "hvc" : To be used when hypervisor is present
+ - interrupts:	Interrupt specifier
+
+Examples:
+
+	firmware {
+		zynqmp-firmware {
+			compatible = "xlnx,zynqmp-pm";
+			method = "smc";
+			interrupt-parent = <&gic>;
+			interrupts = <0 35 4>;
+		};
+	};
-- 
1.9.1
