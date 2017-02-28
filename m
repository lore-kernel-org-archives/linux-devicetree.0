From: Florian Vaussard <florian.vaussard@gmail.com>
Subject: [PATCH 2/2] ARM: dts: socfpga: Add support for PMU
Date: Tue, 28 Feb 2017 16:52:12 +0100
Message-ID: <1488297132-21553-3-git-send-email-florian.vaussard@heig-vd.ch>
References: <1488297132-21553-1-git-send-email-florian.vaussard@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488297132-21553-1-git-send-email-florian.vaussard@heig-vd.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alberto Dassatti <alberto.dassatti@heig-vd.ch>, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The dual Cortex-A9 MPCore inside socfpga has a standard PMU unit for
each core mapped in the DAP memory space. Add support for it!

Tested with perf on a Cyclone 5 SoC DK.

Reported-by: Alberto Dassatti <alberto.dassatti@heig-vd.ch>
Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
Tested-by: Alberto Dassatti <alberto.dassatti@heig-vd.ch>
---
 arch/arm/boot/dts/socfpga.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 478047e..a892de9 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -52,6 +52,15 @@
 		};
 	};
 
+	pmu: pmu@ff111000 {
+		compatible = "arm,cortex-a9-pmu";
+		interrupt-parent = <&intc>;
+		interrupts = <0 176 4>, <0 177 4>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+		reg = <0xff111000 0x1000>,
+		      <0xff113000 0x1000>;
+	};
+
 	intc: intc@fffed000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
-- 
2.7.4
