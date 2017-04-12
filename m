From: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/4] arm64: dts: rk3399: add missing qos node
Date: Wed, 12 Apr 2017 15:10:41 +0800
Message-ID: <1491981044-24635-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add qos setting reg for some peripheral like sd, usb, pcie.

Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 45 ++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index f4f3c96..387ae34 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -769,11 +769,6 @@
 		status = "disabled";
 	};
 
-	qos_sd: qos@ffa74000 {
-		compatible = "syscon";
-		reg = <0x0 0xffa74000 0x0 0x20>;
-	};
-
 	qos_emmc: qos@ffa58000 {
 		compatible = "syscon";
 		reg = <0x0 0xffa58000 0x0 0x20>;
@@ -784,6 +779,41 @@
 		reg = <0x0 0xffa5c000 0x0 0x20>;
 	};
 
+	qos_pcie: qos@ffa60080 {
+		compatible = "syscon";
+		reg = <0x0 0xffa60080 0x0 0x20>;
+	};
+
+	qos_usb_host0: qos@ffa60100 {
+		compatible = "syscon";
+		reg = <0x0 0xffa60100 0x0 0x20>;
+	};
+
+	qos_usb_host1: qos@ffa60180 {
+		compatible = "syscon";
+		reg = <0x0 0xffa60180 0x0 0x20>;
+	};
+
+	qos_usb_otg0: qos@ffa70000 {
+		compatible = "syscon";
+		reg = <0x0 0xffa70000 0x0 0x20>;
+	};
+
+	qos_usb_otg1: qos@ffa70080 {
+		compatible = "syscon";
+		reg = <0x0 0xffa70080 0x0 0x20>;
+	};
+
+	qos_sd: qos@ffa74000 {
+		compatible = "syscon";
+		reg = <0x0 0xffa74000 0x0 0x20>;
+	};
+
+	qos_sdioaudio: qos@ffa76000 {
+		compatible = "syscon";
+		reg = <0x0 0xffa76000 0x0 0x20>;
+	};
+
 	qos_hdcp: qos@ffa90000 {
 		compatible = "syscon";
 		reg = <0x0 0xffa90000 0x0 0x20>;
@@ -854,6 +884,11 @@
 		reg = <0x0 0xffad0000 0x0 0x20>;
 	};
 
+	qos_perihp: qos@ffad8080 {
+		compatible = "syscon";
+		reg = <0x0 0xffad8080 0x0 0x20>;
+	};
+
 	qos_gpu: qos@ffae0000 {
 		compatible = "syscon";
 		reg = <0x0 0xffae0000 0x0 0x20>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
