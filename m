From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 0/4] Teach phylib hard-resetting devices
Date: Mon,  4 Dec 2017 11:34:48 +0100
Message-ID: <1512383692-14009-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Richard Leitner <richard.leitner@skidata.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

	Hi David, Andrew, Florian, Simon, Magnus,

This patch series adds optional PHY reset support to phylib.

The first two patches are destined for David's net-next tree. They add
core PHY reset code, and update a driver that currently uses its own
reset code.

The last two patches are destined for Simon's renesas tree.  They add
properties to describe the EthernetAVB PHY reset topology to the common
Salvator-X/XS and ULCB DTS files, which solves two issues:
  1. On Salvator-XS, the enable pin of the regulator providing PHY power
     is connected to PRESETn, and PSCI powers down the SoC during system
     suspend.  Hence a PHY reset is needed to restore network
     functionality after system resume.
  2. Linux should not rely on the boot loader having reset the PHY, but
     should reset the PHY during driver probe.

Changes compared to v3:
  - Remove Florian's Acked-by,
  - Add missing #include <linux/gpio/consumer.h>,
  - Re-add the gpiod check, as the dummy gpiod_set_value() for !GPIOLIB
    does not ignore NULL, and calls WARN_ON(1),
  - Do not reassert the reset signal if {mdio,phy}_probe() or
    phy_device_register() succeeded, as that may destroy initial setup,
  - Do not deassert the reset signal in {mdio,phy}_remove(), as it
    should already be deasserted,
  - Bring the PHY back into reset state in phy_device_remove(),
  - Move/consolidate GPIO descriptor acquiring code from
    of_mdiobus_register_phy() and of_mdiobus_register_device() to
    mdiobus_register_device().
    Note that this changes behavior slightly, in that the reset signal
    is now also asserted when called from of_mdiobus_register_device().
  - Add Reviewed-by,

Changes compared to v2, as sent by Sergei Shtylyov:
  - Fix fwnode_get_named_gpiod() call due to added parameters (which
    allowed to eliminate the gpiod_direction_output() call),
  - Rebased, refreshed, reworded,
  - Take over from Sergei,
  - Add Acked-by,
  - Remove unneeded gpiod check, as gpiod_set_value() handles NULL fine,
  - Handle fwnode_get_named_gpiod() errors correctly:
      - -ENOENT is ignored (the GPIO is optional), and turned into NULL,
	which allowed to remove all later !IS_ERR() checks,
      - Other errors (incl. -EPROBE_DEFER) are propagated,
  - Extract DTS patches from series "[PATCH 0/4] ravb: Add PHY reset
    support" (https://www.spinics.net/lists/netdev/msg457308.html), and
    incorporate in this series, after moving reset-gpios from the
    ethernet to the ethernet-phy node.

Given (1) the new reset-gpios DT property in the PHY node follows
established practises, (2) the DT binding change in the first patch has
been acked by Rob, and (3) the DTS patch does not cause any regressions
if it is applied before the PHY driver patches, the DTS patches can be
applied independently.

Thanks!

Geert Uytterhoeven (2):
  arm64: dts: renesas: salvator-common: Add EthernetAVB PHY reset
  arm64: dts: renesas: ulcb: Add EthernetAVB PHY reset

Sergei Shtylyov (2):
  phylib: Add device reset GPIO support
  macb: Kill PHY reset code

 Documentation/devicetree/bindings/net/phy.txt    |  2 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi |  1 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi            |  1 +
 drivers/net/ethernet/cadence/macb.h              |  1 -
 drivers/net/ethernet/cadence/macb_main.c         | 21 ----------------
 drivers/net/phy/at803x.c                         | 18 +++----------
 drivers/net/phy/mdio_bus.c                       | 21 ++++++++++++++++
 drivers/net/phy/mdio_device.c                    | 25 ++++++++++++++++--
 drivers/net/phy/phy_device.c                     | 32 ++++++++++++++++++++++--
 include/linux/mdio.h                             |  3 +++
 include/linux/phy.h                              |  5 ++++
 11 files changed, 89 insertions(+), 41 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
