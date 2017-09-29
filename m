From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/7] regulator: axp20x: Add support for
 AXP813/818 regulators
Date: Fri, 29 Sep 2017 11:25:07 +0800
Message-ID: <20170929032514.31727-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBHH2W3HAKGQEMXFDTRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series adds support for the X-Powers AXP813/818 [1] PMICs'
regulators. The series is quite straightforward. There are no compile
time dependencies between the driver patches, so each can go through
their respective (mfd and regulator) trees.

Patch 1 fixes a wrong bit offset for the AXP803 DCDC5/6 poly-phase
detection code. This code path is not exercised as we don't have any
boards that tie these two outputs together.

Patch 2 adds driver support for the AXP813 regulators. The DT binding
part was merged together with the PMIC compatible string and basic
descriptions.

Patch 3 adds a axp20x-regulator cell for AXP813, thereby enabling the
regulators.

Patch 4 adds a shared dtsi file for the PMIC. This currently contains
a list of regulator nodes, but will be expanded with Quentin's power
supply work.

Patches 5 through 7 add regulator nodes to board dts files for the A83T
boards that I have. They are not squashed together as each file has
substantial additions.

Originally my work also included enabling SDIO WiFi and Ethernet. But
the Ethernet bindings were reverted, and SDIO probing somehow didn't
work after v4.14-rc1. Everything can be found here:

    https://github.com/wens/linux/tree/a83t-regulator-wifi-eth

Please have a look and merge if everything looks OK.


Regards
ChenYu


[1] AXP813 and AXP818 are functionally identical. They have different
    labels and are bundled with different SoCs (A83T and H8), as a sort
    of product or market segmentation.


Chen-Yu Tsai (7):
  regulator: axp20x: Fix poly-phase bit offset for AXP803 DCDC5/6
  regulator: axp20x: Add support for AXP813 regulators
  mfd: axp20x: Add axp20x-regulator cell for AXP813
  ARM: dts: sunxi: Add dtsi for AXP81x PMIC
  ARM: dts: sun8i: a83t: cubietruck-plus: Add AXP818 regulator nodes
  ARM: dts: sun8i: a83t: bananapi-m3: Add AXP813 regulator nodes
  ARM: dts: sun8i: a83t: allwinner-h8homlet-v2: Add AXP818 regulator
    nodes

 .../{sun8i-a83t-bananapi-m3.dts => axp81x.dtsi}    | 157 ++++++++++-----------
 .../boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts  | 126 ++++++++++++++++-
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts       | 134 +++++++++++++++++-
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts   | 150 +++++++++++++++++++-
 drivers/mfd/axp20x.c                               |   2 +
 drivers/regulator/axp20x-regulator.c               | 104 +++++++++++++-
 include/linux/mfd/axp20x.h                         |   3 +
 7 files changed, 582 insertions(+), 94 deletions(-)
 copy arch/arm/boot/dts/{sun8i-a83t-bananapi-m3.dts => axp81x.dtsi} (52%)

-- 
2.14.2
