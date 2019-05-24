From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: sei510: add sound card
Date: Fri, 24 May 2019 16:03:16 +0200
Message-ID: <20190524140318.17608-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds the sound card of sei510 board.

Note #1:
The patchset (build) depends on the tohdmitx ASoC patch [0] for the dt
bindings of the tohdmitx glue. It also (run) depends on the mpll clock
series [1] to get a correct clock sources.

Note #2:
I would normaly prefer to use the HIFI pll dedicated to audio to provide
the base rate for the 48kHz audio family. HIFI pll rate precision is a
little bit better than the MPLL. However, the HIFI pll may sometimes,
rarely, take a long time to report a lock. I'm still debugging this.
In the mean time, let's use MPLL2 instead.

[0]: e35f5ad6a965 ("ASoC: meson: add tohdmitx DT bindings")
[1]: https://lkml.kernel.org/r/20190513123115.18145-1-jbrunet@baylibre.com

Jerome Brunet (1):
  arm64: dts: meson: sei510: add sound card

Maxime Jourdan (1):
  arm64: dts: meson: sei510: add max98357a DAC

 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 207 ++++++++++++++++++
 1 file changed, 207 insertions(+)

-- 
2.20.1
