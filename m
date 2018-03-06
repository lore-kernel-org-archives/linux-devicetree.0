From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v4 0/6] Fix the overlapping registers issue for the MediTek audio system
Date: Tue, 6 Mar 2018 17:06:34 +0800
Message-ID: <cover.1520326090.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Garlic Tseng <garlic.tseng@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi,

This is the new round of the audsys. I add devm_of_platform_populate() in the clock driver
to populate the child devices (AFE) so that we can handle the dependency for all functions. 

changes since v4:
 - remove "simple-mfd" from mediatek,audsys.txt.
 - switch to use devm_of_platform_populate() to populate the child devices.
 
changes since v3:
 - Rebase to v4.16.
 - Modify clock driver for the sake of the backward compatibility.
 - Rewrite commit message of patch 4/5 to make it more specific.

changes since v2:
 - Drop useless changes in clk-mt7622-aud.c.
 - Revise binding text: 
        - Add more information about audio subsystem.
        - Separate clock node and AFE node.
 - Update license header.

changes since v1:
 - To avoid writing an MFD driver, we add "simple-mfd" in the audsys binding.
 - Move three top clocks to audio driver [1] as we remove mfd/mtk-audsys.c in 
v1.

Ryder Lee (6):
  clk: mediatek: update missing clock data for MT7622 audsys
  clk: mediatek: add devm_of_platform_populate() for MT7622 audsys
  clk: mediatek: add audsys support for MT2701
  dt-bindings: clock: mediatek: update audsys documentation to adapt MFD
    device
  dt-bindings: clock: mediatek: add audsys support for MT2701
  arm: dts: mediatek: modify audio related nodes for both MT2701 and
    MT7623

 .../bindings/arm/mediatek/mediatek,audsys.txt      |  20 ++-
 arch/arm/boot/dts/mt2701.dtsi                      | 188 ++++++++++----------
 arch/arm/boot/dts/mt7623.dtsi                      | 190 ++++++++++-----------
 drivers/clk/mediatek/Kconfig                       |   6 +
 drivers/clk/mediatek/Makefile                      |   1 +
 drivers/clk/mediatek/clk-mt2701-aud.c              | 177 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt7622-aud.c              |   9 +-
 include/dt-bindings/clock/mt7622-clk.h             |   3 +-
 8 files changed, 390 insertions(+), 204 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt2701-aud.c

-- 
1.9.1
