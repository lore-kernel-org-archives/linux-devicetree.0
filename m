From: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v4 0/7] Add support for IPQ8074 PCIe phy and controller
Date: Fri, 21 Jul 2017 17:06:10 +0530
Message-ID: <1500636977-11934-1-git-send-email-varada@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

v4:
  phy: qcom-qmp: Fix phy pipe clock name
	Based on Vivek's comments, return failure only for
	PCI/USB type of phys.
	Removed Ack.

  phy: qcom-qmp: Handle unavailable registers
	Removed this patch.
	Incorrectly used a block of code that is not applicable
	to IPQ8074, hence had to avoid an "unavailable" register.
	Since that is addressed using 'has_phy_com_ctrl' this
	patch is not needed.

  phy: qcom-qmp: Add support for IPQ8074
	Set 'has_phy_com_ctrl' to false
	Remove ipq8074_pciephy_regs_layout

v3:
  PCI: dwc: qcom: Add support for IPQ8074 PCIe controller
	Incoporate Stan's feedback:-
	 - Add SoC Wrapper and Synopsys Core IP versions

v2:
  dt-bindings: phy: qmp: Add output-clock-names
	Added Rob H's Ack

  dt-bindings: phy: qmp: Add support for QMP phy in IPQ8074
	Removed example
	Added IPQ8074 specific details

  phy: qcom-qmp: Fix phy pipe clock name
	Added Vivek's Ack

  phy: qcom-qmp: Handle unavailable registers
	No changes

  phy: qcom-qmp: Add support for IPQ8074
	No changes

  PCI: dwc: qcom: Use block IP version for operations
	Added new patch to use block IP version instead of v1, v2...

  dt-bindings: pci: qcom: Add support for IPQ8074
	Removed example
	Added IPQ8074 specific details

  PCI: dwc: qcom: Add support for IPQ8074 PCIe controller
	Incorporated Bjorn's feedback:-
	 - Removed reset names, helper function to assert/deassert, helper
	   function to R/M/W register.
	 - Renamed sys_noc clock as iface clock
	 - Added deinit if phy power on fails

v1:
Add definitions required to enable QMP phy support for IPQ8074.

Add support for the IPQ8074 PCIe controller.  IPQ8074 supports
Gen 1/2, one lane, two PCIe root complex with support for MSI and
legacy interrupts, and it conforms to PCI Express Base 2.1
specification.

Varadarajan Narayanan (7):
  dt-bindings: phy: qmp: Add output-clock-names
  dt-bindings: phy: qmp: Add support for QMP phy in IPQ8074
  phy: qcom-qmp: Fix phy pipe clock name
  phy: qcom-qmp: Add support for IPQ8074
  PCI: dwc: qcom: Use block IP version for operations
  dt-bindings: pci: qcom: Add support for IPQ8074
  PCI: dwc: qcom: Add support for IPQ8074 PCIe controller

 .../devicetree/bindings/pci/qcom,pcie.txt          |  23 ++
 .../devicetree/bindings/phy/qcom-qmp-phy.txt       |  11 +
 drivers/pci/dwc/pcie-qcom.c                        | 378 +++++++++++++++++----
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 169 ++++++++-
 4 files changed, 502 insertions(+), 79 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
