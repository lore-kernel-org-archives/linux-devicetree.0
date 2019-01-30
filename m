From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 1/4] dt-bindings: nvmem: Add STM32 factory-programmed romem
Date: Wed, 30 Jan 2019 17:38:53 +0100
Message-ID: <1548866336-14765-2-git-send-email-fabrice.gasnier@st.com>
References: <1548866336-14765-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548866336-14765-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, lionel.debieve@st.com, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation for STMicroelectronics STM32 Factory-programmed
read only memory area.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 .../devicetree/bindings/nvmem/st,stm32-romem.txt   | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
new file mode 100644
index 0000000..fbff52e
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
@@ -0,0 +1,31 @@
+STMicroelectronics STM32 Factory-programmed data device tree bindings
+
+This represents STM32 Factory-programmed read only non-volatile area: locked
+flash, OTP, read-only HW regs... This contains various information such as:
+analog calibration data for temperature sensor (e.g. TS_CAL1, TS_CAL2),
+internal vref (VREFIN_CAL), unique device ID...
+
+Required properties:
+- compatible:		Should be one of:
+			"st,stm32-romem"
+			"st,stm32mp15-bsec"
+- reg:			Offset and length of factory-programmed area.
+- #address-cells:	Should be '<1>'.
+- #size-cells:		Should be '<1>'.
+
+Optional Data cells:
+- Must be child nodes as described in nvmem.txt.
+
+Example on stm32f4:
+	romem: nvmem@1fff7800 {
+		compatible = "st,stm32-romem";
+		reg = <0x1fff7800 0x400>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		/* Data cells: ts_cal1 at 0x1fff7a2c */
+		ts_cal1: calib@22c {
+			reg = <0x22c 0x2>;
+		};
+		...
+	};
-- 
1.9.1
