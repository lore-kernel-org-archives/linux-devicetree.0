From: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] arm64: dts: cavium: fix memory node dtc warnings
Date: Sat, 29 Jul 2017 20:35:25 +0000
Message-ID: <1501360525-78484-1-git-send-email-jnair@caviumnetworks.com>
References: <CAL_JsqLgPRQqWu=Fh-6EroHs64_M9Q8jWa20Hv=dGro62oR=XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLgPRQqWu=Fh-6EroHs64_M9Q8jWa20Hv=dGro62oR=XA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Newer dtc versions generate a warning for thunder2-99xx.dts of the form:
  Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name

Fixup the memory node name to avoid this.

Signed-off-by: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
---
 arch/arm64/boot/dts/cavium/thunder2-99xx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dts b/arch/arm64/boot/dts/cavium/thunder2-99xx.dts
index 6c6fb86..fc7c9dd 100644
--- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dts
+++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dts
@@ -18,7 +18,7 @@
 	model = "Cavium ThunderX2 CN99XX";
 	compatible = "cavium,thunderx2-cn9900", "brcm,vulcan-soc";
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x00000000 0x80000000 0x0 0x80000000>,  /* 2G @ 2G  */
 		      <0x00000008 0x80000000 0x0 0x80000000>;  /* 2G @ 34G */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
