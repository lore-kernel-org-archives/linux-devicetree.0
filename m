From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 1/1] ARM: at91/dt: sama5d2: enable FIFOs for high-speed i2c
 controllers
Date: Wed, 5 Oct 2016 18:53:07 +0200
Message-ID: <69f559c9dd08696d280a2cea0f666ef18253e459.1475685906.git.cyrille.pitchen@atmel.com>
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
To: nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch enables the RX and TX FIFOs (16 data each) of the two
high-speed i2c controllers (i2c0 and i2c1).

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 arch/arm/boot/dts/sama5d2.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 35bf72d57f7c..20e5bc182c2d 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -1052,6 +1052,7 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				clocks = <&twi0_clk>;
+				atmel,fifo-size = <16>;
 				status = "disabled";
 			};
 
@@ -1253,6 +1254,7 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				clocks = <&twi1_clk>;
+				atmel,fifo-size = <16>;
 				status = "disabled";
 			};
 
-- 
2.7.4
