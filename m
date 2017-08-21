From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 5/9] ARM64: dts: meson-gxl: libretech-cc: add card regulator settle times
Date: Mon, 21 Aug 2017 18:06:33 +0200
Message-ID: <20170821160637.22456-6-jbrunet@baylibre.com>
References: <20170821160637.22456-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170821160637.22456-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Changing the card voltage on the cc is not instantaneous, especially
when switching from 3.3v to 1.8v.

It take at least 30ms for the regulator to go from 3.3v to 1.8v. Add
margin to that to make sure we don't upset the sdcard during the voltage
switch

Fixes: 61ff2af9b278 ("ARM64: dts: fixup libretech cc definition")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 2b56f7d9be2b..0537b92cd226 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -92,6 +92,9 @@
 
 		states = <3300000 0>,
 		         <1800000 1>;
+
+		regulator-settling-time-up-us = <200>;
+		regulator-settling-time-down-us = <50000>;
 	};
 
 	vddio_boot: regulator-vddio_boot {
-- 
2.9.5
