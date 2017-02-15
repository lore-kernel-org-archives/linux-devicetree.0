From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 10/11] Documentation: devicetree: arm: Document Actions Semi S900
Date: Wed, 15 Feb 2017 17:55:27 +0100
Message-ID: <20170215165528.10052-11-afaerber@suse.de>
References: <20170215165528.10052-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170215165528.10052-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: contact-CO9UH4nLugWa1hIE42aguQ@public.gmane.org, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, info-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/acts.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/acts.txt b/Documentation/devicetree/bindings/arm/acts.txt
index a34d647..cdbfe12 100644
--- a/Documentation/devicetree/bindings/arm/acts.txt
+++ b/Documentation/devicetree/bindings/arm/acts.txt
@@ -17,3 +17,16 @@ Modules:
 Boards:
 
  - LeMaker Guitar Base Board rev. B: "lemaker,guitar-bb-rev-b", "lemaker,guitar"
+
+
+S900 SoC
+========
+
+Required root node properties:
+
+- compatible :  "acts,s900"
+
+
+Boards:
+
+ - uCRobotics Bubblegum-96: "ucrobotics,bubblegum-96"
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
