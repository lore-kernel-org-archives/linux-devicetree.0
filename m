From: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 0/7] Add support for IPQ8074 PCIe phy and controller
Date: Mon, 17 Jul 2017 17:33:56 +0530
Message-ID: <1500293043-1887-1-git-send-email-varada@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add definitions required to enable QMP phy support for IPQ8074.

Add support for the IPQ8074 PCIe controller.  IPQ8074 supports
Gen 1/2, one lane, two PCIe root complex with support for MSI and
legacy interrupts, and it conforms to PCI Express Base 2.1
specification.

Varadarajan Narayanan (7):
  dt-bindings: phy: qmp: Add output-clock-names
  dt-bindings: phy: qmp: Add support for QMP phy in IPQ8074
  phy: qcom-qmp: Fix phy pipe clock name
  phy: qcom-qmp: Handle unavailable registers
  phy: qcom-qmp: Add support for IPQ8074
  dt-bindings: pci: qcom: Add support for IPQ8074
  PCI: dwc: qcom: Add support for IPQ8074 PCIe controller

 .../devicetree/bindings/pci/qcom,pcie.txt          |  67 ++++++
 .../devicetree/bindings/phy/qcom-qmp-phy.txt       |  31 +++
 drivers/pci/dwc/pcie-qcom.c                        | 259 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c                | 186 +++++++++++++--
 4 files changed, 522 insertions(+), 21 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
