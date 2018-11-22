From: Tom Burkart <tom@aussec.com>
Subject: [PATCH v9 3/4] dt-bindings: pps: pps-gpio PPS ECHO implementation
Date: Thu, 22 Nov 2018 20:46:01 +1100
Message-ID: <20181122094602.5156-4-tom@aussec.com>
References: <20181122094602.5156-1-tom@aussec.com>
 <20181122094602.5156-2-tom@aussec.com>
 <20181122094602.5156-3-tom@aussec.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122094602.5156-3-tom@aussec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux kernel mailing list <linux-kernel@vger.kernel.org>
Cc: Tom Burkart <tom@aussec.com>, devicetree@vger.kernel.org, Lukas Senger <lukas@fridolin.com>
List-Id: devicetree@vger.kernel.org

This patch implements the device tree changes required for the pps
echo functionality for pps-gpio, that sysfs claims is available
already.

This patch was originally written by Lukas Senger as part of a masters
thesis project and modified for inclusion into the linux kernel by Tom
Burkart.

Signed-off-by: Lukas Senger <lukas@fridolin.com>
Signed-off-by: Tom Burkart <tom@aussec.com>
---
 Documentation/devicetree/bindings/pps/pps-gpio.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.txt b/Documentation/devicetree/bindings/pps/pps-gpio.txt
index 1155d49c2699..e09f6f2405c5 100644
--- a/Documentation/devicetree/bindings/pps/pps-gpio.txt
+++ b/Documentation/devicetree/bindings/pps/pps-gpio.txt
@@ -7,10 +7,15 @@ Required properties:
 - compatible: should be "pps-gpio"
 - gpios: one PPS GPIO in the format described by ../gpio/gpio.txt
 
+Additional required properties for the PPS ECHO functionality:
+- echo-gpios: one PPS ECHO GPIO in the format described by ../gpio/gpio.txt
+- echo-active-ms: duration in ms of the active portion of the echo pulse
+
 Optional properties:
 - assert-falling-edge: when present, assert is indicated by a falling edge
                        (instead of by a rising edge)
 - capture-clear: when present, also capture the PPS clear event
+- invert-pps-echo: when present, invert the PPS ECHO pulse
 
 Example:
 	pps {
@@ -21,5 +26,9 @@ Example:
 		assert-falling-edge;
 		capture-clear;
 
+		echo-gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
+		echo-active-ms = <100>;
+		invert-pps-echo;
+
 		compatible = "pps-gpio";
 	};
-- 
2.12.3
