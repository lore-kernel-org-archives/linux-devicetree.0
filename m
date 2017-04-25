From: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v4 4/5] ARM: dts: rockchip: enable ARM Mali GPU on rk3288-firefly
Date: Tue, 25 Apr 2017 14:16:19 +0100
Message-ID: <fafd6334a436b0e65d13a0c5e67263a5c6fc4ebe.1493125299.git.guillaume.tucker@collabora.com>
References: <cover.1493125299.git.guillaume.tucker@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1493125299.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <cover.1493125299.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
References: <cover.1493125299.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add reference to the Mali GPU device tree node on rk3288-firefly.
Tested on Firefly board.

Signed-off-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3288-firefly.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-firefly.dtsi b/arch/arm/boot/dts/rk3288-firefly.dtsi
index 10793ac18599..f520589493b4 100644
--- a/arch/arm/boot/dts/rk3288-firefly.dtsi
+++ b/arch/arm/boot/dts/rk3288-firefly.dtsi
@@ -594,3 +594,8 @@
 &wdt {
 	status = "okay";
 };
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
