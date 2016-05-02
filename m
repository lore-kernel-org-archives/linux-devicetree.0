From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v2 1/2] dt-bindings: Update iProc GPIO bindings
Date: Mon,  2 May 2016 13:51:47 -0700
Message-ID: <1462222308-4869-2-git-send-email-ray.jui@broadcom.com>
References: <1462222308-4869-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1462222308-4869-1-git-send-email-ray.jui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

Update the iProc GPIO binding document to add new compatible strings
"brcm,iproc-gpio-v2" and "brcm,iproc-gpio-v3" for the 2nd and 3rd
generation of the iProc GPIO controllers

Signed-off-by: Ray Jui <ray.jui@broadcom.com>
---
 Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
index e427792..3a56649 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
@@ -4,7 +4,16 @@ Required properties:
 
 - compatible:
     Must be "brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio",
-    "brcm,cygnus-crmu-gpio" or "brcm,iproc-gpio"
+    or "brcm,cygnus-crmu-gpio" for Cygnus SoCs
+
+    "brcm,iproc-gpio" for the first generation of the GPIO controller that
+    supports full-featured pinctrl and GPIO functions used in iProc based SoCs
+
+    "brcm,iproc-gpio-v2" for the second generation of the GPIO controller that
+    has the drive strength pinctrl support disabled, e.g., in the iProc NSP SoC
+
+    "brcm,iproc-gpio-v3" for the third generation of the GPIO controller that
+    has the general pinctrl support completely disabled
 
 - reg:
     Define the base and range of the I/O address space that contains SoC
-- 
2.1.4

