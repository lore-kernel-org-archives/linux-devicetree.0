From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/5] Qualcomm PCIe and PCIe/PHY drivers
Date: Mon,  4 May 2015 15:39:09 +0300
Message-ID: <1430743154-10120-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hi,

Here is a v2 of the patchset. The chages since v1 are:

 - take into accoint the review comments from the inital version
 - add support for pcie IP found on Snapdragon 600 (ipq/apq8064)

Version 1 of the patchset can be found at: 

https://lkml.org/lkml/2014/12/12/557

Commenst are welcome!

-------------------------------------------------------------------------------

This patchset introduces a Qualcomm PCIe root complex driver for
Snapdragon 805 (APQ8084). It also adds a PCIe PHY driver in generic
phy framework. The PCIe hardware use Designware IP core plus
Qualcomm application specific hw.

The first two patches add a PHY driver binding document and the 
PHY driver. Patches 3/5 and 4/5 add PCIe DT document and the driver.
Last 5/5 adds APQ8084 in mach-qcom as next multiplatform Qualcomm
SoC.

Stanimir Varbanov (5):
  DT: phy: qcom: Add PCIe PHY devicetree bindings
  phy: qcom: Add Qualcomm PCIe PHY
  DT: PCI: qcom: Document PCIe devicetree bindings
  PCI: qcom: Add Qualcomm PCIe controller driver
  ARM: qcom: Add Qualcomm APQ8084 SoC

 .../devicetree/bindings/pci/qcom,pcie.txt          |  231 +++++++
 .../devicetree/bindings/phy/qcom-pcie-phy.txt      |   60 ++
 MAINTAINERS                                        |    7 +
 arch/arm/mach-qcom/Kconfig                         |    7 +
 drivers/pci/host/Kconfig                           |    9 +
 drivers/pci/host/Makefile                          |    1 +
 drivers/pci/host/pcie-qcom.c                       |  677 ++++++++++++++++++++
 drivers/phy/Kconfig                                |    9 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/phy-qcom-pcie.c                        |  291 +++++++++
 10 files changed, 1293 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie.txt
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie-phy.txt
 create mode 100644 drivers/pci/host/pcie-qcom.c
 create mode 100644 drivers/phy/phy-qcom-pcie.c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
