From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH 1/4] dt-bindings: Update iProc GPIO bindings
Date: Tue, 12 Apr 2016 17:15:20 -0700
Message-ID: <1460506523-6249-2-git-send-email-ray.jui@broadcom.com>
References: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

Update the iProc GPIO binding document to add a new optional property
'brcm,pinconf-func-off' that allows certain PINCONF parameters to be
disabled in certain iProc SoCs where these PINCONF functions are not
supported

Signed-off-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Jon Mason <jon.mason@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
index e427792..ddaa1b0 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
@@ -37,6 +37,11 @@ Optional properties:
     3  Pin-control base pin offset.
     4. number of gpio pins which are linearly mapped from pin base.
 
+- brcm,pinconf-func-off:
+    Certain iProc SoCs might have some of the PINCONF functions disabled in
+the chip when the iProc GPIO controller is integrated. This optional property
+allows unsupported PINCONF functions to be disabled
+
 Supported generic PINCONF properties in child nodes:
 
 - pins:
-- 
2.1.4

