From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V9 5/6] gpio: add DT binding doc for gpio of PMIC max77620/max20024
Date: Fri, 11 Mar 2016 20:13:57 +0530
Message-ID: <1457707438-9842-6-git-send-email-ldewangan@nvidia.com>
References: <1457707438-9842-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457707438-9842-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com
Cc: broonie@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com, rklein@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Maxim Semiconductor's PMIC MAX77620/MAX20024 has 8 GPIO pins
which act as GPIO as well as special function mode.

Add DT binding document to support these pins in GPIO
mode via GPIO framework.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>

---
Changes from V4:
- Separate out from gpio driver

Changes from V5/V6/V7:
- None

Changes from V8:
- Collected Linus ack.

 .../devicetree/bindings/gpio/gpio-max77620.txt     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-max77620.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-max77620.txt b/Documentation/devicetree/bindings/gpio/gpio-max77620.txt
new file mode 100644
index 0000000..410e716
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-max77620.txt
@@ -0,0 +1,25 @@
+GPIO driver for MAX77620 Power management IC from Maxim Semiconductor.
+
+Device has 8 GPIO pins which can be configured as GPIO as well as the
+special IO functions.
+
+Required properties:
+-------------------
+- gpio-controller : 	Marks the device node as a gpio controller.
+- #gpio-cells : 	Should be two.  The first cell is the pin number and
+			the second cell is used to specify the gpio polarity:
+				0 = active high
+				1 = active low
+For more details, please refer generic GPIO DT binding document
+<devicetree/bindings/gpio/gpio.txt>.
+
+Example:
+--------
+#include <dt-bindings/mfd/max77620.h>
+...
+max77620@3c {
+	compatible = "maxim,max77620";
+
+	gpio-controller;
+	#gpio-cells = <2>;
+};
-- 
2.1.4
