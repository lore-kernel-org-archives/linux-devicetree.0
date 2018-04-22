Return-Path: <SRS0=Fqr3=HL=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/3] pinctrl: meson: meson8: add the RGMII RXD2/RXD3 and TXD2/TXD3 signals
Date: Sun, 22 Apr 2018 12:53:30 +0200
Message-Id: <20180422105330.4712-4-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
References: <20180422105330.4712-1-martin.blumenstingl@googlemail.com>
To: linus.walleij@linaro.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: mark.rutland@arm.com, carlo@caione.org, khilman@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

These are only available on the Meson8m2 SoC (which uses the same
DesignWare Ethernet MAC as Meson8b).
The "eth_tx_clk_50m" signal either provides a 50MHz clock for the RMII
PHYs or the RGMII TX clock (as far as we know the frequency is
controlled by the PRG_ETHERNET registers in the Ethernet MAC "glue" IP
block).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 086082aeb796..c6d79315218f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -299,6 +299,10 @@ static const unsigned int spi_mosi_1_pins[]	= { GPIOZ_12 };
 static const unsigned int spi_miso_1_pins[]	= { GPIOZ_13 };
 static const unsigned int spi_ss2_1_pins[]	= { GPIOZ_14 };
 
+static const unsigned int eth_txd3_pins[]	= { GPIOZ_0 };
+static const unsigned int eth_txd2_pins[]	= { GPIOZ_1 };
+static const unsigned int eth_rxd3_pins[]	= { GPIOZ_2 };
+static const unsigned int eth_rxd2_pins[]	= { GPIOZ_3 };
 static const unsigned int eth_tx_clk_50m_pins[]	= { GPIOZ_4 };
 static const unsigned int eth_tx_en_pins[]	= { GPIOZ_5 };
 static const unsigned int eth_txd1_pins[]	= { GPIOZ_6 };
@@ -650,6 +654,12 @@ static struct meson_pmx_group meson8_cbus_groups[] = {
 	GROUP(eth_mdio,		6,	6),
 	GROUP(eth_mdc,		6,	5),
 
+	/* NOTE: the following four groups are only available on Meson8m2: */
+	GROUP(eth_rxd2,		6,	3),
+	GROUP(eth_rxd3,		6,	2),
+	GROUP(eth_txd2,		6,	1),
+	GROUP(eth_txd3,		6,	0),
+
 	GROUP(i2c_sda_a0,	5,	31),
 	GROUP(i2c_sck_a0,	5,	30),
 
@@ -877,7 +887,8 @@ static const char * const spi_groups[] = {
 static const char * const ethernet_groups[] = {
 	"eth_tx_clk_50m", "eth_tx_en", "eth_txd1",
 	"eth_txd0", "eth_rx_clk_in", "eth_rx_dv",
-	"eth_rxd1", "eth_rxd0", "eth_mdio", "eth_mdc"
+	"eth_rxd1", "eth_rxd0", "eth_mdio", "eth_mdc", "eth_rxd2",
+	"eth_rxd3", "eth_txd2", "eth_txd3"
 };
 
 static const char * const i2c_a_groups[] = {
-- 
2.17.0
