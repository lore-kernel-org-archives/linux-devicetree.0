From: Tom Burkart <tom@aussec.com>
Subject: [PATCH 3/4] dt-bindings: pps: pps-gpio PPS ECHO implementation
Date: Wed, 14 Nov 2018 23:54:31 +1100
Message-ID: <20181114125432.16044-4-tom@aussec.com>
References: <20181114125432.16044-1-tom@aussec.com>
 <20181114125432.16044-2-tom@aussec.com>
 <20181114125432.16044-3-tom@aussec.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181114125432.16044-3-tom@aussec.com>
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
index 6c9fc0998d94..f85dbe4ce0b3 100644
--- a/Documentation/devicetree/bindings/pps/pps-gpio.txt
+++ b/Documentation/devicetree/bindings/pps/pps-gpio.txt
@@ -9,10 +9,15 @@ Required properties:
 Alternatively (DEPRECATED), instead of pps-gpios above, it may have:
 - gpios: one PPS GPIO as above
 
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
@@ -23,5 +28,9 @@ Example:
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
