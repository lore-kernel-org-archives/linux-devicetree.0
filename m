From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v2 0/4] Add PCIe support to Broadcom iProc
Date: Thu, 11 Dec 2014 18:36:53 -0800
Message-ID: <1418351817-14898-1-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <Ray Jui <rjui@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian
 Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This patchset contains the initial PCIe support for Broadcom iProc family of
SoCs. This driver has been validated with Cygnus and NSP and is expected to
work on other iProc family of SoCs that deploy the same PCIe controller

Changes from v1:
 - Add standard PCI interrupt DT properties "#interrupt-cells",
   "interrupt-map-mask" and "interrupt-map" so legacy INTx interrupts can be
   supported by using standard PCI OF IRQ parsing function
 - Get rid of custom IRQ mapping function in the driver. Use
   of_irq_parse_and_map_pci instead

Ray Jui (4):
  pci: iProc: define Broadcom iProc PCIe binding
  PCI: iproc: Add Broadcom iProc PCIe driver
  ARM: mach-bcm: Enable PCIe support for iProc
  ARM: dts: enable PCIe for Broadcom Cygnus

 .../devicetree/bindings/pci/brcm,iproc-pcie.txt    |   74 ++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |   52 ++
 arch/arm/boot/dts/bcm958300k.dts                   |    8 +
 arch/arm/mach-bcm/Kconfig                          |    1 +
 drivers/pci/host/Kconfig                           |    9 +
 drivers/pci/host/Makefile                          |    1 +
 drivers/pci/host/pcie-iproc.c                      |  888 ++++++++++++++++++++
 7 files changed, 1033 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
 create mode 100644 drivers/pci/host/pcie-iproc.c

-- 
1.7.9.5
