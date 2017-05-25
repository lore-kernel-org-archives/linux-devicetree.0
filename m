From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/2] Add PCIe phy driver for some Mediatek SoCs
Date: Thu, 25 May 2017 12:36:01 +0800
Message-ID: <1495686963-50071-1-git-send-email-ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This patch series add PCIe phy driver and related dt-binding file for
Mediatek SoCs.

The PICe host driver has been applied to pci/host-mediatek for v4.13.

Changes since v3:
- rename both the driver and the binding document to make it more generic
  so that we could reuse the driver if needed in the future.
- correct some anotations.

Changes since v2:
- rebase to v4.12-rc1

Changes since v1:
- revise binding document:
  drop 'status' properties.
  add a description to 'phy-switch' property and add vendor prefix.

Ryder Lee (2):
  phy: add PCIe PHY driver for Mediatek SoCs
  dt-bindings: phy: Add documentation for Mediatek PCIe PHY

 .../devicetree/bindings/phy/phy-mediatek-pcie.txt  |  64 +++++
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-mediatek-pcie.c                    | 290 +++++++++++++++++++++
 4 files changed, 363 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-mediatek-pcie.txt
 create mode 100644 drivers/phy/phy-mediatek-pcie.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
