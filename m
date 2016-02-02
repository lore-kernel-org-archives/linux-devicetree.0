From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 00/11] mfd: axp20x: Add support for AXP809 PMIC
Date: Tue,  2 Feb 2016 18:27:33 +0800
Message-ID: <1454408864-24112-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBM4JYK2QKGQESCX5ZBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series adds support for X-Powers' AXP809 PMIC. This is the primary
PMIC accompanying Allwinner's A80 SoC. For now, only the power button
(PEK) and regulators are supported. These are supported using existing
axp20x drivers. This is based on the AXP223 series v7.

Patch 1 adds a MAINTAINERS entry for the X-Powers AXP PMICs. I list
myself as the maintainer.

Patch 2 adds AXP809 to the axp20x bindings.

Patch 3 adds AXP809 support to the axp20x mfd driver.

Patch 4 removes voltage readout for switch outputs.

Patch 5 converts AXP20X LDO4 from using voltage tables to linear voltage
ranges. Either one works, but regulators found on later PMICs match up
with linear ranges better.

Patch 6 adds AXP809 support to the axp20x regulator driver. This patch
depends on the previous 3 patches. It's probably easier to apply them
together.

Patch 7 adds a dtsi file for AXP809.

Patch 8 enables AXP809 support on the A80 Optimus board.

Patch 9 enables AXP809 support on the Cubieboard 4.

Patch 10 disables the dummy regulators from sunxi-common-regulators.dtsi
on the A80 Optimus board. These aren't used in the board DTS anymore.

Patch 11 disables the dummy regulators from sunxi-common-regulators.dtsi,
on the Cubieboard4. These aren't used in the board DTS anymore.


Regards
ChenYu


Chen-Yu Tsai (11):
  MAINTAINERS: Add entry for X-Powers AXP family PMIC drivers
  mfd: axp20x: Add bindings for AXP809 PMIC
  mfd: axp20x: Add support for AXP809 PMIC
  regulator: axp20x: Remove voltage readout support for switch
    regulators
  regulator: axp20x: Use linear voltage ranges for AXP20X LDO4
  regulator: axp20x: support AXP809 variant
  ARM: dts: sunxi: Add dtsi file for AXP809 PMIC
  ARM: dts: sun9i: a80-optimus: Add AXP809 PMIC device node and
    regulators
  ARM: dts: sun9i: cubieboard4: Add AXP809 PMIC device node and
    regulators
  ARM: dts: sun9i: a80-optimus: Disable dummy regulators vcc3v0, vcc3v3,
    vcc5v0
  ARM: dts: sun9i: cubieboard4: Disable dummy regulators vcc3v0, vcc3v3,
    vcc5v0

 Documentation/devicetree/bindings/mfd/axp20x.txt   |  31 +++-
 MAINTAINERS                                        |   6 +
 .../dts/{sun9i-a80-cubieboard4.dts => axp809.dtsi} | 151 ++++++++++---------
 arch/arm/boot/dts/sun9i-a80-cubieboard4.dts        | 133 ++++++++++++++++-
 arch/arm/boot/dts/sun9i-a80-optimus.dts            | 133 ++++++++++++++++-
 drivers/mfd/axp20x-rsb.c                           |   1 +
 drivers/mfd/axp20x.c                               |  79 ++++++++++
 drivers/regulator/axp20x-regulator.c               | 165 ++++++++++++++-------
 include/linux/mfd/axp20x.h                         |  59 ++++++++
 9 files changed, 623 insertions(+), 135 deletions(-)
 copy arch/arm/boot/dts/{sun9i-a80-cubieboard4.dts => axp809.dtsi} (53%)

-- 
2.7.0
