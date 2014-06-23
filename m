From: Vince Bridgers <vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: socfpga: Add missing #reset-cells to socfpga device tree
Date: Sun, 22 Jun 2014 19:31:02 -0500
Message-ID: <1403483462-21082-3-git-send-email-vbridgers2013@gmail.com>
References: <1403483462-21082-1-git-send-email-vbridgers2013@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403483462-21082-1-git-send-email-vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, tthayer-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

add #reset-cells to socfpga.dtsi. This was missing from the
latest updates and caused the socfpga reset controller to fail
to load like so:

ffd05000.rstmgr: /soc/rstmgr@ffd05000 missing #reset-cells property
probe of ffd05000.rstmgr failed with error -22

Signed-off-by: Vince Bridgers <vbridgers2013-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/socfpga.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 4676f25..0a66d8a 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -683,6 +683,7 @@
 		};
 
 		rst: rstmgr@ffd05000 {
+			#reset-cells = <1>;
 			compatible = "altr,rst-mgr";
 			reg = <0xffd05000 0x1000>;
 		};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
