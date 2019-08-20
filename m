From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] reset: meson-audio-arb: add sm1 support
Date: Tue, 20 Aug 2019 11:46:23 +0200
Message-ID: <20190820094625.13455-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds the new arb reset lines for the sm1 SoC family

Jerome Brunet (2):
  reset: dt-bindings: meson: update arb bindings for sm1
  reset: meson-audio-arb: add sm1 support

 .../reset/amlogic,meson-axg-audio-arb.txt     |  3 +-
 drivers/reset/reset-meson-audio-arb.c         | 28 +++++++++++++++++--
 .../reset/amlogic,meson-axg-audio-arb.h       |  2 ++
 3 files changed, 29 insertions(+), 4 deletions(-)

-- 
2.21.0
