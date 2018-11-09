From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/4] ARM: dts: meson: set pinmux bias
Date: Fri,  9 Nov 2018 15:04:41 +0100
Message-ID: <20181109140445.17795-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Amlogic chipsets, the bias set through pinconf applies to the pad
itself, not only the GPIO function. This means that even when we change
the function of the pad from GPIO to anything else, the bias previously
set still applies.

While trying to boot from SPI, I noticed the eMMC was not working anymore.
Even if the related eMMC pad are not used by the SPI, the ROM code sets a
pull-down on the eMMC pad and leaves it that way. This breaks the eMMC
later on, in both u-boot and Linux.

The underlying issue is that we inherit whatever was left by previous user
of the pad (pinconf, u-boot or the ROM code). As a consequence, the actual
setup we get is undefined.

There is nothing mentioned in the documentation about pad bias and pinmux
function, however leaving it undefined is not an option.

This patchset consistently disable the pad bias for every pinmux functions.
It seems to work well, we can only assume that the necessary bias (if any)
is already provided by the pin function itself.

I can't really test every pinmux configuration and it is fairly possible
I missed something so it would be nice if more people could confirm if
nothing (new) is broken after applying this series.

One things could be the i2c. Usually the i2c pull-ups are physically
present on the board but, if they are missing on platform, we may define
a special pinmux setting with pull-up enabled.

One last gotcha, I recently posted fixups around bias setting to pinctrl
which have been merged: [0] [1]. These must be applied before applying this
series, otherwise when requesting 'bias-disable' you'll probably get a
pull-down instead.

Changes since v1 [2]:
 * Fix wrongly placed bias-disable on meson8

[0]: https://lkml.kernel.org/r/20181023160319.27003-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20181029151340.9087-1-jbrunet@baylibre.com
[2]: https://lkml.kernel.org/r/20181108104426.1877-1-jbrunet@baylibre.com

Jerome Brunet (4):
  arm64: dts: meson: remove extra subnode in mmc clk_gate pinmux
  arm64: dts: meson: disable pad bias for mmc pinmuxes
  arm64: dts: meson: consistently disable pin bias
  ARM: dts: meson: consistently disable pin bias

 arch/arm/boot/dts/meson8.dtsi               |  12 +++
 arch/arm/boot/dts/meson8b.dtsi              |   9 ++
 arch/arm/boot/dts/meson8m2.dtsi             |   1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 111 ++++++++++++++++++--
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi |  60 +++++++++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  |  62 +++++++++--
 6 files changed, 231 insertions(+), 24 deletions(-)

-- 
2.19.1
