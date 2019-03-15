From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: g12a: add secure monitor and efuse
Date: Fri, 15 Mar 2019 14:42:42 +0100
Message-ID: <20190315134244.14141-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds the secure monitor and efuse to the g12a SoC family.
These are sent together because the secure monitor is required for the
efuse driver to work properly. This is probably something the bindings
should show but it was not designed that way when the secure monitor was
introduced ... something to look at someday.

Jerome Brunet (2):
  arm64: dts: meson: g12a: add secure monitor
  arm64: dts: meson: g12a: add efuse

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.20.1
