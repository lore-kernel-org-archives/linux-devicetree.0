From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH v4 3/6] arm: dts: aspeed-g5: Add SoC Display Controller node
Date: Tue,  6 Dec 2016 14:53:45 +1100
Message-ID: <20161206035348.29948-4-andrew@aj.id.au>
References: <20161206035348.29948-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161206035348.29948-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index dd94d9361fda..c7ff3ea4bf37 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -71,6 +71,12 @@
 				reg = <0x1e6e202c 0x4>;
 			};
 
+			gfx: display@1e6e6000 {
+				compatible = "aspeed,ast2500-gfx", "syscon";
+				reg = <0x1e6e6000 0x1000>;
+				reg-io-width = <4>;
+			};
+
 			sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x9000>;	// 36K
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
