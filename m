Return-Path: <SRS0=X3x8=H4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:52233 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965309AbeEIXuw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 9 May 2018 19:50:52 -0400
Received: by mail-wm0-f67.google.com with SMTP id w194-v6so1168494wmf.2
        for <devicetree@vger.kernel.org>; Wed, 09 May 2018 16:50:52 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/4] ARM: dts: meson: add support for the Meson8m2 SoC
Date: Thu, 10 May 2018 01:50:35 +0200
Message-Id: <20180509235037.5876-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
References: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org
Cc: devicetree@vger.kernel.org, balbes-150@yandex.ru, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

This adds a meson8m2.dtsi which simply inherits meson8.dtsi as both SoCs
share most peripherals.
The known differences are:
- Meson8m2's hardware video decoder additionally supports H.265 decoding
- Meson8m2 has the same Gigabit MAC as Meson8b (instead of the 10/100M
  MAC that Meson8 uses)
- Meson8m2 uses the same watchdog register layout/bits as Meson8b (using
  the Meson8 watchdog compatible leads to an infinite hang when
  rebooting the machine)
- Meson8m2 uses the same SAR ADC register layout/bits as Meson8b.
  However, it uses the temperature sensor calibration formula (and
  registers) Meson8b which differ from Meson8. This however is currently
  not supported by the meson-saradc driver yet.
- the pin controller is mostly compatible with Meson8, Meson8m2 has
  an additional function on eight pins and removes the "VGA" function.
  So there's a total of 10 pins which are slightly changed, which is why
  there's a separate compatible for the pin controller
- a separate compatible for the clock controller is used because at
  least the Mali clock tree (not supported yet) is the same as on GXBB
  while Meson8 and Meson8b have a reduced/older version of the Mali
  clock tree.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8m2.dtsi | 54 +++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 arch/arm/boot/dts/meson8m2.dtsi

diff --git a/arch/arm/boot/dts/meson8m2.dtsi b/arch/arm/boot/dts/meson8m2.dtsi
new file mode 100644
index 000000000000..3e1f92273d7b
--- /dev/null
+++ b/arch/arm/boot/dts/meson8m2.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2017 Martin Blumenstingl <martin.blumenstingl@googlemail.com>.
+ */
+
+#include "meson8.dtsi"
+
+/ {
+	model = "Amlogic Meson8m2 SoC";
+	compatible = "amlogic,meson8m2";
+}; /* end of / */
+
+&clkc {
+	compatible = "amlogic,meson8m2-clkc", "amlogic,meson8-clkc";
+};
+
+&ethmac {
+	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac";
+	reg = <0xc9410000 0x10000
+		0xc1108140 0x8>;
+	clocks = <&clkc CLKID_ETH>,
+		 <&clkc CLKID_MPLL2>,
+		 <&clkc CLKID_MPLL2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1";
+	resets = <&reset RESET_ETHERNET>;
+	reset-names = "stmmaceth";
+};
+
+&pinctrl_aobus {
+	compatible = "amlogic,meson8m2-aobus-pinctrl",
+		     "amlogic,meson8-aobus-pinctrl";
+};
+
+&pinctrl_cbus {
+	compatible = "amlogic,meson8m2-cbus-pinctrl",
+		     "amlogic,meson8-cbus-pinctrl";
+
+	eth_rgmii_pins: ethernet {
+		mux {
+			groups = "eth_tx_clk_50m", "eth_tx_en",
+				 "eth_txd3", "eth_txd2",
+				 "eth_txd1", "eth_txd0",
+				 "eth_rx_clk_in", "eth_rx_dv",
+				 "eth_rxd3", "eth_rxd2",
+				 "eth_rxd1", "eth_rxd0",
+				 "eth_mdio", "eth_mdc";
+			function = "ethernet";
+		};
+	};
+};
+
+&wdt {
+	compatible = "amlogic,meson8m2-wdt", "amlogic,meson8b-wdt";
+};
-- 
2.17.0

