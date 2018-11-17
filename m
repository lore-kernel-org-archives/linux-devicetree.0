From: Tom Burkart <tom@aussec.com>
Subject: [PATCH v8 1/4] dt-bindings: pps: capture-clear addition
Date: Sun, 18 Nov 2018 00:03:34 +1100
Message-ID: <20181117130337.5856-2-tom@aussec.com>
References: <20181117130337.5856-1-tom@aussec.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181117130337.5856-1-tom@aussec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux kernel mailing list <linux-kernel@vger.kernel.org>
Cc: Tom Burkart <tom@aussec.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

It adds documentation for the device tree capture-clear option.

Signed-off-by: Tom Burkart <tom@aussec.com>
---
 Documentation/devicetree/bindings/pps/pps-gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.txt b/Documentation/devicetree/bindings/pps/pps-gpio.txt
index 3683874832ae..1155d49c2699 100644
--- a/Documentation/devicetree/bindings/pps/pps-gpio.txt
+++ b/Documentation/devicetree/bindings/pps/pps-gpio.txt
@@ -10,6 +10,7 @@ Required properties:
 Optional properties:
 - assert-falling-edge: when present, assert is indicated by a falling edge
                        (instead of by a rising edge)
+- capture-clear: when present, also capture the PPS clear event
 
 Example:
 	pps {
@@ -18,6 +19,7 @@ Example:
 
 		gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
 		assert-falling-edge;
+		capture-clear;
 
 		compatible = "pps-gpio";
 	};
-- 
2.12.3
