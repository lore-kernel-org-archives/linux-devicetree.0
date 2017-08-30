From: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 1/2] ARM: dts: bcm283x: Use stdout-path instead of console bootarg
Date: Wed, 30 Aug 2017 22:42:00 +0200
Message-ID: <1504125721-4760-1-git-send-email-loic.poulain@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the serial port config to "chosen/stdout-path".
Create serial0/1 aliases referring to uart0 ant uart1 paths.
Remove unneeded earlyprintk.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/bcm283x.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

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
 v5: remove 1/4 dt-bindings and 4/4 hci_bcm serdev support
     1/4 and 4/4 merged in bluetooth-next tree

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
