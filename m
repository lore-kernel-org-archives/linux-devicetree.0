From: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/4] dt-bindings: Update iProc GPIO bindings
Date: Tue, 12 Apr 2016 17:15:22 -0700
Message-ID: <1460506523-6249-4-git-send-email-ray.jui@broadcom.com>
References: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460506523-6249-1-git-send-email-ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update the iProc GPIO binding document to introduce a new compatible
string "brcm,iproc-gpio-only", that allows the generic pinconf function
to be disabled completely

Signed-off-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
index ddaa1b0..75a4370 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,iproc-gpio.txt
@@ -3,8 +3,11 @@ Broadcom iProc GPIO/PINCONF Controller
 Required properties:
 
 - compatible:
-    Must be "brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio",
-    "brcm,cygnus-crmu-gpio" or "brcm,iproc-gpio"
+    For Cygnus, it must be brcm,cygnus-ccm-gpio", "brcm,cygnus-asiu-gpio", or
+"brcm,cygnus-crmu-gpio"
+    For non-Cygnus iProc SoCs, it must be either "brcm,iproc-gpio-only" (if
+only GPIO is supported) or "brcm,iproc-gpio" (if both generic pinconf and GPIO
+are supported)
 
 - reg:
     Define the base and range of the I/O address space that contains SoC
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
