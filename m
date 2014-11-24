From: Alban Bedel <alban.bedel@avionic-design.de>
Subject: [PATCH 1/2] devicetree: add a binding for GPIOs going though a level shifter
Date: Mon, 24 Nov 2014 15:01:35 +0100
Message-ID: <1416837696-28066-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alban Bedel <alban.bedel@avionic-design.de>, Grant Likely <grant.likely@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alban Bedel <alban.bedel@avionic-design.de>
---
 .../devicetree/bindings/gpio/gpio-level-shifter.txt       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-level-shifter.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-level-shifter.txt b/Documentation/devicetree/bindings/gpio/gpio-level-shifter.txt
new file mode 100644
index 0000000..e108c43
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-level-shifter.txt
@@ -0,0 +1,15 @@
+GPIO level shifter
+
+This binding allow supporting GPIOs going though a level shifter.
+
+Required properties:
+- compatible : should be "gpio-level-shifter"
+- data-gpios : list of the data GPIO phandles
+- #gpio-cells : should be 2
+- gpio-controller : marks the device node as a GPIO controller
+
+Optional properties:
+- enable-gpio : phandle of the GPIO that control the level shifter enable pin
+- direction-gpio : phandle of the GPIO that control the level shifter direction
+- vcca-supply : phandle of the regulator for side A of the level shifter
+- vccb-supply : phandle of the regulator for side B of the level shifter
-- 
2.1.3

