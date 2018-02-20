From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v5 1/4] dt-bindings: firmware: Add bindings for ZynqMP firmware
Date: Tue, 20 Feb 2018 11:21:04 -0800
Message-ID: <1519154467-2896-2-git-send-email-jollys@xilinx.com>
References: <1519154467-2896-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519154467-2896-1-git-send-email-jollys@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, rajanv@xilinx.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add documentation to describe Xilinx ZynqMP firmware driver
bindings. Firmware driver provides an interface to firmware
APIs. Interface APIs can be used by any driver to communicate
to PMUFW (Platform Management Unit).

Signed-off-by: Jolly Shah <jollys@xilinx.com>
Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
---
 .../firmware/xilinx/xlnx,zynqmp-firmware.txt       | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
new file mode 100644
index 0000000..99434ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
@@ -0,0 +1,24 @@
+Xilinx Zynq MPSoC Firmware Device Tree Bindings
+
+The zynqmp-firmware node describes the interface to platform firmware.
+ZynqMP has an interface to communicate with secure firmware. Firmware
+driver provides an interface to firmware APIs. Interface APIs can be
+used by any driver to communicate to PMUFW(Platform Management Unit).
+These requests include clock management, pin control, device control,
+power management service, FPGA service and other platform management
+services.
+
+Required properties:
+ - compatible:	Must contain:  "xlnx,zynqmp-firmware"
+ - method:	The method of calling the PM-API firmware layer.
+		Permitted values are:
+		  - "smc" : SMC #0, following the SMCCC
+		  - "hvc" : HVC #0, following the SMCCC
+
+Examples:
+	firmware {
+		zynqmp_firmware: zynqmp-firmware {
+			compatible = "xlnx,zynqmp-firmware";
+			method = "smc";
+		};
+	};
-- 
2.7.4
