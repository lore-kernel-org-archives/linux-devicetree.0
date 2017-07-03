From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 2/5] ARM: dts: at91: sama5d2: add isc node
Date: Mon, 3 Jul 2017 15:56:09 +0300
Message-ID: <1499086572-6083-3-git-send-email-claudiu.beznea@microchip.com>
References: <1499086572-6083-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1499086572-6083-1-git-send-email-claudiu.beznea@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, sza@esh.hu
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Songjun Wu <songjun.wu@microchip.com>, linux-arm-kernel@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>, cristian.birsan@microchip.com
List-Id: devicetree@vger.kernel.org

From: Songjun Wu <songjun.wu@microchip.com>

Add isc node, it conflicts with pdmic and uart3.

Signed-off-by: Songjun Wu <songjun.wu@microchip.com>
[claudiu.beznea@microchip.com: place isc node after hlcdc node]
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/sama5d2.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 71e9d83..9d13b55 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -416,6 +416,17 @@
 				};
 			};
 
+			isc: isc@f0008000 {
+				compatible = "atmel,sama5d2-isc";
+				reg = <0xf0008000 0x4000>;
+				interrupts = <46 IRQ_TYPE_LEVEL_HIGH 5>;
+				clocks = <&isc_clk>, <&iscck>, <&isc_gclk>;
+				clock-names = "hclock", "iscck", "gck";
+				#clock-cells = <0>;
+				clock-output-names = "isc-mck";
+				status = "disabled";
+			};
+
 			ramc0: ramc@f000c000 {
 				compatible = "atmel,sama5d3-ddramc";
 				reg = <0xf000c000 0x200>;
@@ -925,6 +936,11 @@
 						atmel,clk-output-range = <0 83000000>;
 					};
 
+					isc_gclk: isc_gclk {
+						#clock-cells = <0>;
+						reg = <46>;
+					};
+
 					pdmic_gclk: pdmic_gclk {
 						#clock-cells = <0>;
 						reg = <48>;
-- 
2.7.4
