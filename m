From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 0/6] Qualcomm PCIe driver and designware fixes
Date: Mon, 23 Nov 2015 11:28:57 +0200
Message-ID: <cover.1448270813.git.stanimir.varbanov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set is continuation of previous v2 at [1]. This time I
decided to drop the PHY driver needed by pcie driver for apq8084
and send it separately soon (when sort out the need of separate phy
driver).

First two patches in the set are fixes in pcie designware driver
found during testing the qcom pcie driver. The second patch can
be treated as an RFC.

Next two patches adds DT binding document and the driver itself.

The last two patches just adds relevant dt node for apq8064 and
enable pcie usage on ifc6410 development board. The testing has been
made on ifc6410 development board.

Comments are welcome!

Here is edited description:

This patchset introduces a Qualcomm PCIe root complex driver for
Snapdragon 805 (APQ8084) and Snapdragon 600 (APQ8064). The PCIe
hardware use Designware IP core plus Qualcomm application
specific hw wrappers.

[1] https://lkml.org/lkml/2015/5/4/267

Stanimir Varbanov (6):
  PCI: designware: remove wrong io_base assignment
  PCI: designware: add memory barrier after enabling region
  DT: PCI: qcom: Document PCIe devicetree bindings
  PCI: qcom: Add Qualcomm PCIe controller driver
  ARM: dts: apq8064: add pcie devicetree node
  ARM: dts: ifc6410: enable pcie dt node for this board

 .../devicetree/bindings/pci/qcom,pcie.txt          |  231 ++++++++
 MAINTAINERS                                        |    7 +
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts         |   26 +
 arch/arm/boot/dts/qcom-apq8064.dtsi                |   36 ++
 drivers/pci/host/Kconfig                           |   10 +
 drivers/pci/host/Makefile                          |    1 +
 drivers/pci/host/pcie-designware.c                 |    6 +-
 drivers/pci/host/pcie-qcom.c                       |  623 ++++++++++++++++++++
 8 files changed, 939 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie.txt
 create mode 100644 drivers/pci/host/pcie-qcom.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
