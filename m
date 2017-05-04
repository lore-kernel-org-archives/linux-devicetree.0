From: Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
Subject: [v2, 1/5] mmc: dt: add compatible into eSDHC required properties
Date: Thu, 4 May 2017 18:48:56 +0800
Message-ID: <1493894940-47452-2-git-send-email-yangbo.lu@nxp.com>
References: <1493894940-47452-1-git-send-email-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493894940-47452-1-git-send-email-yangbo.lu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>
Cc: Xiaobo Xie <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>, Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch is to add compatible into eSDHC required properties.

Signed-off-by: Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
---
Changes for v2:
	- Added this patch.
---
 Documentation/devicetree/bindings/mmc/fsl-esdhc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt b/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt
index dedfb02..b04b248 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt
+++ b/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt
@@ -7,6 +7,7 @@ This file documents differences between the core properties described
 by mmc.txt and the properties used by the sdhci-esdhc driver.
 
 Required properties:
+  - compatible : should be "fsl,esdhc", or "fsl,<chip>-esdhc".
   - interrupt-parent : interrupt source phandle.
   - clock-frequency : specifies eSDHC base clock frequency.
 
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
