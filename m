From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/3] arm64: dts: meson-axg: add spdif input
Date: Thu, 13 Dec 2018 15:36:28 +0100
Message-ID: <20181213143631.19218-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds spdif input support to the axg SoC family and the
s400 reference design.

Kevin, ASoC support for this spdif input (including the binding doc) just
got merged in the ASoC tree [0]. Until the related patches hit mainline,
you may get a warning about using undocumented bindings.

[0]: https://lkml.kernel.org/r/20181213120843.876CB11254D1@debutante.sirena.org.uk

Jerome Brunet (3):
  arm64: dts: meson-axg: add spdifin
  arm64: dts: meson-axg: s400: add spdif-dir codec
  arm64: dts: meson-axg: s400: add spdifin to the sound card

 .../arm64/boot/dts/amlogic/meson-axg-s400.dts | 24 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 12 ++++++++++
 2 files changed, 36 insertions(+)

-- 
2.19.2
