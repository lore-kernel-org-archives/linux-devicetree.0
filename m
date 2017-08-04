From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/6] ARM64: dts: meson-gxbb: nanopi-k2: add card regulator settle times
Date: Fri,  4 Aug 2017 20:08:11 +0200
Message-ID: <20170804180816.18737-2-jbrunet@baylibre.com>
References: <20170804180816.18737-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170804180816.18737-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Changing the card voltage on the nanopi-k2 is not instantaneous,
especially when switching from 3.3v to 1.8v.

It take at least 3ms for the regulator to go from 3.3v to 1.8v. Add
margin to that to make sure we don't upset the sdcard during the voltage
switch

Fixes: 9bc7ffb08daf ("arm64: dts: amlogic: Add NanoPi K2")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index fa462831ccaf..6b7495dc6014 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -107,6 +107,9 @@
 
 		states = <3300000 0>,
 		         <1800000 1>;
+
+		regulator-settling-time-up-us = <100>;
+		regulator-settling-time-down-us = <5000>;
 	};
 
 	wifi_32k: wifi-32k {
-- 
2.9.4
