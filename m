From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 3/3] arm64: dts: rockchip: enable DP for gru.
Date: Tue, 13 Feb 2018 15:35:49 +0100
Message-ID: <20180213143549.15197-3-enric.balletbo@collabora.com>
References: <20180213143549.15197-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180213143549.15197-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Brian Norris <briannorris@chromium.org>, groeck@chromium.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>, kernel@collabora.com
List-Id: devicetree@vger.kernel.org

From: Chris Zhong <zyw@rock-chips.com>

Enable cdn_dp and create a cdn-dp-sound for the DP audio. Delete the
endpoints between dp and vopL for gru, since we want the DP only use
VOP big, which can support 4K mode.

Signed-off-by: Chris Zhong <zyw@rock-chips.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Changes since v1:
- None

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 03f195025390..d05e8a52ec3c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -515,7 +515,23 @@
 		compatible = "rockchip,rk3399-gru-sound";
 		rockchip,cpu = <&i2s0 &i2s2>;
 		rockchip,codec = <&max98357a &headsetcodec
-				  &codec &wacky_spi_audio>;
+				  &codec &wacky_spi_audio &cdn_dp>;
+	};
+};
+
+/* Don't use vopl for dp, save it for edp */
+/delete-node/ &vopl_out_dp;
+/delete-node/ &dp_in_vopl;
+
+&cdn_dp {
+	status = "okay";
+	extcon = <&usbc_extcon0>, <&usbc_extcon1>;
+
+	ports {
+		/* Don't use vopl for dp, save it for edp */
+		dp_in: port {
+			/delete-node/ endpoint@1;
+		};
 	};
 };
 
-- 
2.15.1
