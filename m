From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/3] PCI: qcom: Add support to msm8996 pcie controller.
Date: Fri,  4 Nov 2016 12:59:44 +0000
Message-ID: <1478264387-17914-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: svarbanov@mm-sol.com, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support to msm8996 pcie controller. I tested this patch on
v4.9-rc2 along with phy driver patch [1] and
"PCI: designware: check for iATU unroll support after initializing host"
fix [2] on DB820c APQ8096 board on port B and port C using sata and
ethernet controller.

Changes since v2:
	- Removed regulators that belong to phy, spotted by Stephen
	- Removed clocks in to simple pm bus driver, spotted by Stephen
	- renamed msm8996 ops to v2 ops as suggested by Stephen.
	- cleanups as suggested by Stephen.
	- Add runtime pm support to driver.
	- Added pm clk support to simple pm bus driver.

Changes since v1:
	- Fixed dt example as suggested by Rob
	- added smmu bus clk dependency as smmu sits in between
	  system NOC and PCIe.
	- Removed smmu configuration from bindings and driver as
	  the smmu Level2 translation on this SOC is controlled by
	  the secure world, and level 1 translation is disabled,
	  so there is one-to-one mapping of the address space.

Thanks,
srini

[1] https://patchwork.kernel.org/patch/9384711/
[2] https://patchwork.kernel.org/patch/9377557/

Srinivas Kandagatla (3):
  bus: simple-pm: add support to pm clocks
  PCI: qcom: add support to msm8996 PCIE controller
  PCI: qcom: add runtime pm support to pcie_port

 .../devicetree/bindings/pci/qcom,pcie.txt          |  68 +++++++-
 drivers/bus/simple-pm-bus.c                        |  13 +-
 drivers/pci/host/pcie-qcom.c                       | 183 ++++++++++++++++++++-
 3 files changed, 257 insertions(+), 7 deletions(-)

-- 
2.10.1
