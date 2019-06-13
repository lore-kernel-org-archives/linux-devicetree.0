From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH] dt-bindings: mfd: Add link to ROHM BD71847 Datasheet
Date: Thu, 13 Jun 2019 15:12:38 +0300
Message-ID: <20190613121237.GA8984@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

ROHM BD71847 PMIC datasheet was published.
Add datasheet link for BD71847 as well.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
index d5f68ac78d15..3c421bdbffc5 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71837-pmic.txt
@@ -8,6 +8,8 @@ and 6 LDOs.
 
 Datasheet for BD71837 is available at:
 https://www.rohm.com/datasheet/BD71837MWV/bd71837mwv-e
+Datasheet for BD71847 is available at:
+https://www.rohm.com/datasheet/BD71847AMWV/bd71847amwv-e
 
 Required properties:
  - compatible		: Should be "rohm,bd71837" for bd71837
-- 
2.17.2


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
