From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/5] arm64: dts: meson: g12a: add ethernet support
Date: Mon, 20 May 2019 15:13:56 +0200
Message-ID: <20190520131401.11804-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add network support to the g12a SoC family

This is series is based on 5.2-rc1 and the patches I already sent last
week. If this is not convient for you, please let me know, I'll rebase.

Also, you will need to get the clk tag "clk-meson-5.3-1-fixes" (to get
the update MPLL50M id) from clk-meson [0].

Changes since v1: [1]
 * rebased on v5.2-rc1
 * s/eth_rmii_pins/eth_pins
 * fix MPLL50M typo

[0]: git://github.com/BayLibre/clk-meson.git
[1]: https://lkml.kernel.org/r/20190510164940.13496-1-jbrunet@baylibre.com

Jerome Brunet (5):
  arm64: dts: meson: g12a: add ethernet mac controller
  arm64: dts: meson: g12a: add ethernet pinctrl definitions
  arm64: dts: meson: g12a: add mdio multiplexer
  arm64: dts: meson: u200: add internal network
  arm64: dts: meson: sei510: add network support

 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  7 ++
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  7 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 90 +++++++++++++++++++
 3 files changed, 104 insertions(+)

-- 
2.20.1
