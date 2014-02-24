From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH 2/3] dts: mpc512x: adjust clock specs for FEC nodes
Date: Mon, 24 Feb 2014 11:25:56 +0100
Message-ID: <1393237557-31406-2-git-send-email-gsi@denx.de>
References: <1393237557-31406-1-git-send-email-gsi@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393237557-31406-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

a recent FEC binding document update that was motivated by i.MX
development revealed that ARM and PowerPC implementations in Linux
did not agree on the clock names to use for the FEC nodes

change clock names from "per" to "ipg" in the FEC nodes of the
mpc5121.dtsi include file such that the .dts specs comply with
the common FEC binding

this "incompatible" change does not break operation, because
- COMMON_CLK support for MPC5121/23/25 and adjusted .dts files
  were only introduced in Linux v3.14-rc1, no mainline release
  provided these specs before
- if this change won't make it for v3.14, the MPC512x CCF support
  provides full backwards compability, and keeps operating with
  device trees which lack clock specs or don't match in the names

Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
---
 arch/powerpc/boot/dts/mpc5121.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
index 2c0e1552d20b..a5a375598ed8 100644
--- a/arch/powerpc/boot/dts/mpc5121.dtsi
+++ b/arch/powerpc/boot/dts/mpc5121.dtsi
@@ -281,7 +281,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			clocks = <&clks MPC512x_CLK_FEC>;
-			clock-names = "per";
+			clock-names = "ipg";
 		};
 
 		eth0: ethernet@2800 {
@@ -291,7 +291,7 @@
 			local-mac-address = [ 00 00 00 00 00 00 ];
 			interrupts = <4 0x8>;
 			clocks = <&clks MPC512x_CLK_FEC>;
-			clock-names = "per";
+			clock-names = "ipg";
 		};
 
 		/* USB1 using external ULPI PHY */
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
