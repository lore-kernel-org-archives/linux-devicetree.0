From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] ARM: dts: meson8b: add ethernet fifo sizes
Date: Thu, 18 Jul 2019 11:36:23 +0200
Message-ID: <20190718093623.23598-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

If unspecified in DT, the fifo sizes are not automatically detected by
the dwmac1000 dma driver and the reported fifo sizes default to 0.
Because of this, flow control will be turned off on the device.

Add the fifo sizes provided by the datasheet in the SoC in DT so
flow control may be enabled if necessary.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index fba2c70c2fda..b044ad78b475 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -410,6 +410,8 @@
 		 <&clkc CLKID_MPLL2>,
 		 <&clkc CLKID_MPLL2>;
 	clock-names = "stmmaceth", "clkin0", "clkin1";
+	rx-fifo-depth = <4096>;
+	tx-fifo-depth = <2048>;
 
 	resets = <&reset RESET_ETHERNET>;
 	reset-names = "stmmaceth";
-- 
2.21.0
