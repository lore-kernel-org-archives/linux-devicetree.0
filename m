From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 1/4] dt-bindings: regulator: add support for the stm32-booster
Date: Fri, 28 Jun 2019 10:08:06 +0200
Message-ID: <1561709289-11174-2-git-send-email-fabrice.gasnier@st.com>
References: <1561709289-11174-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561709289-11174-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the 3.3V booster regulator embedded in stm32h7 and stm32mp1
devices, that can be used to supply ADC analog input switches.
It's controlled by using system configuration registers (SYSCFG).
Introduce two compatibles as the booster regulator is controlled by:
- a unique register/bit in STM32H7
- a set/clear register pair in STM32MP1

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 .../devicetree/bindings/regulator/st,stm32-booster.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-booster.txt

diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-booster.txt b/Documentation/devicetree/bindings/regulator/st,stm32-booster.txt
new file mode 100644
index 0000000..479ad4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-booster.txt
@@ -0,0 +1,18 @@
+STM32 BOOSTER - Booster for ADC analog input switches
+
+Some STM32 devices embed a 3.3V booster supplied by Vdda, that can be used
+to supply ADC analog input switches.
+
+Required properties:
+- compatible: Should be one of:
+  "st,stm32h7-booster"
+  "st,stm32mp1-booster"
+- st,syscfg: Phandle to system configuration controller.
+- vdda-supply: Phandle to the vdda input analog voltage.
+
+Example:
+	booster: regulator-booster {
+		compatible = "st,stm32mp1-booster";
+		st,syscfg = <&syscfg>;
+		vdda-supply = <&vdda>;
+	};
-- 
2.7.4
