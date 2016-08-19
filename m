From: Jaedon Shin <jaedon.shin@gmail.com>
Subject: [v4 0/5] Add device nodes for BCM7xxx SoCs
Date: Fri, 19 Aug 2016 11:52:25 +0900
Message-ID: <20160819025230.31882-1-jaedon.shin@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>, Rob Herring <robh+dt@kernel.org>, MIPS Mailing List <linux-mips@linux-mips.org>, devicetree@vger.kernel.org, Jaedon Shin <jaedon.shin@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch series adds support for Broadcom BCM7xxx MIPS based SoCs.

The NAND device nodes have common file including chip select, BCH
and partitions for the reference board with the same properties.

Changes in v4:
- Fixed interrupt-controller@ at first.
- Fixed NAND properties for various boards.

Changes in v3:
- Fixed incorrect interrupt number in aon_pm_l2_intc.

Changes in v2:
- Removed status properties in always enabled GPIO nodes.
- Removed NAND nodes for v3.3 brcmnand controller.
- Renamed interrupt-controller instead of lable string.
- Renamed bcm97xxx-nand-cs1-bch8.dtsi

Jaedon Shin (5):
  MIPS: BMIPS: Add support PWM device nodes
  MIPS: BMIPS: Add support GPIO device nodes
  MIPS: BMIPS: Add support SDHCI device nodes
  MIPS: BMIPS: Add support NAND device nodes
  MIPS: BMIPS: Use interrupt-controller node name

 arch/mips/boot/dts/brcm/bcm7125.dtsi               |  34 ++++++-
 arch/mips/boot/dts/brcm/bcm7346.dtsi               |  97 +++++++++++++++++-
 arch/mips/boot/dts/brcm/bcm7358.dtsi               |  89 ++++++++++++++++-
 arch/mips/boot/dts/brcm/bcm7360.dtsi               |  89 ++++++++++++++++-
 arch/mips/boot/dts/brcm/bcm7362.dtsi               |  89 ++++++++++++++++-
 arch/mips/boot/dts/brcm/bcm7420.dtsi               |  42 +++++++-
 arch/mips/boot/dts/brcm/bcm7425.dtsi               | 109 ++++++++++++++++++++-
 arch/mips/boot/dts/brcm/bcm7435.dtsi               | 109 ++++++++++++++++++++-
 arch/mips/boot/dts/brcm/bcm97125cbmb.dts           |   4 +
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts          |  17 ++++
 arch/mips/boot/dts/brcm/bcm97358svmb.dts           |  13 +++
 arch/mips/boot/dts/brcm/bcm97360svmb.dts           |   8 ++
 arch/mips/boot/dts/brcm/bcm97362svmb.dts           |  13 +++
 arch/mips/boot/dts/brcm/bcm97420c.dts              |   8 ++
 arch/mips/boot/dts/brcm/bcm97425svmb.dts           |  21 ++++
 arch/mips/boot/dts/brcm/bcm97435svmb.dts           |  21 ++++
 .../boot/dts/brcm/bcm97xxx-nand-cs1-bch24.dtsi     |  25 +++++
 .../mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch4.dtsi |  25 +++++
 18 files changed, 775 insertions(+), 38 deletions(-)
 create mode 100644 arch/mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch24.dtsi
 create mode 100644 arch/mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch4.dtsi

-- 
2.9.3
