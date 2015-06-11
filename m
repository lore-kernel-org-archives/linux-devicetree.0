From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2] ARM: BCM5301X: activate some additional options in pl310 cache controller
Date: Thu, 11 Jun 2015 23:03:55 +0200
Message-ID: <1434056635-6880-1-git-send-email-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, fainelli-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In the default Broadcom SDK the shared override is activated for this
cache controller, do the same in the upstream code. Data and
instruction prefetching is not activated by default for this cache
controller on the bcm53xx SoC, do it manually like it is done in the
vendor SDK.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---

changes since v1:
 * remove the arm prefix in prefetch-data and prefetch-instr.

 arch/arm/boot/dts/bcm5301x.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 78aec62..589b285 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -78,6 +78,9 @@
 			compatible = "arm,pl310-cache";
 			reg = <0x2000 0x1000>;
 			cache-unified;
+			arm,shared-override;
+			prefetch-data = <1>;
+			prefetch-instr = <1>;
 			cache-level = <2>;
 		};
 	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
