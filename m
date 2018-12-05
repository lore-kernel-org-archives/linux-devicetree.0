From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 3/3] ARM: dts: sun8i: a33: Drop audio codec oversampling rate to 128 fs
Date: Wed,  5 Dec 2018 18:11:52 +0800
Message-ID: <20181205101152.22983-4-wens@csie.org>
References: <20181205101152.22983-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205101152.22983-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

The current oversampling rate of 512 means that for 48 kHz 16 bit
stereo, the MCLK is running at the same rate as the module clock,
so there is no head room to support higher sampling rates. The codec
however supports up to 192 kHz for playback.

This patch drops the oversampling rate from 512 to 128, so that 192 kHz
audio can be played back directly without downsampling. Ideally we
should be using different oversampling rates for different sampling
rates, but that's not possible without a platform-specific machine
driver.

Fixes: 870f1bd1f5e9 ("ARM: dts: sun8i: Add audio codec, dai and card for A33")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a33.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index c2c10cd4a210..11f58893678d 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -207,7 +207,7 @@
 		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&link_codec>;
 		simple-audio-card,bitclock-master = <&link_codec>;
-		simple-audio-card,mclk-fs = <512>;
+		simple-audio-card,mclk-fs = <128>;
 		simple-audio-card,aux-devs = <&codec_analog>;
 		simple-audio-card,routing =
 			"Left DAC", "AIF1 Slot 0 Left",
-- 
2.20.0.rc1
