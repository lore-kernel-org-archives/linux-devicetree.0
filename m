From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 0/3] add Reset controller driver for Meson-AXG
Date: Fri, 10 Nov 2017 16:46:43 +0800
Message-ID: <20171110084643.30980-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patches add the Reset controller driver which found at
the Amlogic Meson-AXG SoC.

Yixun Lan (3):
  dt-bindings: reset: Add bindings for the Meson-AXG SoC Reset
    Controller
  reset: meson-axg: add compatible string for Meson-AXG SoC
  arm64: dts: meson-axg: add new reset DT node

 .../bindings/reset/amlogic,meson-reset.txt         |   3 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   6 +
 drivers/reset/reset-meson.c                        |   2 +
 .../dt-bindings/reset/amlogic,meson-axg-reset.h    | 124 +++++++++++++++++++++
 4 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-axg-reset.h

-- 
2.14.1
