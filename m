From: Tom Burkart <tom@aussec.com>
Subject: [PATCH v15 2/3] dt-bindings: pps: pps-gpio PPS ECHO implementation
Date: Sat,  2 Feb 2019 21:57:23 +1100
Message-ID: <20190202105724.4743-3-tom@aussec.com>
References: <20190202105724.4743-1-tom@aussec.com>
 <20190202105724.4743-2-tom@aussec.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190202105724.4743-2-tom@aussec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux kernel mailing list <linux-kernel@vger.kernel.org>
Cc: Tom Burkart <tom@aussec.com>, devicetree@vger.kernel.org, Rodolfo Giometti <giometti@enneenne.com>, Ricardo Martins <rasm@fe.up.pt>, James Nuss <jamesnuss@nanometrics.ca>, Lukas Senger <lukas@fridolin.com>
List-Id: devicetree@vger.kernel.org

This patch implements the device tree binding changes required for the
pps echo functionality for pps-gpio, that sysfs claims is available
already.
This patch is provided separated from the rest of the patch per
Documentation/devicetree/bindings/submitting-patches.txt.

This patch was originally written by Lukas Senger as part of a masters
thesis project and modified for inclusion into the linux kernel by Tom
Burkart.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Lukas Senger <lukas@fridolin.com>
Signed-off-by: Tom Burkart <tom@aussec.com>
---
 Documentation/devicetree/bindings/pps/pps-gpio.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.txt b/Documentation/devicetree/bindings/pps/pps-gpio.txt
index 3683874832ae..9012a2a02e14 100644
--- a/Documentation/devicetree/bindings/pps/pps-gpio.txt
+++ b/Documentation/devicetree/bindings/pps/pps-gpio.txt
@@ -7,6 +7,10 @@ Required properties:
 - compatible: should be "pps-gpio"
 - gpios: one PPS GPIO in the format described by ../gpio/gpio.txt
 
+Additional required properties for the PPS ECHO functionality:
+- echo-gpios: one PPS ECHO GPIO in the format described by ../gpio/gpio.txt
+- echo-active-ms: duration in ms of the active portion of the echo pulse
+
 Optional properties:
 - assert-falling-edge: when present, assert is indicated by a falling edge
                        (instead of by a rising edge)
@@ -19,5 +23,8 @@ Example:
 		gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
 		assert-falling-edge;
 
+		echo-gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
+		echo-active-ms = <100>;
+
 		compatible = "pps-gpio";
 	};
-- 
2.12.3
