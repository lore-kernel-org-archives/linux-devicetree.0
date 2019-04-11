From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH 0/2] Add support of Temperature sensor Clock for G12 SoC
Date: Thu, 11 Apr 2019 10:45:35 +0200
Message-ID: <20190411084537.30299-1-glaroque@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series add support of Clock for temperature sensor
on Amlogic G12a SoC.

Guillaume

Guillaume La Roque (2):
  dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
  clk: meson-g12a: Add Temperature Sensor clock

 drivers/clk/meson/g12a.c              | 31 +++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  3 ++-
 include/dt-bindings/clock/g12a-clkc.h |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.17.1
