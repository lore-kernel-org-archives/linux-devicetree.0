From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] clk: meson: add clk-input helper
Date: Tue,  4 Dec 2018 17:58:17 +0100
Message-ID: <20181204165819.21541-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When the related bindings get merged, we will add more input clocks
to the different amlogic clock controllers. Instead of copying this
code around, lets create an helper function and use it.

Jerome Brunet (2):
  clk: meson: add clk-input helper function
  clk: meson: axg-audio: use the clk input helper function

 drivers/clk/meson/Makefile    |  2 +-
 drivers/clk/meson/axg-audio.c | 83 ++++++++++-------------------------
 drivers/clk/meson/clk-input.c | 44 +++++++++++++++++++
 drivers/clk/meson/clkc.h      |  5 +++
 4 files changed, 74 insertions(+), 60 deletions(-)
 create mode 100644 drivers/clk/meson/clk-input.c

-- 
2.19.1
