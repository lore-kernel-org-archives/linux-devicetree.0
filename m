From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/8] arm64: dts: meson: g12a: add audio devices
Date: Tue, 14 May 2019 16:26:41 +0200
Message-ID: <20190514142649.1127-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds audio related devices to g12a SoC family.
It adds the clock controller as well as the memory, tdm, spdif
and pdm interfaces.

At this stage, the HDMI and internal audio DAC are still missing.

Notice the use of the pinconf DT property 'drive-strength-microamp'.
Support for this property is not yet merged in meson pinctrl driver but
the DT part as been acked by the DT maintainer [0] so it should be safe
to use.

Changes since v1: [1]
 * Had missing axg compatibles for the fifos (one last harmless change ...)
 * Fix a few underscores in node names

[0]: https://lkml.kernel.org/r/20190513152451.GA25690@bogus
[1]: https://lkml.kernel.org/r/20190514111510.23299-1-jbrunet@baylibre.com

Jerome Brunet (8):
  arm64: dts: meson: g12a: add audio clock controller
  arm64: dts: meson: g12a: add audio memory arbitrer
  arm64: dts: meson: g12a: add audio fifos
  arm64: dts: meson: g12a: add tdm
  arm64: dts: meson: g12a: add spdifouts
  arm64: dts: meson: g12a: add pdm
  arm64: dts: meson: g12a: add spdifin
  arm64: dts: meson: g12a: enable hdmi_tx sound dai provider

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1233 +++++++++++++++++--
 1 file changed, 1142 insertions(+), 91 deletions(-)

-- 
2.20.1
