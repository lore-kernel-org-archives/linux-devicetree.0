From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2 4/5] arm64: dts: rockchip: enable the GPU for RK3399-GRU
Date: Mon, 17 Jul 2017 16:14:30 +0800
Message-ID: <1500279271-15249-5-git-send-email-wxt@rock-chips.com>
References: <1500279271-15249-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500279271-15249-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, rocky.hao@rock-chips.com, Caesar Wang <wxt@rock-chips.com>, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch enables the gpu and adds the mali-supply power for RK3399-GRU
devices.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

Changes in v2: None

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 90259cf..d48e98b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -595,6 +595,11 @@
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&ppvar_gpu>;
+	status = "okay";
+};
+
 ap_i2c_mic: &i2c1 {
 	status = "okay";
 
-- 
2.7.4
