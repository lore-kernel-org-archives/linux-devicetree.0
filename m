From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 08/14] arm64: dts: meson-gxl: fix internal phy compatible
Date: Wed, 21 Aug 2019 16:20:37 +0200
Message-ID: <20190821142043.14649-9-narmstrong@baylibre.com>
References: <20190821142043.14649-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821142043.14649-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

This fixes the following DT schemas check errors:
meson-gxl-s805x-libretech-ac.dt.yaml: ethernet-phy@8: compatible: ['ethernet-phy-id0181.4400', 'ethernet-phy-ieee802.3-c22'] is not valid under any of the given schemas

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index ee1ecdbcc958..43eb158bee24 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -709,7 +709,7 @@
 			#size-cells = <0>;
 
 			internal_phy: ethernet-phy@8 {
-				compatible = "ethernet-phy-id0181.4400", "ethernet-phy-ieee802.3-c22";
+				compatible = "ethernet-phy-id0181.4400";
 				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <8>;
 				max-speed = <100>;
-- 
2.22.0
