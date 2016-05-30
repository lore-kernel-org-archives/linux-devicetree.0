From: Peter Senna Tschudin <peter.senna@collabora.com>
Subject: [PATCH 5/5] arm/dts/imx6q-b850v3: Use GE B850v3 LVDS/DP++ Bridge
Date: Mon, 30 May 2016 18:39:45 +0200
Message-ID: <1464626385-19253-6-git-send-email-peter.senna@collabora.com>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, akpm@linux-foundation.org, davem@davemloft.net, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, enric.balletbo@collabora.com, galak@codeaurora.org, gregkh@linuxfoundation.org, heiko@sntech.de, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux@roeck-us.net, mark.rutland@arm.com, martin.donnelly@ge.com, martyn.welch@collabora.co.uk, mchehab@osg.samsung.com, pawel.moll@arm.com, peter.senna@collabora.com, p.zabel@pengutronix.de, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, shawnguo@kernel.org, tiwai@suse.com, treding@nvidia.com, ykk@rock-chips.com
List-Id: devicetree@vger.kernel.org

Configure the GE B850v3 to use the LVDS/DP++ bridge.

Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>
---
 arch/arm/boot/dts/imx6q-b850v3.dts | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
index 88a70de..d366384 100644
--- a/arch/arm/boot/dts/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/imx6q-b850v3.dts
@@ -77,6 +77,13 @@
 		fsl,data-mapping = "spwg";
 		fsl,data-width = <24>;
 		status = "okay";
+
+		port@4 {
+			reg = <4>;
+			lvds0_out: endpoint {
+				remote-endpoint = <&b850v3_lvds_dp_bridge_in>;
+			};
+		};
 	};
 };
 
@@ -147,3 +154,27 @@
 		reg = <0x4a>;
 	};
 };
+
+&mux2_i2c2 {
+	status = "okay";
+	clock-frequency = <100000>;
+
+	b850v3_lvds_dp_bridge {
+		compatible = "ge,b850v3_lvds_dp";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg = <0x73>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+		edid-reg = <0x72>;
+
+		port@0 {
+			reg = <0>;
+			b850v3_lvds_dp_bridge_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
-- 
2.5.5
