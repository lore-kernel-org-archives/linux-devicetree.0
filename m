From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 5/5] gpio: DT: Rephrase property "gpios" of hog node to support multiple gpios
Date: Tue, 8 Mar 2016 17:32:08 +0530
Message-ID: <1457438528-29054-6-git-send-email-ldewangan@nvidia.com>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, treding@nvidia.com, swarren@wwwdotorg.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

The property "gpios" of GPIO hog node support the multiple GPIO entries.
Rephrase the details of this property for this new support.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 069cdf6..ea5d7df 100644
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
-- 
2.1.4

