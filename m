From: Tom Burkart <tom@aussec.com>
Subject: [PATCH v7 1/4] dt-bindings: pps: descriptor-based gpio, capture-clear addition
Date: Wed, 14 Nov 2018 23:54:29 +1100
Message-ID: <20181114125432.16044-2-tom@aussec.com>
References: <20181114125432.16044-1-tom@aussec.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181114125432.16044-1-tom@aussec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux kernel mailing list <linux-kernel@vger.kernel.org>
Cc: Tom Burkart <tom@aussec.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch changes the devicetree bindings for the pps-gpio driver
from the integer based ABI to the descriptor based ABI.  It also adds
documentation for the device tree capture-clear option.  The legacy
device tree entry for the GPIO pin is supported.

Signed-off-by: Tom Burkart <tom@aussec.com>
---
 Documentation/devicetree/bindings/pps/pps-gpio.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.txt b/Documentation/devicetree/bindings/pps/pps-gpio.txt
index 3683874832ae..6c9fc0998d94 100644
--- a/Documentation/devicetree/bindings/pps/pps-gpio.txt
+++ b/Documentation/devicetree/bindings/pps/pps-gpio.txt
@@ -5,19 +5,23 @@ a GPIO pin.
 
 Required properties:
 - compatible: should be "pps-gpio"
-- gpios: one PPS GPIO in the format described by ../gpio/gpio.txt
+- pps-gpios: one PPS GPIO in the format described by ../gpio/gpio.txt
+Alternatively (DEPRECATED), instead of pps-gpios above, it may have:
+- gpios: one PPS GPIO as above
 
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
