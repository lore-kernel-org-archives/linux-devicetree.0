From: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: stm32: enable RTC on stm32h743i-eval
Date: Fri, 16 Feb 2018 14:16:40 +0100
Message-ID: <1518787000-10675-3-git-send-email-amelie.delaunay@st.com>
References: <1518787000-10675-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518787000-10675-1-git-send-email-amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch enables RTC on stm32h743i-eval.

Signed-off-by: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stm32h743i-eval.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32h743i-eval.dts b/arch/arm/boot/dts/stm32h743i-eval.dts
index 9f0e72c..cc8e458 100644
--- a/arch/arm/boot/dts/stm32h743i-eval.dts
+++ b/arch/arm/boot/dts/stm32h743i-eval.dts
@@ -84,6 +84,10 @@
 	clock-frequency = <25000000>;
 };
 
+&rtc {
+	status = "okay";
+};
+
 &usart1 {
 	pinctrl-0 = <&usart1_pins>;
 	pinctrl-names = "default";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
