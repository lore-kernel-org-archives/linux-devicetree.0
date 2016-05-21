From: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 0013/1529] Fix typo
Date: Sat, 21 May 2016 13:37:06 +0200
Message-ID: <20160521113706.31942-1-andrea.gelmini@gelma.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org
Cc: trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/lpc1850-ccu.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/lpc1850-ccu.txt b/Documentation/devicetree/bindings/clock/lpc1850-ccu.txt
index fa97c12..8cf8f0e 100644
--- a/Documentation/devicetree/bindings/clock/lpc1850-ccu.txt
+++ b/Documentation/devicetree/bindings/clock/lpc1850-ccu.txt
@@ -68,7 +68,7 @@ soc {
 			      "base_ssp0_clk",  "base_sdio_clk";
 	};
 
-	/* A user of CCU brach clocks */
+	/* A user of CCU branch clocks */
 	uart1: serial@40082000 {
 		...
 		clocks = <&ccu2 CLK_APB0_UART1>, <&ccu1 CLK_CPU_UART1>;
-- 
2.8.2.534.g1f66975

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
