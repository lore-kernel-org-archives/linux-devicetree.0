From: Tom Burkart <tom@aussec.com>
Subject: [PATCH v6 1/4] dt-bindings: pps: descriptor-based gpio, capture-clear addition
Date: Tue, 13 Nov 2018 14:40:04 +1100
Message-ID: <20181113034007.3878-2-tom@aussec.com>
References: <20181113034007.3878-1-tom@aussec.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113034007.3878-1-tom@aussec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux kernel mailing list <linux-kernel@vger.kernel.org>
Cc: Tom Burkart <tom@aussec.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch changes the devicetree bindings for the pps-gpio driver
from the integer based API to the descriptor based API.  It also adds
documentation for the device tree capture-clear option.

The change from integer based GPIO API to the descriptor based API
breaks backward compatibility for the devicetree.  This is due to
the descriptor based API appending "-gpio" or "-gpios" (see
Documentation/gpio/base.txt.)

Signed-off-by: Tom Burkart <tom@aussec.com>
---
 Documentation/devicetree/bindings/pps/pps-gpio.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.txt b/Documentation/devicetree/bindings/pps/pps-gpio.txt
index 3683874832ae..f7789e48a022 100644
--- a/Documentation/devicetree/bindings/pps/pps-gpio.txt
+++ b/Documentation/devicetree/bindings/pps/pps-gpio.txt
@@ -5,19 +5,21 @@ a GPIO pin.
 
 Required properties:
 - compatible: should be "pps-gpio"
-- gpios: one PPS GPIO in the format described by ../gpio/gpio.txt
+- pps-gpios: one PPS GPIO in the format described by ../gpio/gpio.txt
 
 Optional properties:
 - assert-falling-edge: when present, assert is indicated by a falling edge
                        (instead of by a rising edge)
+- capture-clear: when present, also capture the PPS clear event
 
 Example:
 	pps {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pps>;
 
-		gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
+		pps-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
 		assert-falling-edge;
+		capture-clear;
 
 		compatible = "pps-gpio";
 	};
-- 
2.12.3
