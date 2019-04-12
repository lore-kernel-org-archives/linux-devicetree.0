From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH v2 0/2] Add support of Temperature sensor Clock for G12 SoC
Date: Fri, 12 Apr 2019 10:37:26 +0200
Message-ID: <20190412083728.21029-1-glaroque@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series add support of Clock for temperature sensor
on Amlogic G12a SoC.

Guillaume

changes since v1:
- fix .width value

Guillaume La Roque (2):
  dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
  clk: meson-g12a: Add Temperature Sensor clock

 drivers/clk/meson/g12a.c              | 31 +++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  3 ++-
 include/dt-bindings/clock/g12a-clkc.h |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.17.1
