From: dt.tangr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH RESEND] arm: nspire: modify device tree to use the lsi,zevio-usb driver
Date: Wed,  5 Mar 2014 20:15:16 +1100
Message-ID: <1394010916-17375-1-git-send-email-dt.tangr@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Daniel Tang <dt.tangr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Daniel Tang <dt.tangr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


Signed-off-by: Daniel Tang <dt.tangr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/nspire.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nspire.dtsi b/arch/arm/boot/dts/nspire.dtsi
index a22ffe6..012c6d1 100644
--- a/arch/arm/boot/dts/nspire.dtsi
+++ b/arch/arm/boot/dts/nspire.dtsi
@@ -65,6 +65,7 @@
 		};
 
 		usb0: usb@B0000000 {
+			compatible = "lsi,zevio-usb";
 			reg = <0xB0000000 0x1000>;
 			interrupts = <8>;
 		};
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
