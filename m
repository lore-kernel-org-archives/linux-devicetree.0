From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/8] ASoC: meson: add sm1 support
Date: Thu,  5 Sep 2019 14:01:12 +0200
Message-ID: <20190905120120.31752-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
List-Id: devicetree@vger.kernel.org

This patchset prepare then add the audio support on the amlogic sm1
SoC family in ASoC.

This has been tested on sei610 platform. Since this platform does
not have spdif, this patchset does not include the change necessary
to support spdif input or output on the sm1.

Jerome Brunet (8):
  ASoC: meson: add sm1 compatibles
  ASoC: meson: add reset binding
  ASoC: meson: axg-frddr: expose all 8 outputs
  ASoC: meson: axg-toddr: expose all 8 inputs
  ASoC: meson: tdmin: expose all 16 inputs
  ASoC: meson: axg-frddr: add sm1 support
  ASoC: meson: axg-toddr: add sm1 support
  ASoC: meson: tdmout: add sm1 support

 .../bindings/sound/amlogic,axg-fifo.txt       |   9 +-
 .../bindings/sound/amlogic,axg-pdm.txt        |   6 +-
 .../bindings/sound/amlogic,axg-spdifin.txt    |   6 +-
 .../bindings/sound/amlogic,axg-spdifout.txt   |   6 +-
 .../sound/amlogic,axg-tdm-formatters.txt      |   4 +-
 .../bindings/sound/amlogic,g12a-tohdmitx.txt  |   5 +-
 sound/soc/meson/axg-fifo.c                    |   2 +-
 sound/soc/meson/axg-fifo.h                    |   1 +
 sound/soc/meson/axg-frddr.c                   | 105 ++++++++++++++++--
 sound/soc/meson/axg-tdmin.c                   |  47 +++++---
 sound/soc/meson/axg-tdmout.c                  | 103 +++++++++++++----
 sound/soc/meson/axg-toddr.c                   |  83 ++++++++++++--
 12 files changed, 321 insertions(+), 56 deletions(-)

-- 
2.21.0
