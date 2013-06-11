From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: [PATCH 0/4] ARM: dts: OMAP3: Updates for Overo
Date: Tue, 11 Jun 2013 16:49:45 +0200
Message-ID: <1370962189-9689-1-git-send-email-florian.vaussard@epfl.ch>
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: Benoit Cousson <b-cousson@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-omap@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Florian Vaussard <florian.vaussard@epfl.ch>
List-Id: devicetree@vger.kernel.org

Hello,

This series performs several updates to omap3-overo and omap3-tobi.
Patch 1 is necessary to patch 2 for the IRQ constant. The SMSC911X is
largely taken from omap3-igep.

Regards,

Florian

Florian Vaussard (4):
  ARM: dts: OMAP3: Include IRQ header
  ARM: dts: omap3-tobi: Add SMSC911X node
  ARM: dts: omap3-tobi: Correct polarity for GPIO LED
  ARM: dts: omap3-overo: Add default trigger for TWL4030 LED

 arch/arm/boot/dts/omap3-overo.dtsi |    1 +
 arch/arm/boot/dts/omap3-tobi.dts   |   50 +++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/omap3.dtsi       |    1 +
 3 files changed, 51 insertions(+), 1 deletions(-)

-- 
1.7.5.4

