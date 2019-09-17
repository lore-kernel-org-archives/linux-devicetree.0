From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 4/5] dt-bindings: mfd: da9062: add regulator gpio enable/disable documentation
Date: Tue, 17 Sep 2019 14:42:45 +0200
Message-ID: <20190917124246.11732-5-m.felsch@pengutronix.de>
References: <20190917124246.11732-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917124246.11732-1-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: support.opensource@diasemi.com, lee.jones@linaro.org, robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, stwiss.opensource@diasemi.com
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

At the gpio-based regulator enable/disable documentation. This property
can be applied to each subnode within the 'regulators' node so each
regulator can be configured differently.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 Documentation/devicetree/bindings/mfd/da9062.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/da9062.txt b/Documentation/devicetree/bindings/mfd/da9062.txt
index 9d9820d8177d..3d4b90bf8ea6 100644
--- a/Documentation/devicetree/bindings/mfd/da9062.txt
+++ b/Documentation/devicetree/bindings/mfd/da9062.txt
@@ -75,6 +75,13 @@ Sub-nodes:
     same. Also the gpio phandle must refer to to the dlg,da9062-gpio device
     other gpios are not allowed and make no sense.
 
+  - dlg,ena-sense-gpios : The GPIO reference which should be used by the
+    regulator to enable/disable the output. If the signal is active the
+    regulator is on else it is off. Attention: Sharing the same gpio for other
+    purposes or across multiple regulators is possible but the gpio settings
+    must be the same. Also the gpio phandle must refer to to the
+    dlg,da9062-gpio device other gpios are not allowed and make no sense.
+
 - rtc : This node defines settings required for the Real-Time Clock associated
   with the DA9062. There are currently no entries in this binding, however
   compatible = "dlg,da9062-rtc" should be added if a node is created.
-- 
2.20.1
