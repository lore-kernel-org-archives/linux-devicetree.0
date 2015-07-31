From: <dinguyen@opensource.altera.com>
Subject: [PATCHv2 0/4] reset: socfpga: Add reset driver support for Arria10 platform
Date: Fri, 31 Jul 2015 16:03:07 -0500
Message-ID: <1438376591-22100-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de
Cc: dinh.linux@gmail.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, s.trumtrar@pengutronix.de, Dinh Nguyen <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@opensource.altera.com>

v2: For the reset driver, assume a modrst-offset of 0x10 in order to support
    legacy boards that do have the property..

v1:
This patch series adds reset driver support for the SoCFPGA Arria10 SOC. The
reset manager on the Arria10 is very similar to the one on Cyclone5/Arria5,
thus I think it's best to try to re-use the same reset driver.

The biggest difference between the reset manager on Arria10 and Cyclone is
the addition of security features. Since the driver does not support these
security features, it winds down to just a driver that will release IPs from
reset.

The other difference between Arria10 and Cyclone5 are register offsets, and
register bits for different IPs. For the register offset, the main register
offset is the very first register that is needed by the driver for releasing
IPs from reset. To handle this difference, I've introduced a new DTS property,
"altr,modrst-offset", that will represent this register.

The register bits for all the resets are in a new file:

include/dt-bindings/reset/altr,rst-mgr-a10.h

Thanks,

Dinh Nguyen (4):
  dt-bindings: Add reset manager offsets for Arria10
  ARM: socfpga: dts: add "altr,modrst-offset" property
  reset: socfpga: Update reset-socfpga to read the altr,modrst-offset
    property
  ARM: socfpga: dts: Add resets for EMACs on Arria10

 .../devicetree/bindings/reset/socfpga-reset.txt    |   2 +
 arch/arm/boot/dts/socfpga.dtsi                     |   1 +
 arch/arm/boot/dts/socfpga_arria10.dtsi             |   6 ++
 drivers/reset/reset-socfpga.c                      |  19 ++--
 include/dt-bindings/reset/altr,rst-mgr-a10.h       | 110 +++++++++++++++++++++
 5 files changed, 132 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/reset/altr,rst-mgr-a10.h

-- 
2.4.5
