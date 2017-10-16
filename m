From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Subject: [PATCH 1/2] Documentation: dt: extcon: add optional debounce-timeout-ms attribute
Date: Mon, 16 Oct 2017 13:04:47 +0530
Message-ID: <1508139288-11114-1-git-send-email-raveendra.padasalagi@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add documentation on optional dt attribute "debounce-timeout-ms"
in extcon node to capture user specified timeout value for id
and vbus gpio detection.

Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Srinath Mannam <srinath.mannam@broadcom.com>
---
 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
index dfc14f7..6df6d69 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
@@ -10,6 +10,10 @@ Either one of id-gpio or vbus-gpio must be present. Both can be present as well.
 - id-gpio: gpio for USB ID pin. See gpio binding.
 - vbus-gpio: gpio for USB VBUS pin.
 
+Optional properties:
+- debounce-timeout-ms: debounce timeout value for id and vbus gpio in
+  milliseconds.
+
 Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
 	extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
-- 
1.9.1
