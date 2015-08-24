From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH-v3 1/2] mfd: devicetree: bindings: 88pm800: Add DT property for dual phase enable
Date: Mon, 24 Aug 2015 18:10:05 +0530
Message-ID: <1440420006-31556-2-git-send-email-vaibhav.hiremath@linaro.org>
References: <1440420006-31556-1-git-send-email-vaibhav.hiremath@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440420006-31556-1-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

88PM860 family of device supports dual phase mode on BUCK1 supply
providing total 6A capacity.
Note that by default they operate independently with 3A capacity.

This patch updates the devicetree binding with DT property
to enable dual-phase mode on BUCK1.

Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/88pm800.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/88pm800.txt b/Documentation/devicetree/bindings/mfd/88pm800.txt
index dec842f..2c82fcb 100644
--- a/Documentation/devicetree/bindings/mfd/88pm800.txt
+++ b/Documentation/devicetree/bindings/mfd/88pm800.txt
@@ -9,6 +9,12 @@ Required parent device properties:
 - #interrupt-cells 	: should be 1.
 			  The cell is the 88pm80x local IRQ number
 
+Optional properties :
+- marvell,88pm860-buck1-dualphase-en  : If set, enable dual phase on BUCK1,
+  providing 6A capacity.
+  Without this both BUCK1A and BUCK1B operates independently with 3A capacity.
+  (This property is only applicable to 88PM860)
+
 88pm80x family of devices consists of varied group of sub-devices:
 
 Device		 	Supply Names	 Description
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
