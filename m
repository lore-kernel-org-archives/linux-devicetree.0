From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 1/2] regulator: gpio-regulator: Add required regulator-type property
Date: Thu, 28 Nov 2013 16:44:52 +0100
Message-ID: <1385653493-9952-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1385653493-9952-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1385653493-9952-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The gpio-regulator driver requires the regulator-type property to be
present. Document it as required in the DT bindings.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 Documentation/devicetree/bindings/regulator/gpio-regulator.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
index 63c6598..a560711 100644
--- a/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/gpio-regulator.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible		: Must be "regulator-gpio".
 - states		: Selection of available voltages and GPIO configs.
                           if there are no states, then use a fixed regulator
+- regulator-type	: Must be either "voltage" or "current".
 
 Optional properties:
 - enable-gpio		: GPIO to use to enable/disable the regulator.
@@ -22,6 +23,7 @@ Example:
 		regulator-name = "mmci-gpio-supply";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <2600000>;
+		regulator-type = "voltage";
 		regulator-boot-on;
 
 		enable-gpio = <&gpio0 23 0x4>;
-- 
1.8.3.2

