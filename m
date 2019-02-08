From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] arm64: meson: g12a: enable peripheral clock controller
Date: Fri,  8 Feb 2019 11:14:03 +0100
Message-ID: <20190208101405.25699-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

This patchset selects the required configuration flag and adds the
DT node of the main clock controller for g12a SoC family.

FYI, the configuration flag and DT bindings have been introduced by
this series [0].

[0]: https://lkml.kernel.org/r/20190201145345.6795-1-jbrunet@baylibre.com

Jerome Brunet (2):
  arm64: meson: enable g12a clock controller
  arm64: dts: meson: g12a: add peripheral clock controller

 arch/arm64/Kconfig.platforms                |  4 +++-
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 13 +++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.20.1
