From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=20V2=202/2=5D=20ARM=3A=20dts=3A=20bcm283x=3A=20fix=20typo=20in=20mailbox=20address?=
Date: Sun, 30 Oct 2016 17:22:19 +0000
Message-ID: <1477848139-32267-1-git-send-email-stefan.wahren@i2se.com>
References: <6b13e96d-78d1-fcab-4273-803310ae4da6@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6b13e96d-78d1-fcab-4273-803310ae4da6-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The address of the mailbox node in the bcm283x.dtsi also has a typo.
So fix it accordingly.

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Reviewed-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
Fixes: 05b682b7a3b2 ("ARM: bcm2835: dt: Add the mailbox to the device tree")
---
Changes in V2:
  * fixed commit message as reported by Andreas

 arch/arm/boot/dts/bcm283x.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 46d46d8..74dd21b 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -104,7 +104,7 @@
 			reg = <0x7e104000 0x10>;
 		};
 
-		mailbox: mailbox@7e00b800 {
+		mailbox: mailbox@7e00b880 {
 			compatible = "brcm,bcm2835-mbox";
 			reg = <0x7e00b880 0x40>;
 			interrupts = <0 1>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
