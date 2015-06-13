From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: [PATCH v2 1/3] dt-bindings: Add Raspberry Pi compatible string for watchdog
Date: Sat, 13 Jun 2015 13:38:59 +0200
Message-ID: <1434195541-28368-1-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Raspberry Pi has changed how its firmware detects a poweroff
and needs special handling for this.

Signed-off-by: Noralf Tr=C3=B8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
---

v2: Fix typo in commit message


 Documentation/devicetree/bindings/watchdog/brcm,bcm2835-pm-wdog.txt | =
3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm2835-pm=
-wdog.txt b/Documentation/devicetree/bindings/watchdog/brcm,bcm2835-pm-=
wdog.txt
index f801d71..1a80931 100644
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm2835-pm-wdog.t=
xt
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm2835-pm-wdog.t=
xt
@@ -2,7 +2,8 @@ BCM2835 Watchdog timer

 Required properties:

-- compatible : should be "brcm,bcm2835-pm-wdt"
+- compatible : should be "brcm,raspberrypi-pm-wdt" for the Raspberry P=
i and
+	       "brcm,bcm2835-pm-wdt" for others.
 - reg : Specifies base physical address and size of the registers.

 Optional properties:
--
2.2.2

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
