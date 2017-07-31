From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 14/14] ARM: dts: rockchip: add accelerometer bma250e dt node for rv1108 evb
Date: Mon, 31 Jul 2017 18:21:07 +0800
Message-ID: <1501496467-22173-1-git-send-email-andy.yan@rock-chips.com>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501495449-21290-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add dt node of bosch accelerometer bma250e on rv1108 evb.

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm/boot/dts/rv1108-evb.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
index 5675975..60bb501 100644
--- a/arch/arm/boot/dts/rv1108-evb.dts
+++ b/arch/arm/boot/dts/rv1108-evb.dts
@@ -109,6 +109,13 @@
 	i2c-scl-falling-time-ns = <16>;
 	clock-frequency = <400000>;
 
+	bma250: accelerometer@19 {
+		compatible = "bosch,bma250e";
+		reg = <0x19>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB3 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	rk805: pmic@18 {
 		compatible = "rockchip,rk805";
 		reg = <0x18>;
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
