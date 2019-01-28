From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/2] reset: meson: add g12a SoC support
Date: Mon, 28 Jan 2019 19:13:13 +0100
Message-ID: <20190128181316.30814-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds new dt-bindings for the reset lines of amlogic g12a SoC
and the related compatible in the driver.

Changes since v1 [0]:
* Correct patch 2 commit message.

[0]: https://lkml.kernel.org/r/20190128141330.21927-1-jbrunet@baylibre.com

Jerome Brunet (2):
  dt-bindings: reset: meson: add g12a bindings
  reset: meson: add g12a compatible string

 .../bindings/reset/amlogic,meson-reset.txt    |   7 +-
 drivers/reset/reset-meson.c                   |   1 +
 .../reset/amlogic,meson-g12a-reset.h          | 134 ++++++++++++++++++
 3 files changed, 140 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-reset.h

-- 
2.20.1
