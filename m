From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 4/9] ARM: STi: DT: STiH407: Add Device Tree node for the LPC
Date: Thu, 22 Jan 2015 11:56:02 +0000
Message-ID: <1421927767-28889-5-git-send-email-lee.jones@linaro.org>
References: <1421927767-28889-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1421927767-28889-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, rtc-linux@googlegroups.com, david.paris@st.com, wim@iguana.be, lee.jones@linaro.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On current ST platforms the LPC controls a number of functions.  This
patch enables support for the LPC Watchdog and LPC RTC devices on LPC1
and LPC2 respectively.

Signed-off-by: David Paris <david.paris@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 3e31d32..04448a7 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -7,6 +7,7 @@
  * publishhed by the Free Software Foundation.
  */
 #include "stih407-pinctrl.dtsi"
+#include <dt-bindings/mfd/st-lpc.h>
 #include <dt-bindings/reset-controller/stih407-resets.h>
 / {
 	#address-cells = <1>;
@@ -274,5 +275,24 @@
 
 			status = "disabled";
 		};
+
+		/* Watchdog and Real-Time Clock */
+		lpc@8787000 {
+			compatible = "st,stih407-lpc";
+			reg = <0x8787000 0x1000>;
+			interrupts = <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clk_s_d3_flexgen CLK_LPC_0>;
+			timeout-sec = <120>;
+			st,syscfg = <&syscfg_core>;
+			st,lpc-mode = <ST_LPC_MODE_WDT>;
+		};
+
+		lpc@8788000 {
+			compatible = "st,stih407-lpc";
+			reg = <0x8788000 0x1000>;
+			interrupts = <GIC_SPI 130 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clk_s_d3_flexgen CLK_LPC_1>;
+			st,lpc-mode = <ST_LPC_MODE_RTC>;
+		};
 	};
 };
-- 
1.9.1
