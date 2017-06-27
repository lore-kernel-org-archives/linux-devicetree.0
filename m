From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH v3 0/4] Add Broadcom STB USB phy driver
Date: Tue, 27 Jun 2017 10:59:09 -0400
Message-ID: <1498575553-19311-1-git-send-email-alcooperx@gmail.com>
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
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Cooper <alcooperx@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a new USB Phy driver for Broadcom STB SoCs. This driver
supports Broadcom STB ARM and MIPS SoCs. This driver in
combination with the Broadcom STB ohci, ehci and xhci
drivers will enable USB1.1, USB2.0 and USB3.0 support.
This Phy driver also supports the Broadcom UDC gadget
driver.

Changes since v2:
- Fix kbuild errors by changing Kconfig so the driver
  only builds for ARCH_BRCMSTB || BMIPS_GENERIC systems

Changes since v1:
- Rebased to next
- Add Kconfig entry to build the driver
- Commented all delays
- Split out sysfs functionality in separate patch
- Removed parsing of old obselete device tree properties
- Changed device property "device" to "dr_mode" using
  standard values "host" and "peripheral" along with new
  values "drd" and "typec-pd"
- Add ability to handle the standard PHY_TYPE_USB2 and
  PHY_TYPE_USB3 arguments passed in by phy consumers.
- Moved phy_provider_register() to end of probe routine

Al Cooper (4):
  soc: brcmstb: Add Product ID and Family ID helper functions
  dt-bindings: Add Broadcom STB USB PHY binding document
  phy: usb: phy-brcm-usb: Add Broadcom STB USB phy driver
  phy: usb: phy-brcm-usb: Add ability to force DRD mode to host or
    device

 .../bindings/phy/brcm,brcmstb-usb-phy.txt          |   42 +
 MAINTAINERS                                        |    7 +
 drivers/phy/broadcom/Kconfig                       |   12 +
 drivers/phy/broadcom/Makefile                      |    3 +
 drivers/phy/broadcom/phy-brcm-usb-init.c           | 1125 ++++++++++++++++++++
 drivers/phy/broadcom/phy-brcm-usb-init.h           |   95 ++
 drivers/phy/broadcom/phy-brcm-usb.c                |  444 ++++++++
 drivers/soc/bcm/brcmstb/common.c                   |   12 +
 include/linux/soc/brcmstb/brcmstb.h                |   10 +
 9 files changed, 1750 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.txt
 create mode 100644 drivers/phy/broadcom/phy-brcm-usb-init.c
 create mode 100644 drivers/phy/broadcom/phy-brcm-usb-init.h
 create mode 100644 drivers/phy/broadcom/phy-brcm-usb.c

-- 
1.9.0.138.g2de3478
