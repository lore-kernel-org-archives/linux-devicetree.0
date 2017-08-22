From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [RESENT PATCH v6 3/8] arm64: dts: rockchip: Add rt5514 dsp for Gru
Date: Tue, 22 Aug 2017 23:35:50 +0800
Message-ID: <20170822153555.20735-4-jeffy.chen@rock-chips.com>
References: <20170822153555.20735-1-jeffy.chen@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170822153555.20735-1-jeffy.chen@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, dgreid@chromium.org, heiko@sntech.de
Cc: briannorris@chromium.org, mka@chromium.org, dianders@chromium.org, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Caesar Wang <wxt@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Add rt5514 dsp of_node to codec list for Gru boards.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

Changes in v6: None
Changes in v5: None
Changes in v3: None
Changes in v2: None

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 690a43f46641..72717e77a0fc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -514,7 +514,8 @@
 	sound {
 		compatible = "rockchip,rk3399-gru-sound";
 		rockchip,cpu = <&i2s0 &i2s2>;
-		rockchip,codec = <&max98357a &headsetcodec &codec>;
+		rockchip,codec = <&max98357a &headsetcodec
+				  &codec &wacky_spi_audio>;
 	};
 };
 
-- 
2.11.0
