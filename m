From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH v2 0/2] USB SS PHY for Qualcomm's QCS404
Date: Tue, 29 Jan 2019 12:35:13 +0100
Message-ID: <1548761715-4004-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, andy.gross@linaro.org, swboyd@chromium.org
Cc: shawn.guo@linaro.org, vkoul@kernel.org, bjorn.andersson@linaro.org, khasim.mohammed@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This set adds USB SS PHY support to Qualcomm's QCS404 SoC
The PHY is implemented using Synopsys SS PHY 1.0.0 IP

The code is losely based on Sriharsha Allenki's
<sallenki@codeaurora.org> original implementation.

v2:
  enable OTG mode detection
  move vdd voltage levels to driver
  use bulk_ control interfaces
  ss-phy-bindings [1]

[1] ss-phy-binding discussion:
 - qcom,dwc3-ss-usb-phy exist for a generic usb2/usb3 phy driver that
 was never merged. Rather than trying to re-use these bindings (or
 delete them) I  propose that we go ahead with the new separate
 bindings for HS and SS: if  not now - investigation  in progress- in
 the  future  it might be  possible to have again a common phy driver
 for  which these old  bindings would be the binding agreement. 
    
Jorge Ramirez-Ortiz (2):
  dt-bindings: Add Qualcomm USB Super-Speed PHY bindings
  phy: qualcomm: usb: Add Super-Speed PHY driver

 .../devicetree/bindings/usb/qcom,usb-ssphy.txt     |  73 +++++
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-usb-ss.c             | 347 +++++++++++++++++++++
 4 files changed, 432 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-ss.c

-- 
2.7.4
