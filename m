From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH] dt-bindings: mfd: rn5t618: Document optional property system-power-controller
Date: Tue, 29 Jan 2019 14:59:17 +0100
Message-ID: <20190129135917.29521-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The RN5T618 family of PMICs can be used as system management
controllers, in which case they handle poweroff and restart. Document
this capability by referring to the corresponding generic DT binding.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 Documentation/devicetree/bindings/mfd/rn5t618.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rn5t618.txt b/Documentation/devicetree/bindings/mfd/rn5t618.txt
index 65c23263cc54..b74e5e94d1cb 100644
--- a/Documentation/devicetree/bindings/mfd/rn5t618.txt
+++ b/Documentation/devicetree/bindings/mfd/rn5t618.txt
@@ -14,6 +14,10 @@ Required properties:
 		"ricoh,rc5t619"
  - reg: the I2C slave address of the device
 
+Optional properties:
+ - system-power-controller:
+   See Documentation/devicetree/bindings/power/power-controller.txt
+
 Sub-nodes:
  - regulators: the node is required if the regulator functionality is
    needed. The valid regulator names are: DCDC1, DCDC2, DCDC3, DCDC4
@@ -28,6 +32,7 @@ Example:
 	pmic@32 {
 		compatible = "ricoh,rn5t618";
 		reg = <0x32>;
+		system-power-controller;
 
 		regulators {
 			DCDC1 {
-- 
2.20.1
