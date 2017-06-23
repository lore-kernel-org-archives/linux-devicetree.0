From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3.1 2/3] ARM64: dts: meson-gx: Add SoC info register
Date: Fri, 23 Jun 2017 10:28:17 +0200
Message-ID: <1498206498-19139-3-git-send-email-narmstrong@baylibre.com>
References: <1498206498-19139-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498206498-19139-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, carlo@caione.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add node for the Amlogic Meson GX SoC information register.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 603491d..b74935e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -365,6 +365,12 @@
 				#reset-cells = <1>;
 			};
 
+			sec_AO: ao-secure@140 {
+				compatible = "amlogic,meson-gx-ao-secure", "syscon";
+				reg = <0x0 0x140 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
+
 			uart_AO: serial@4c0 {
 				compatible = "amlogic,meson-uart";
 				reg = <0x0 0x004c0 0x0 0x14>;
-- 
1.9.1
