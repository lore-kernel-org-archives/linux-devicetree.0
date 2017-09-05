From: Maciej Purski <m.purski@samsung.com>
Subject: [RESEND PATCH v4] mfd: max77693: Add muic of_compatible in mfd_cell
Date: Tue, 05 Sep 2017 15:50:27 +0200
Message-ID: <1504619427-17805-1-git-send-email-m.purski@samsung.com>
References: <CGME20170905135037eucas1p16e4017fa044f17cbe2fc61c33dae4cb1@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: cw00.choi@samsung.com, krzk@kernel.org, lee.jones@linaro.org, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch adds muic of_compatible in order to use the muic device
driver in device tree.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

---
v2:
- added muic to documentation
v3:
- removed duplication
v4:
- fixed commit message

 Documentation/devicetree/bindings/mfd/max77693.txt | 6 ++++++
 drivers/mfd/max77693.c                             | 5 ++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/max77693.txt b/Documentation/devicetree/bindings/mfd/max77693.txt
index 6a1ae3a..e675497 100644
--- a/Documentation/devicetree/bindings/mfd/max77693.txt
+++ b/Documentation/devicetree/bindings/mfd/max77693.txt
@@ -127,6 +127,12 @@ Required properties for the LED child node:
 Optional properties for the LED child node:
 - label : see Documentation/devicetree/bindings/leds/common.txt
 
+Optional nodes:
+- max77693-muic :
+	Node used only by extcon consumers.
+	Required properties:
+		- compatible : "maxim,max77693-muic"
+
 Example:
 #include <dt-bindings/leds/common.h>
 
diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 662ae0d..1c05ea0 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -48,7 +48,10 @@ static const struct mfd_cell max77693_devs[] = {
 		.name = "max77693-charger",
 		.of_compatible = "maxim,max77693-charger",
 	},
-	{ .name = "max77693-muic", },
+	{
+		.name = "max77693-muic",
+		.of_compatible = "maxim,max77693-muic",
+	},
 	{
 		.name = "max77693-haptic",
 		.of_compatible = "maxim,max77693-haptic",
-- 
2.7.4
