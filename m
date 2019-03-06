From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v4 3/4] ARM: dts: rockchip: rk3066a-mk808: enable vop0 and hdmi nodes
Date: Wed,  6 Mar 2019 23:41:12 +0100
Message-ID: <20190306224113.24853-4-jbx6244@gmail.com>
References: <20190306224113.24853-1-jbx6244@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306224113.24853-1-jbx6244@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: hjc@rock-chips.com, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch enables the vop0 and hdmi nodes
for a MK808 with rk3066 processor.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a-mk808.dts | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a-mk808.dts b/arch/arm/boot/dts/rk3066a-mk808.dts
index 9d2216d71..8bc259d3e 100644
--- a/arch/arm/boot/dts/rk3066a-mk808.dts
+++ b/arch/arm/boot/dts/rk3066a-mk808.dts
@@ -30,6 +30,17 @@
 		};
 	};
 
+	hdmi_con {
+		compatible = "hdmi-connector";
+		type = "c";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	vcc_io: vcc-io {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_io";
@@ -91,6 +102,20 @@
 	};
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_in_vop1 {
+	status = "disabled";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cap-mmc-highspeed;
@@ -150,6 +175,10 @@
 	status = "okay";
 };
 
+&vop0 {
+	status = "okay";
+};
+
 &wdt {
 	status = "okay";
 };
-- 
2.11.0
