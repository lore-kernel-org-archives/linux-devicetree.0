From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v2 5/9] of: Add Boundary Devices Inc. vendor prefix
Date: Tue,  8 Sep 2015 16:34:42 +0200
Message-ID: <1441722886-22798-6-git-send-email-gary.bisson@boundarydevices.com>
References: <1441645069-27263-1-git-send-email-gary.bisson@boundarydevices.com>
 <1441722886-22798-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441722886-22798-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the vendor prefix for Boundary Devices Inc. which is a
supplier of ARM-based single board computers and System-on-Modules for
the general embedded market.

Website: http://boundarydevices.com/

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ac5f0c3..4c67e2a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -34,6 +34,7 @@ avago	Avago Technologies
 avic	Shanghai AVIC Optoelectronics Co., Ltd.
 axis	Axis Communications AB
 bosch	Bosch Sensortec GmbH
+boundary	Boundary Devices Inc.
 brcm	Broadcom Corporation
 buffalo	Buffalo, Inc.
 calxeda	Calxeda
-- 
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
