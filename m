From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/1] ARM: dts: meson: Extend L2 cache controller node for Meson8 and Meson8b
Date: Mon, 17 Apr 2017 23:42:44 +0200
Message-ID: <20170417214244.23698-2-martin.blumenstingl@googlemail.com>
References: <20170417214244.23698-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170417214244.23698-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

This patch extends the L2 cache controller node for the Amlogic Meson8
and Meson8b SoCs with some missing parameters. These are taken from the
Amlogic GPL kernel source.

Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
[apply the change to Meson8 and Meson8b and updated description]
Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi  | 6 ++++++
 arch/arm/boot/dts/meson8b.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 5eaaf067c76a..6993077331c7 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -188,6 +188,12 @@
 	clocks = <&clk81>;
 };
 
+&L2 {
+	arm,data-latency = <3 3 3>;
+	arm,tag-latency = <2 2 2>;
+	arm,filter-ranges = <0x100000 0xc0000000>;
+};
+
 &spifc {
 	clocks = <&clk81>;
 };
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index ef9ac974111c..d9f116a418b2 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -171,6 +171,12 @@
 	};
 };
 
+&L2 {
+	arm,data-latency = <3 3 3>;
+	arm,tag-latency = <2 2 2>;
+	arm,filter-ranges = <0x100000 0xc0000000>;
+};
+
 &uart_AO {
 	clocks = <&clkc CLKID_CLK81>;
 };
-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
