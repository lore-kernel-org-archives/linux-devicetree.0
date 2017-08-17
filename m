From: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 2/4] ARM: dts: bcm283x: Use stdout-path instead of console bootarg
Date: Thu, 17 Aug 2017 19:59:49 +0200
Message-ID: <1502992791-10265-2-git-send-email-loic.poulain@gmail.com>
References: <1502992791-10265-1-git-send-email-loic.poulain@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502992791-10265-1-git-send-email-loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the serial port config to "chosen/stdout-path".
Create serial0/1 aliases referring to uart0 ant uart1 paths.
Remove unneeded earlyprintk.

Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 v2: dt-bindings as separate patch
     rebase on upcoming pi3 dts changes
 v3: changes in bcm serdev drivers:
     name refactoring and additional comments
     Add generic host_set_baudrate method
     Use agnostic device_property_read
 v4: changes in doc and dts:
     Add additional params to broadcom bt dt-bindings
     Set the max baudrate to 2000000 instead of 921600
     use chosen/stdout-path instead of console=
     remove useless earlyprintk
     same changes in bcm283x.dtsi

 arch/arm/boot/dts/bcm283x.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 431dcfc..013431e 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -20,8 +20,13 @@
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
 	chosen {
-		bootargs = "earlyprintk console=ttyAMA0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	thermal-zones {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
