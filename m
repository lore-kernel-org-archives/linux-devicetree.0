From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.20 06/81] ARM: dts: meson8b: ec100: mark the SD card detection GPIO active-low
Date: Thu, 28 Feb 2019 10:06:58 -0500
Message-ID: <20190228150813.10256-6-sashal@kernel.org>
References: <20190228150813.10256-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228150813.10256-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit c8bfe65fb1fb7a43d766df1dfa379406112cba61 ]

After commit 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device
tree") SD cards are not detected anymore.

The CD GPIO is "active low" on the EC-100. The MMC dt-bindings specify:
"[...] using the "cd-inverted" property means, that the CD line is active
high, i.e. it is high, when a card is inserted".

Fix the description of the SD card by marking it as GPIO_ACTIVE_LOW and
drop the "cd-inverted" property. This makes the definition consistent
with the existing dt-bindings and fixes the check whether an SD card is
inserted.

Fixes: bbedc1f1d90e33 ("ARM: dts: meson8b: Add support for the Endless Mini (EC-100)")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/meson8b-ec100.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 0872f6e3abf56..d50fc2f60fa31 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -205,8 +205,7 @@
 		cap-sd-highspeed;
 		disable-wp;
 
-		cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-		cd-inverted;
+		cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 		vmmc-supply = <&vcc_3v3>;
 	};
-- 
2.19.1
