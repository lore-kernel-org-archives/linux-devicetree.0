From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 2/5] dt-bindings: mfd: da9062: add regulator voltage selection documentation
Date: Tue, 17 Sep 2019 14:42:43 +0200
Message-ID: <20190917124246.11732-3-m.felsch@pengutronix.de>
References: <20190917124246.11732-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917124246.11732-1-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: support.opensource@diasemi.com, lee.jones@linaro.org, robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, stwiss.opensource@diasemi.com
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the documentation which describe the voltage selection gpio support.
This property can be applied to each subnode within the 'regulators'
node so each regulator can be configured differently.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/mfd/da9062.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index edca653a5777..9d9820d8177d 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -66,6 +66,15 @@ Sub-nodes:
   details of individual regulator device can be found in:
   Documentation/devicetree/bindings/regulator/regulator.txt
 
+  Optional regulator device-specific properties:
+  - dlg,vsel-sense-gpios : The GPIO reference which should be used by the
+    regulator to switch the voltage between active/suspend voltage settings. If
+    the signal is active the active-settings are applied else the suspend
+    settings are applied. Attention: Sharing the same gpio for other purposes
+    or across multiple regulators is possible but the gpio settings must be the
+    same. Also the gpio phandle must refer to to the dlg,da9062-gpio device
+    other gpios are not allowed and make no sense.
+
 - rtc : This node defines settings required for the Real-Time Clock associated
   with the DA9062. There are currently no entries in this binding, however
   compatible = "dlg,da9062-rtc" should be added if a node is created.
-- 
2.20.1
