From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH 2/3] regulator: act8865: add device tree binding doc
Date: Thu, 12 Dec 2013 09:18:50 +0800
Message-ID: <1386811131-2720-3-git-send-email-wenyou.yang@atmel.com>
References: <1386811131-2720-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386811131-2720-1-git-send-email-wenyou.yang@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lgirdwood@gmail.com
Cc: devicetree@vger.kernel.org, vpalatin@chromium.org, linux-doc@vger.kernel.org, nicolas.ferre@atmel.com, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, wenyou.yang@atmel.com, broonie@kernel.org, grant.likely@linaro.org, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---
 .../bindings/regulator/act8865-regulator.txt       |   58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/act8865-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
new file mode 100644
index 0000000..e191a92
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
@@ -0,0 +1,58 @@
+ACT8865 regulator
+-------------------
+
+Required properties:
+- compatible: "active-semi,act8865"
+- reg: I2C slave address
+- vsel-state-low: Initial state of vsel0 input is low, to select default output voltage.
+
+Example:
+--------
+
+	i2c1: i2c@f0018000 {
+		status = "okay";
+
+		pmic: act8865@5b {
+			compatible = "active-semi,act8865";
+			reg = <0x5b>;
+			vsel-state-low;
+
+			regulators {
+				vcc_1v8_reg: DCDC_REG1 {
+					regulator-name = "DCDC_REG1";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					regulator-always-on;
+				};
+
+				vcc_1v2_reg: DCDC_REG2 {
+					regulator-name = "DCDC_REG2";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1300000>;
+					regulator-suspend-mem-microvolt = <1150000>;
+					regulator-suspend-standby-microvolt = <1150000>;
+					regulator-always-on;
+				};
+
+				vcc_3v3_reg: DCDC_REG3 {
+					regulator-name = "DCDC_REG3";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+
+				vddfuse_reg: LDO_REG4 {
+					regulator-name = "LDO_REG4";
+					regulator-min-microvolt = <2500000>;
+					regulator-max-microvolt = <2500000>;
+				};
+
+				vddana_reg: LDO_REG5 {
+					regulator-name = "LDO_REG5";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+					regulator-always-on;
+				};
+			};
+		};
+	};
-- 
1.7.9.5
