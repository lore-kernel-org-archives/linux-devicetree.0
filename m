From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC next v1 0/5] stmmac: honor the GPIO flags for the PHY reset GPIO
Date: Sun,  9 Jun 2019 20:06:16 +0200
Message-ID: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com
Cc: devicetree@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, khilman@baylibre.com, narmstrong@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Recent Amlogic SoCs (G12A which includes S905X2 and S905D2 as well as
G12B which includes S922X) use GPIOZ_14 or GPIOZ_15 for the PHY reset
line. These GPIOs are special because they are marked as "3.3V input
tolerant open drain (OD) pins" which means they can only drive the pin
output LOW (to reset the PHY) or to switch to input mode (to take the
PHY out of reset).
The GPIO subsystem already supports this with the GPIO_OPEN_DRAIN and
GPIO_OPEN_SOURCE flags in the devicetree bindings.

The goal of this series to add support for these special GPIOs in
stmmac.

Patch #2 prepares gpiolib-of for the switch from (legacy) GPIO numbers
to GPIO descriptors in stmmac. This requires the gpiolib-of to take
care of the "snps,reset-active-low" property.

Patch #3 switches stmmac from (legacy) GPIO numbers to GPIO descriptors
because this enables tracking of the GPIO flags which are passed via
devicetree. In other words: GPIO_OPEN_DRAIN and GPIO_OPEN_SOURCE are
now honored correctly, which is exactly what is needed for these
Amlogic platforms.

Patch #1 and #4 are minor cleanups which follow the boyscout rule:
"Always leave the campground cleaner than you found it."

Patch #5 is included here to show how this new functionality is used.

My test-cases were:
- X96 Max: snps,reset-gpio = <&gpio GPIOZ_15 0> with and without
           snps,reset-active-low before these patches. The PHY was
           not detected.
- X96 Max: snps,reset-gpio = <&gpio GPIOZ_15 GPIO_OPEN_SOURCE>. The
           PHY is now detected correctly
- Meson8b EC100: snps,reset-gpio = <&gpio GPIOH_4 0> with
                 snps,reset-active-low. Before and after these
                 patches the PHY is detected correctly.
- Meson8b EC100: snps,reset-gpio = <&gpio GPIOH_4 0> without
                 snps,reset-active-low. Before and after these
                 patches the PHY is not detected (this is expected
                 because we need to set the output LOW to take the
                 PHY out of reset).
- Meson8b EC100: snps,reset-gpio = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>
                 but without snps,reset-active-low. Before these
                 patches the PHY was not detected. With these patches
                 the PHY is now detected correctly.

I am sending this as RFC because I'm not very familiar with the GPIO
subsystem. What I came up with seems fine to me, but I'm not sure so
I don't want this to be applied before Linus W. is happy with it. I
am also looking for suggestions how to handle these cross-tree changes
(patch #2 belongs to the linux-gpio tree, patches #1, 3 and #4 should
go through the net-next tree. I will re-send patch #5 separately as
this should go through Kevin's linux-amlogic tree).


Martin Blumenstingl (5):
  net: stmmac: drop redundant check in stmmac_mdio_reset
  gpio: of: parse stmmac PHY reset line specific active-low property
  net: stmmac: use GPIO descriptors in stmmac_mdio_reset
  net: stmmac: use device_property_read_u32_array to read the reset
    delays
  arm64: dts: meson: g12a: x96-max: fix the Ethernet PHY reset line

 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  3 +-
 drivers/gpio/gpiolib-of.c                     |  6 +++
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 43 ++++++++-----------
 3 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.21.0
