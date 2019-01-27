From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 0/5] ARM: dts: sun5i: q8-tablet: Complete LCD panel description
Date: Sun, 27 Jan 2019 22:48:33 +0800
Message-ID: <20190127144838.3578-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This series adds the missing bits for the LCD panel of the A13 Q8
tablets. The panel and backlight were missing their enable GPIOs.
The panel can have its power supply added as well, though it is not
a complete description. See the commit log of that patch for more
details. The backlight's power supply is the unregulator output of
the PMIC, which does not have a device tree representation.

For the Q8 tablets, the backlight GPIO is driven by a GPIO pin from
the PMIC. This needs a fix in the pwm backlight driver to avoid a
runtime warning. This will be sent separately.


Please have a look.

Regards
ChenYu

Chen-Yu Tsai (5):
  ARM: dts: sun5i: Add backlight GPIO for reference design tablet
  ARM: dts: sun5i: q8-tablet: Move panel properties to correct node
    level
  ARM: dts: sun5i: q8-tablet: Add LCD Panel enable GPIO
  ARM: dts: sun5i: q8-tablet: Add LCD Panel power supply
  ARM: dts: sun5i: q8-tablet: Use bananapi,s070wv20-ct16 panel
    compatible

 arch/arm/boot/dts/sun5i-a13-q8-tablet.dts            | 7 ++++---
 arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.20.1
