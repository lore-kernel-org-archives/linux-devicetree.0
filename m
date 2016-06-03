From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 0/2] ARM: dts: sun9i: drop sunxi-common-regulators.dtsi
Date: Fri,  3 Jun 2016 14:50:49 +0800
Message-ID: <1464936651-25911-1-git-send-email-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

These are the remaining 2 patches from the AXP809 series.

Changes since v2:

  - Drop sunxi-common-regulators.dtsi instead of disabling dummy regulators.


Regards
ChenYu

Chen-Yu Tsai (2):
  ARM: dts: sun9i: a80-optimus: Drop sunxi-common-regulators.dtsi
  ARM: dts: sun9i: cubieboard4: Drop sunxi-common-regulators.dtsi

 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts |  1 -
 arch/arm/boot/dts/sun9i-a80-optimus.dts     | 18 +++++++++++-------
 2 files changed, 11 insertions(+), 8 deletions(-)

-- 
2.8.1
