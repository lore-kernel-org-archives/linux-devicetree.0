Return-Path: <SRS0=5rLq=SE=googlemail.com=chrysh.ng@kernel.org>
From: Christina Quast <cquast@hanoverdisplays.com>
Subject: [PATCH v2 0/6] ARM: dts: am335x: Replace numeric pinmux address with macro defines
Date: Tue,  2 Apr 2019 18:09:43 +0200
Message-Id: <20190402160949.14190-1-cquast@hanoverdisplays.com>
In-Reply-To: <20190314150524.GB19425@atomide.com>
References: <20190314150524.GB19425@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christina Quast <cquast@hanoverdisplays.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

This patchset replaces the register offsets for am335x with macro defines.
The values are extraced from the "AM335x SitaraTM Processors Technical
Reference Manual".

Updated AM33XX_IOPAD to take three instead of two parameters, to make
future changes to #pinctrl-cells easier.

For now, only the beaglebone black changes are attached.
If this patch set passes, the rest will be sent in a second patch set.

Christina Quast (6):
  ARM: dts: am33xx: Added macros for numeric pinmux addresses
  ARM: dts: am33xx: Added AM33XX_PADCONF macro
  ARM: dts: am335x: bone-common: Replaced register offsets with defines
  ARM: dts: am335x: boneblack-common: Replaced register offsets with
    defines
  ARM: dts: am335x: boneblack-wireless: Replaced register offsets with
    defines
  ARM: dts: am335x: pocketbeagle: Replaced register offsets with defines

 arch/arm/boot/dts/am335x-bone-common.dtsi     | 116 ++++++++--------
 .../arm/boot/dts/am335x-boneblack-common.dtsi |  54 ++++----
 .../boot/dts/am335x-boneblack-wireless.dts    |  28 ++--
 arch/arm/boot/dts/am335x-pocketbeagle.dts     |  56 ++++----
 include/dt-bindings/pinctrl/am33xx.h          | 130 +++++++++++++++++-
 include/dt-bindings/pinctrl/omap.h            |   1 +
 6 files changed, 257 insertions(+), 128 deletions(-)

-- 
2.20.1
