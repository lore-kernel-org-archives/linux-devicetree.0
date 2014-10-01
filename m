From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 3/4] ARM: dts: keystone-k2e: fix mdio io start address
Date: Wed, 1 Oct 2014 13:37:33 +0300
Message-ID: <1412159854-21143-4-git-send-email-grygorii.strashko@ti.com>
References: <1412159854-21143-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412159854-21143-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The K2E MDIO io space has different start address.
Hence, fix it to be 0x24200f00 according to TRM.

Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/k2e.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/k2e.dtsi b/arch/arm/boot/dts/k2e.dtsi
index 0e25f79..13b0feb 100644
--- a/arch/arm/boot/dts/k2e.dtsi
+++ b/arch/arm/boot/dts/k2e.dtsi
@@ -80,3 +80,7 @@
 		};
 	};
 };
+
+&mdio {
+	reg = <0x24200f00 0x100>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
