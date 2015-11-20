From: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 0/4] Add QCOM DWC3 Phy support
Date: Fri, 20 Nov 2015 02:35:05 -0600
Message-ID: <1448008509-8913-1-git-send-email-agross@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This set of patches adds support for the QCOM DWC3 phys found on various
Qualcomm platforms.  The PHY portion of this set was originally part of:

https://lkml.org/lkml/2014/9/12/597

The applicable review comments were fixed and additional changes were made to
accomodate the TCSR phy mux selection required to get working ports.

Andy Gross (4):
  phy: Add Qualcomm DWC3 HS/SS PHY driver
  usb: dwc3: qcom: Configure TCSR phy mux register
  ARM: dts: qcom: Add DWC3 USB support on IPQ8064
  Documentation: usb: dwc3: qcom: Add TCSR mux usage

 .../devicetree/bindings/usb/qcom,dwc3.txt          |  11 +
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts           |  24 +
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |  89 ++++
 drivers/phy/Kconfig                                |  11 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-qcom-dwc3.c                        | 483 +++++++++++++++++++++
 drivers/usb/dwc3/dwc3-qcom.c                       |  25 ++
 7 files changed, 644 insertions(+)
 create mode 100644 drivers/phy/phy-qcom-dwc3.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
