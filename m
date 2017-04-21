From: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH RESEND v2 1/2] dt-binding: regulator: anatop: make regulator name property required
Date: Fri, 21 Apr 2017 10:53:52 +0800
Message-ID: <1492743232-20055-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We actually can't allow the missing of the regualor name, thus update
the binding doc to make regulator-name property to be required.

Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Brown  <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/regulator/anatop-regulator.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
index 1d58c8c..a3106c7 100644
--- a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
@@ -2,6 +2,7 @@ Anatop Voltage regulators
 
 Required properties:
 - compatible: Must be "fsl,anatop-regulator"
+- regulator-name: A string used as a descriptive name for regulator outputs
 - anatop-reg-offset: Anatop MFD register offset
 - anatop-vol-bit-shift: Bit shift for the register
 - anatop-vol-bit-width: Number of bits used in the register
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
