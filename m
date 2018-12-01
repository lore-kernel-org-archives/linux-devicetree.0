From: Oskari Lemmela <oskari@lemmela.net>
Subject: [PATCH 2/2] arm64: dts: rockchip: rockpro64 fix video output chain
Date: Sat,  1 Dec 2018 12:08:17 +0200
Message-ID: <20181201100817.20688-3-oskari@lemmela.net>
References: <20181201100817.20688-1-oskari@lemmela.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181201100817.20688-1-oskari@lemmela.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Akash Gajjar <Akash_Gajjar@mentor.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Oskari Lemmela <oskari@lemmela.net>
List-Id: devicetree@vger.kernel.org

Rockpro64 is not able boot if kernel is compiled with
CONFIG_DRM_ROCKCHIP=m

Enable Rockpro64 board HDMI output to fix issue.

Signed-off-by: Oskari Lemmela <oskari@lemmela.net>
---
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
index 5bd4d69914bd..be78172abc09 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
@@ -205,6 +205,13 @@
 	status = "okay";
 };
 
+&hdmi {
+	ddc-i2c-bus = <&i2c3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_cec>;
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	i2c-scl-rising-time-ns = <168>;
-- 
2.17.1
