From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v2 0/5] Add SATA3 support for Broadcom NS2 SVK
Date: Mon, 28 Mar 2016 10:18:25 +0530
Message-ID: <1459140510-5317-1-git-send-email-anup.patel@broadcom.com>
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
To: Kishon Vijay Abraham I <kishon@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, Jon Mason <jon.mason@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

The Broadcom NS2 SoC has a AHCI compliant SATA3 controller with
two ports.

This patchset adds common Broadcom SATA3 PHY driver and related
DT bindings document. It also adds appropriate DT nodes in NS2 DT.

The patchset is based on v4.6-rc1 tag and is available in branch
ns2_sata3_v2 of https://github.com/Broadcom/arm64-linux.git

All patches have been tested on Broadcom NS2 SVK.

Changes since v1:
 - Added ACKed by Rob for DT bindings related patches

Anup Patel (5):
  phy: Rename phy-brcmstb-sata driver to phy-brcm-sata driver
  phy: Add support for NS2 SATA3 PHY in Broadcom SATA3 PHY driver
  dt-bindings: phy: bindings document for common Broadcom SATA3 PHY
    driver
  dt-bindings: ata: add compatible string for iProc AHCI controller
  arm64: dts: Add SATA3 AHCI and SATA3 PHY DT nodes for NS2

 .../devicetree/bindings/ata/ahci-platform.txt      |   1 +
 ...brcm,brcmstb-sata-phy.txt => brcm-sata-phy.txt} |  15 +-
 arch/arm64/boot/dts/broadcom/ns2-svk.dts           |  12 +
 arch/arm64/boot/dts/broadcom/ns2.dtsi              |  43 +++
 drivers/phy/Kconfig                                |  18 +-
 drivers/phy/Makefile                               |   2 +-
 drivers/phy/phy-brcm-sata.c                        | 412 +++++++++++++++++++++
 drivers/phy/phy-brcmstb-sata.c                     | 250 -------------
 8 files changed, 487 insertions(+), 266 deletions(-)
 rename Documentation/devicetree/bindings/phy/{brcm,brcmstb-sata-phy.txt => brcm-sata-phy.txt} (69%)
 create mode 100644 drivers/phy/phy-brcm-sata.c
 delete mode 100644 drivers/phy/phy-brcmstb-sata.c

-- 
1.9.1
