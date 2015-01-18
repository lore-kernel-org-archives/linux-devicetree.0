From: Sylvain Rochet <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>
Subject: [PATCHv2 1/2] dts: Documentation: AT91 Watchdog, explain what atmel,idle-halt property really do
Date: Sun, 18 Jan 2015 14:26:50 +0100
Message-ID: <1421587611-32708-2-git-send-email-sylvain.rochet@finsecur.com>
References: <20150118090820.07856398@bbrezillon>
 <1421587611-32708-1-git-send-email-sylvain.rochet@finsecur.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421587611-32708-1-git-send-email-sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sylvain Rochet <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

atmel,idle-halt property should be used with care, it actually makes the
watchdog not counting when the CPU is in idle state, therefore the
watchdog reset time depends on mean CPU usage and will not reset at all
of the CPU stop working while it is in idle state, which is probably not
what you want.

Signed-off-by: Sylvain Rochet <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/watchdog/atmel-wdt.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
index f90e294..a4d8697 100644
--- a/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
@@ -26,6 +26,11 @@ Optional properties:
 - atmel,disable : Should be present if you want to disable the watchdog.
 - atmel,idle-halt : Should be present if you want to stop the watchdog when
 	entering idle state.
+	CAUTION: This property should be used with care, it actually makes the
+	watchdog not counting when the CPU is in idle state, therefore the
+	watchdog reset time depends on mean CPU usage and will not reset at all
+	if the CPU stop working while it is in idle state, which is probably
+	not what you want.
 - atmel,dbg-halt : Should be present if you want to stop the watchdog when
 	entering debug state.
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
