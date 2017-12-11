From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 05/20] ARM: dts: imx6*-hummingboard2: add Broadcom Wi-Fi
 include
Date: Mon, 11 Dec 2017 16:57:42 +0000
Message-ID: <E1eOROg-0000HB-Ur@rmk-PC.armlinux.org.uk>
References: <20171211165631.GW10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211165631.GW10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Broadcom Wi-Fi was moved out to a separate include file.  Add the
include.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl-hummingboard2.dts | 1 +
 arch/arm/boot/dts/imx6q-hummingboard2.dts  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-hummingboard2.dts b/arch/arm/boot/dts/imx6dl-hummingboard2.dts
index 30e042822ec6..99b6cce13175 100644
--- a/arch/arm/boot/dts/imx6dl-hummingboard2.dts
+++ b/arch/arm/boot/dts/imx6dl-hummingboard2.dts
@@ -43,6 +43,7 @@
 
 #include "imx6dl.dtsi"
 #include "imx6qdl-sr-som.dtsi"
+#include "imx6qdl-sr-som-brcm.dtsi"
 #include "imx6qdl-hummingboard2.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/imx6q-hummingboard2.dts b/arch/arm/boot/dts/imx6q-hummingboard2.dts
index 8dcad5668c17..fab388a0f673 100644
--- a/arch/arm/boot/dts/imx6q-hummingboard2.dts
+++ b/arch/arm/boot/dts/imx6q-hummingboard2.dts
@@ -43,6 +43,7 @@
 
 #include "imx6q.dtsi"
 #include "imx6qdl-sr-som.dtsi"
+#include "imx6qdl-sr-som-brcm.dtsi"
 #include "imx6qdl-hummingboard2.dtsi"
 
 / {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
