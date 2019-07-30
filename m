From: Anson.Huang@nxp.com
Subject: [PATCH V3 5/5] dt-bindings: thermal: qoriq: Add optional clocks property
Date: Tue, 30 Jul 2019 10:21:26 +0800
Message-ID: <20190730022126.17883-5-Anson.Huang@nxp.com>
References: <20190730022126.17883-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730022126.17883-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Some platforms like i.MX8M series SoCs have clock control for TMU,
add optional clocks property to the binding doc.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
No changes, noted the i.MX8M series SoCs need this clock in commit log.
---
 Documentation/devicetree/bindings/thermal/qoriq-thermal.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt b/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
index 04cbb90..28f2cba 100644
--- a/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.txt
@@ -23,6 +23,7 @@ Required properties:
 Optional property:
 - little-endian : If present, the TMU registers are little endian. If absent,
 	the default is big endian.
+- clocks : the clock for clocking the TMU silicon.
 
 Example:
 
-- 
2.7.4
