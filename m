From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 05/64] ARM: dts: meson8b: odroidc1: mark the SD card detection GPIO active-low
Date: Thu, 28 Feb 2019 10:10:06 -0500
Message-ID: <20190228151105.11277-5-sashal@kernel.org>
References: <20190228151105.11277-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190228151105.11277-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit 3fb348e030319f20ebbde082a449d4bf8a96f2fd ]

After commit 89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device
tree") SD cards are not detected anymore.

The CD GPIO is "active low" on Odroid-C1. The MMC dt-bindings specify:
"[...] using the "cd-inverted" property means, that the CD line is active
high, i.e. it is high, when a card is inserted".

Fix the description of the SD card by marking it as GPIO_ACTIVE_LOW and
drop the "cd-inverted" property. This makes the definition consistent
with the existing dt-bindings and fixes the check whether an SD card is
inserted.

Fixes: e03efbce6bebf5 ("ARM: dts: meson8b-odroidc1: add microSD support")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 9e48936e2d8d7..8fdeeffecbdbc 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -171,8 +171,7 @@
 		cap-sd-highspeed;
 		disable-wp;
 
-		cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
-		cd-inverted;
+		cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
 
 		vmmc-supply = <&tflash_vdd>;
 		vqmmc-supply = <&tf_io>;
-- 
2.19.1
