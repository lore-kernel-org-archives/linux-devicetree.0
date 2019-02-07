From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH v4 0/4] USB SS PHY for Qualcomm's QCS404
Date: Thu,  7 Feb 2019 12:17:30 +0100
Message-ID: <20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, robh@kernel.org, bjorn.andersson@linaro.org
Cc: swboyd@chromium.org, andy.gross@linaro.org, shawn.guo@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

This set adds USB SS PHY support to Qualcomm's QCS404 SoC
The PHY is implemented using Synopsys' SS PHY IP

The code is losely based on Sriharsha Allenki's
<sallenki@codeaurora.org> original implementation.

v2:
  enable OTG mode detection
  move vdd voltage levels to driver
  use bulk_ control interfaces
  ss-phy-bindings [1]

v3:
  remove clk/regulator counters
  vdd constrains in device tree
  update error labels
  fix get_optional vbus
  allocate arrays statically
  fix typos in bindings

v4:
 dts:
   make compatible tag more specific to the driver
   define a connector node to contain the vbus regulator
   fix the resets definition
   fix example node
   remove unused binding (qcom-dwc3-usb-phy)
   connector: add optional property vbus-supply
 driver:
   vbus regulator is no longer optional
   
[1] ss-phy-binding discussion:
 - qcom,dwc3-ss-usb-phy exist for a generic usb2/usb3 phy driver that
 was never merged. Rather than trying to re-use these bindings I chose
 to delete them for simplicity
 

Jorge Ramirez-Ortiz (4):
  dt-bindings: phy: remove qcom-dwc3-usb-phy
  dt-bindings: connector: Add vbus-supply property
  dt-bindings: Add Qualcomm USB SuperSpeed PHY bindings
  phy: qualcomm: usb: Add SuperSpeed PHY driver

 .../bindings/connector/usb-connector.txt      |   4 +
 .../bindings/phy/qcom,snps-usb-ssphy.txt      |  79 +++++
 .../bindings/phy/qcom-dwc3-usb-phy.txt        |  37 --
 drivers/phy/qualcomm/Kconfig                  |  11 +
 drivers/phy/qualcomm/Makefile                 |   1 +
 drivers/phy/qualcomm/phy-qcom-usb-ss.c        | 322 ++++++++++++++++++
 6 files changed, 417 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-usb-ssphy.txt
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-ss.c

-- 
2.20.1
