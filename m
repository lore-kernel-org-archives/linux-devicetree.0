From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 0/3] ARM: dts: sun7i: BPI-M1+ USB support
Date: Tue, 15 Nov 2016 21:51:03 +0800
Message-ID: <20161115135106.438-1-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

These are the remaining patches of my BPI-M1+ fixes series from July.

Changes since v1:

  - Split out USB PHY enable patch.

  - Dropped custom OPP table. Tested the A20 default one with
    cpufreq-ljt-stress-test and it seemed stable.

  - Dropped voltage range for cpu supply regulator to normal 1.0V ~ 1.4V.

  - Dropped pinmux setting for OTG ID pin.


Please have a look.

Regards
ChenYu

Chen-Yu Tsai (3):
  ARM: dts: sun7i: bananapi-m1-plus: Enable USB PHY for USB host support
  ARM: dts: sun7i: bananapi-m1-plus: Add PMIC regulators
  ARM: dts: sun7i: bananapi-m1-plus: Enable USB OTG

 arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 60 ++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 4 deletions(-)

-- 
2.10.2
