From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] reset: meson: add audio arb controller
Date: Fri,  6 Jul 2018 16:31:20 +0200
Message-ID: <20180706143122.7612-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds the audio ARB controller which is necessary to
enable or disable the DDR access for the FIFOs of the audio subsystem.

Jerome Brunet (2):
  reset: meson: add dt-bindings for meson-axg audio arb
  reset: meson: add meson audio arb driver

 .../bindings/reset/amlogic,meson-axg-audio-arb.txt |  21 +++
 drivers/reset/Kconfig                              |   7 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-meson-audio-arb.c              | 168 +++++++++++++++++++++
 .../reset/amlogic,meson-axg-audio-arb.h            |  17 +++
 5 files changed, 214 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
 create mode 100644 drivers/reset/reset-meson-audio-arb.c
 create mode 100644 include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h

-- 
2.14.4
