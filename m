From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v2 1/2] dt-bindings: firmware: Add bindings for Versal firmware
Date: Mon,  7 Oct 2019 11:52:22 -0700
Message-ID: <1570474343-21524-2-git-send-email-jolly.shah@xilinx.com>
References: <1570474343-21524-1-git-send-email-jolly.shah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1570474343-21524-1-git-send-email-jolly.shah@xilinx.com>
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
Cc: Jolly Shah <jolly.shah@xilinx.com>, devicetree@vger.kernel.org, rajanv@xilinx.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

ZynqMP firmware driver can be used for versal also.
Add versal compatible string to zynqmp firmware driver
doc.

Signed-off-by: Jolly Shah <jolly.shah@xilinx.com>
---
 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt    | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
index a4fe136..18c3aea 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt
@@ -11,7 +11,9 @@ power management service, FPGA service and other platform management
 services.
 
 Required properties:
- - compatible:	Must contain:	"xlnx,zynqmp-firmware"
+ - compatible:	Must contain any of below:
+		"xlnx,zynqmp-firmware" for Zynq Ultrascale+ MPSoC
+		"xlnx,versal-firmware" for Versal
  - method:	The method of calling the PM-API firmware layer.
 		Permitted values are:
 		  - "smc" : SMC #0, following the SMCCC
@@ -21,6 +23,8 @@ Required properties:
 Example
 -------
 
+Zynq Ultrascale+ MPSoC
+----------------------
 firmware {
 	zynqmp_firmware: zynqmp-firmware {
 		compatible = "xlnx,zynqmp-firmware";
@@ -28,3 +32,13 @@ firmware {
 		...
 	};
 };
+
+Versal
+------
+firmware {
+	versal_firmware: versal-firmware {
+		compatible = "xlnx,versal-firmware";
+		method = "smc";
+		...
+	};
+};
-- 
2.7.4
