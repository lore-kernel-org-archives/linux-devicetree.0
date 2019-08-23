From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/2] ASoC: meson: axg-tdm-formatter: add g12a reset
Date: Fri, 23 Aug 2019 17:44:30 +0200
Message-ID: <20190823154432.16268-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset add the possibility to provide a reset to the tdm formatter.
Such reset is available on the g12a SoC family and helps solve a random
channel output shift when using more than one output lane.

Changes since v1 [0]:
- Rebased on kevin's tree

[0]: https://lkml.kernel.org/r/20190820121551.18398-1-jbrunet@baylibre.com

Jerome Brunet (2):
  arm64: dts: meson: g12a: audio clock controller provides resets
  arm64: dts: meson: g12a: add reset to tdm formatters

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.21.0
