From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH v2 2/9] arm: dt: zynq: Add 'cpus' node
Date: Tue, 26 Nov 2013 17:04:49 -0800
Message-ID: <1385514296-26702-3-git-send-email-soren.brinkmann@xilinx.com>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a 'cpus' node to describe the CPU cores of Zynq.

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
Acked-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
v2:
 - remove cache size related properties
---
 arch/arm/boot/dts/zynq-7000.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index 605a2d0a39fc..23ba82c205a2 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -15,6 +15,25 @@
 / {
 	compatible = "xlnx,zynq-7000";
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			reg = <0>;
+			clocks = <&clkc 3>;
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			reg = <1>;
+			clocks = <&clkc 3>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupts = <0 5 4>, <0 6 4>;
-- 
1.8.4.4
