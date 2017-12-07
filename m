From: <sean.wang@mediatek.com>
Subject: [PATCH v2 3/3] arm: dts: mt7623: fix card detection issue on bananapi-r2
Date: Thu, 7 Dec 2017 14:43:24 +0800
Message-ID: <e71b755467ce9a1f8bf78e2b6cd2e1b63e8338cd.1512628593.git.sean.wang@mediatek.com>
References: <cover.1512628593.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <cover.1512628593.git.sean.wang@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Fix that bananapi-r2 booting from SD-card would fail since incorrect
polarity is applied to the previous setup with GPIO_ACTIVE_HIGH.

Cc: stable@vger.kernel.org
Fixes: 0eed8d097612 ("arm: dts: mt7623: Add SD-card and EMMC to bananapi-r2")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Tested-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 688a863..7bf5aa2 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -204,7 +204,7 @@
 	bus-width = <4>;
 	max-frequency = <50000000>;
 	cap-sd-highspeed;
-	cd-gpios = <&pio 261 0>;
+	cd-gpios = <&pio 261 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&mt6323_vmch_reg>;
 	vqmmc-supply = <&mt6323_vio18_reg>;
 };
-- 
2.7.4
