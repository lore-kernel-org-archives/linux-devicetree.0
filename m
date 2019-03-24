From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/2] clk: meson8b: add the video decoder clocks
Date: Sun, 24 Mar 2019 16:14:21 +0100
Message-ID: <20190324151423.19063-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: narmstrong@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, mjourdan@baylibre.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

This adds the video decoder clocks for Meson8, Meson8b and Meson8m2.

The clock tree on Meson8 differs from the one one Meson8b and Meson8m2.
Details can be found in patch #2.

There are some checkpatch warnings in patch #2:
  WARNING: please, no space before tabs
I decided to still send the patch because we have the same inconsistency
with all other clk_hw_onecell_data table entries. Please let me know if
I should come up with a follow-up patch to clean them all up.

Testing:
I have not tested this with Maxime's video decoder driver yet.
However, I manually enabled and set various frequencies for the HCODEC
clock and verified that clkmsr reports the correct rate.

Dependencies:
This is meant to be applied on top of my other series from [0]:
  clk: meson8b: add the VPU clock tree

Changes since v1 at [1]:
- collected Neil's and Maxime's Reviewed-by (thank you!)


[0] https://patchwork.kernel.org/cover/10860401/
[1] https://patchwork.kernel.org/cover/10860513/


Martin Blumenstingl (2):
  dt-bindings: clock: meson8b: export the video decoder clocks
  clk: meson: meson8b: add the video decoder clock trees

 drivers/clk/meson/meson8b.c              | 312 +++++++++++++++++++++++
 drivers/clk/meson/meson8b.h              |  17 +-
 include/dt-bindings/clock/meson8b-clkc.h |   4 +
 3 files changed, 332 insertions(+), 1 deletion(-)

-- 
2.21.0
