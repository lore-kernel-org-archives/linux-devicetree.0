From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 4/5] gpio: DT: Rephrase "gpios" of hog node to support multiple gpios
Date: Fri, 11 Mar 2016 19:13:23 +0530
Message-ID: <1457703804-3016-5-git-send-email-ldewangan@nvidia.com>
References: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, mpa@pengutronix.de, swarren@wwwdotorg.org, treding@nvidia.com
Cc: bparrot@ti.com, acourbot@nvidia.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

The property "gpios" of GPIO hog node support the multiple GPIO entries.
Rephrase the details of this property for this new support.

Add details of new property "label" for GPIO label name.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

---
Changes from V1:
- Add details for the new property "label".
- Resequence series to make this as 4/5 which was 5/5.
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 069cdf6..6270e2d 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -162,9 +162,9 @@ gpio-controller's driver probe function.
 Each GPIO hog definition is represented as a child node of the GPIO controller.
 Required properties:
 - gpio-hog:   A property specifying that this child node represent a GPIO hog.
-- gpios:      Store the GPIO information (id, flags, ...). Shall contain the
-	      number of cells specified in its parent node (GPIO controller
-	      node).
+- gpios:      Store the GPIO information (id, flags, ...). Multiple GPIOs are
+	      possible to list here. Shall contain the number of cells
+	      specified in its parent node (GPIO controller node) per GPIOs.
 Only one of the following properties scanned in the order shown below.
 This means that when multiple properties are present they will be searched
 in the order presented below and the first match is taken as the intended
@@ -177,6 +177,11 @@ configuration.
 
 Optional properties:
 - line-name:  The GPIO label name. If not present the node name is used.
+- label:      The GPIO lable name. This can have multiple string for GPIO
+	      label names to match with the GPIOs in "gpios" properties.
+	      If line-name is prosent than name is taken from line-name. If
+	      it is not then the name will be taken from label. If both are
+	      not available then node name is used for GPIO label name.
 
 Example of two SOC GPIO banks defined as gpio-controller nodes:
 
-- 
2.1.4
