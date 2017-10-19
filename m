From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Subject: [PATCH v3 1/2] Documentation: dt: extcon: add optional input-debounce attribute
Date: Thu, 19 Oct 2017 15:22:52 +0530
Message-ID: <1508406773-887-1-git-send-email-raveendra.padasalagi@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add documentation on optional dt attribute "input-debounce"
in extcon node to capture user specified timeout value for id
and vbus gpio detection.

Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Srinath Mannam <srinath.mannam@broadcom.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
---

Changes in v3:
 - Modified commit log to name debounce-timeout-ms to input-debounce
 - Added Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Changes in v2:
 Rename debounce-timeout-ms to input-debounce

 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
index dfc14f7..d115900 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
@@ -10,6 +10,9 @@ Either one of id-gpio or vbus-gpio must be present. Both can be present as well.
 - id-gpio: gpio for USB ID pin. See gpio binding.
 - vbus-gpio: gpio for USB VBUS pin.
 
+Optional properties:
+- input-debounce: debounce timeout value for id and vbus gpio in microseconds.
+
 Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
 	extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
-- 
1.9.1
