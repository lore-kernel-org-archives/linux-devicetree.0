From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH v2 2/2] regulator: act8865: add DT binding for property "active-semi,vsel-high"
Date: Wed, 30 Sep 2015 15:25:50 +0800
Message-ID: <1443597950-27849-3-git-send-email-wenyou.yang@atmel.com>
References: <1443597950-27849-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443597950-27849-1-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

Add a DT property "active-semi,vsel-high" to indicate the VSEL pin
is high. If this property is missing, then assume the VSEL pin is
low(0).

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---

Changes in v2: None

 .../bindings/regulator/act8865-regulator.txt       |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
index e91485d..6067d98 100644
--- a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
@@ -8,6 +8,8 @@ Required properties:
 Optional properties:
 - system-power-controller: Telling whether or not this pmic is controlling
   the system power. See Documentation/devicetree/bindings/power/power-controller.txt .
+- active-semi,vsel-high: Indicates the VSEL pin is high.
+  If this property is missing, assume the VSEL pin is low(0).
 
 Optional input supply properties:
 - for act8600:
@@ -49,6 +51,7 @@ Example:
 			pmic: act8865@5b {
 				compatible = "active-semi,act8865";
 				reg = <0x5b>;
+				active-semi,vsel-high;
 				status = "disabled";
 
 				regulators {
-- 
1.7.9.5
