From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v3 0/9] Broadcom Cygnus device tree changes
Date: Mon, 21 Sep 2015 15:12:41 -0700
Message-ID: <1442873570-20947-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series cleans up the Broadcom Cygnus device tree files and makes it
more consistent with the rest of Broadcom iProc device tree files. This patch
series also enables various peripherals on Cygnus boards. They include:

bcm11360_entphn:
NAND

bcm958300k:
touchscreen

bcm958305k:
I2C, PCIe, NAND, touchscreen

Code is based on v4.3-rc1 and is available on GITHUB:
https://github.com/Broadcom/cygnus-linux/tree/cygnus-dt-v3

Changes from V2:
 - Drop PCIe device node change that removes the I/O resource
 - Set up appropriate address range for the 'core' bus
 - Rename the 'soc' bus node to 'axi'
 - Remove incorrect 3rd compatible string 'brcm,brcmnand' in the NAND node

Chages from V1:
 - Break the major clean up change into separate patches

Ray Jui (9):
  ARM: dts: consolidate aliases for Cygnus dt files
  ARM: dts: Use label for device nodes in Cygnus dts
  ARM: dts: Put Cygnus core components under core bus
  ARM: dts: Move all Cygnus peripherals into axi bus
  ARM: dts: Reorder Cygnus peripherals
  ARM: dts: Enable various peripherals on bcm958305k
  ARM: dts: Enable NAND support on bcm911360_entphn
  ARM: dts: enable touchscreen support on Cygnus
  ARM: dts: fix Cygnus nand device node

 arch/arm/boot/dts/bcm-cygnus.dtsi      | 338 +++++++++++++++++----------------
 arch/arm/boot/dts/bcm911360_entphn.dts |  28 ++-
 arch/arm/boot/dts/bcm911360k.dts       |  10 +-
 arch/arm/boot/dts/bcm958300k.dts       |  45 ++---
 arch/arm/boot/dts/bcm958305k.dts       |  41 +++-
 arch/arm/boot/dts/bcm9hmidc.dtsi       |  42 ++++
 6 files changed, 300 insertions(+), 204 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm9hmidc.dtsi

-- 
1.9.1
