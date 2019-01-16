From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] arm64: dts: meson: s400: enable sdr104 on sdio
Date: Wed, 16 Jan 2019 18:59:13 +0100
Message-ID: <20190116175913.5907-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

The bcm wifi/bt device on SDIO support SDR104 and it seems to work
well following the recent mmc driver update, so enable this
ultra high speed mode

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 2e1dcf1c26bf..0c98ca78c8b8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -464,7 +464,8 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	max-frequency = <100000000>;
+	sd-uhs-sdr104;
+	max-frequency = <200000000>;
 	non-removable;
 	disable-wp;
 
-- 
2.20.1
