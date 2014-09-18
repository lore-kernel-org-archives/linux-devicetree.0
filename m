From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v2 2/2] dt-bindings: add devicetree bindings for st-pwm regulator
Date: Thu, 18 Sep 2014 15:31:45 +0800
Message-ID: <1411025505-21628-3-git-send-email-zyw@rock-chips.com>
References: <1411025505-21628-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411025505-21628-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dianders@chromium.org, heiko@sntech.de
Cc: huangtao@rock-chips.com, cf@rock-chips.com, zhangqing@rock-chips.com, lee.jones@linaro.org, broonie@kernel.org, Chris Zhong <zyw@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the st-pwm regulator

Signed-off-by: Chris Zhong <zyw@rock-chips.com>

---

Changes in v2:
Adviced by Lee Jones
- rename the documentation
Adviced by Doug Anderson
- update the example
Adviced by Mark Rutland
- remove pwm-reg-period

 .../bindings/regulator/pwm-regulator.txt           |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/pwm-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
new file mode 100644
index 0000000..7c62a30
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -0,0 +1,29 @@
+pwm regulator bindings
+
+Required properties:
+  - compatible: Should be "pwm-regulator"
+  - pwms: OF device-tree PWM specification (see PWM binding pwm.txt)
+  - voltage-table: voltage and duty table, include 2 merbers in each set of
+    brackets, first one is voltage(unit: uv), the next is duty(unit: percent)
+
+Any property defined as part of the core regulator binding defined in
+regulator.txt can also be used.
+
+Example:
+	pwm_regulator {
+		compatible = "pwm-regulator;
+		pwms = <&pwm1 0 1000000 0>;
+
+		voltage-table = <1114000 0>,
+				<1095000 10>,
+				<1076000 20>,
+				<1056000 30>,
+				<1036000 40>,
+				<1016000 50>;
+
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1016000>;
+		regulator-max-microvolt = <1114000>;
+		regulator-name = "vdd_logic";
+	};
-- 
1.7.9.5
