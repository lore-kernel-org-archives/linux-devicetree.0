From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] soc: amlogic: fixup clock measure
Date: Thu,  7 Feb 2019 14:26:01 +0100
Message-ID: <20190207132603.694-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

Here are 2 fixup for the clock measure series.
First error was due to the rebase on the v2 of the bus fixup patch
Second address some comments Martin had on the initial submission

Feel free to fold these fixups with the related changes if you wish.

Jerome Brunet (2):
  arm64: dts: meson: g12a: fix clk_msr node
  soc: amlogic: clk-measure: fix-up some clock definitions

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 8 ++++----
 drivers/soc/amlogic/meson-clk-measure.c     | 8 +++++---
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.20.1
