From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/6] mfd: devicetree: bindings: 88pm800: Add DT property for 32KHz output enable
Date: Thu,  9 Jul 2015 17:17:08 +0530
Message-ID: <1436442431-3471-4-git-send-email-vaibhav.hiremath@linaro.org>
References: <1436442431-3471-1-git-send-email-vaibhav.hiremath@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436442431-3471-1-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

88PM800 family of device supports output of 32KHz clock (low jitter)
on CLK32K2/3 pin which can be supplied to other peripherals on the board.

This patch adds the devicetree binding to enable this feature.

Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/88pm800.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/88pm800.txt b/Documentation/devicetree/bindings/mfd/88pm800.txt
index dec842f..ae1311c 100644
--- a/Documentation/devicetree/bindings/mfd/88pm800.txt
+++ b/Documentation/devicetree/bindings/mfd/88pm800.txt
@@ -9,6 +9,12 @@ Required parent device properties:
 - #interrupt-cells 	: should be 1.
 			  The cell is the 88pm80x local IRQ number
 
+Optional properties :
+ - marvell,88pm800-32khz-xolj-out-en	: If set, driver will enable low jitter
+   version of 32Khz clock output on
+      CLK32K3 - for 88pm800
+      CLK32K2 - for 88pm860
+
 88pm80x family of devices consists of varied group of sub-devices:
 
 Device		 	Supply Names	 Description
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
