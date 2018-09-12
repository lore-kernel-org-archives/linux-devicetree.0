From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH v2 2/7] regulator: dt bindings: add BD71847 device-tree
 binding documentation
Date: Wed, 12 Sep 2018 14:47:11 +0300
Message-ID: <d1daaf5ebae091d6efe0f7ca4253acefab29a791.1536750863.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1536750863.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1536750863.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Add ROHM BD71847 Power Management IC regulator binding information to
device-tree binding documents.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/regulator/rohm,bd71837-regulator.txt | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
index 76ead07072b1..4b98ca26e61a 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
@@ -1,7 +1,9 @@
-ROHM BD71837 Power Management Integrated Circuit (PMIC) regulator bindings
+ROHM BD71837 and BD71847 Power Management Integrated Circuit regulator bindings
 
 Required properties:
- - regulator-name: should be "buck1", ..., "buck8" and "ldo1", ..., "ldo7"
+ - regulator-name: should be "buck1", ..., "buck8" and "ldo1", ..., "ldo7" for
+                   BD71837. For BD71847 names should be "buck1", ..., "buck6"
+		   and "ldo1", ..., "ldo6"
 
 List of regulators provided by this controller. BD71837 regulators node
 should be sub node of the BD71837 MFD node. See BD71837 MFD bindings at
@@ -16,10 +18,14 @@ disabled by driver at startup. LDO5 and LDO6 are supplied by those and
 if they are disabled at startup the voltage monitoring for LDO5/LDO6 will
 cause PMIC to reset.
 
-The valid names for regulator nodes are:
+The valid names for BD71837 regulator nodes are:
 BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6, BUCK7, BUCK8
 LDO1, LDO2, LDO3, LDO4, LDO5, LDO6, LDO7
 
+The valid names for BD71847 regulator nodes are:
+BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6
+LDO1, LDO2, LDO3, LDO4, LDO5, LDO6
+
 Optional properties:
 - Any optional property defined in bindings/regulator/regulator.txt
 
-- 
2.14.3
