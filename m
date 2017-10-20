From: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v3 6/6] ARM: dts: imx53-tx53: Fix 'ethernet-phy@0' node with unit name and no reg property
Date: Fri, 20 Oct 2017 13:48:27 -0200
Message-ID: <1508514507-30736-6-git-send-email-marco.franchi@nxp.com>
References: <1508514507-30736-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508514507-30736-1-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following build warning is seen with W=1:

Warning (unit_address_vs_reg): Node /soc/aips@60000000/ethernet@63fec000/ethernet-phy@0 has a unit name, but no reg property

Fix this warning by adding reg property from such node.

Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
---
Changes since v2:
-change message log
-add reg property
 arch/arm/boot/dts/imx53-tx53.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx53-tx53.dtsi b/arch/arm/boot/dts/imx53-tx53.dtsi
index 76e7186..61ecd13 100644
--- a/arch/arm/boot/dts/imx53-tx53.dtsi
+++ b/arch/arm/boot/dts/imx53-tx53.dtsi
@@ -226,6 +226,7 @@
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
+		reg = <0>;
 		interrupts-extended = <&gpio2 4 IRQ_TYPE_EDGE_FALLING>;
 		device_type = "ethernet-phy";
 	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
