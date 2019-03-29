From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/4] clk: meson: g12a audio clock controller support
Date: Fri, 29 Mar 2019 17:06:45 +0100
Message-ID: <20190329160649.31603-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset updates the axg audio controller to support the audio
controller of the g12a SoC family.

Jerome Brunet (3):
  dt-bindings: clk: axg-audio: add g12a support
  clk: meson: axg_audio: replace prefix axg by aud
  clk: meson: axg-audio: don't register inputs in the onecell data

Maxime Jourdan (1):
  clk: meson: axg-audio: add g12a support

 .../bindings/clock/amlogic,axg-audio-clkc.txt |    3 +-
 drivers/clk/meson/axg-audio.c                 | 1219 ++++++++++-------
 drivers/clk/meson/axg-audio.h                 |   36 +-
 include/dt-bindings/clock/axg-audio-clkc.h    |   10 +
 4 files changed, 736 insertions(+), 532 deletions(-)

-- 
2.20.1
