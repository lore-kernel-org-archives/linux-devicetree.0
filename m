Return-Path: <SRS0=d0Jw=VU=linaro.org=georgi.djakov@kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v5 0/5] Add QCS404 interconnect provider driver
Date: Tue, 23 Jul 2019 17:23:34 +0300
Message-Id: <20190723142339.27772-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, georgi.djakov@linaro.org
Cc: vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add drivers to support scaling of the on-chip interconnects on QCS404-based
platforms. Also add the necessary device-tree nodes, so that the driver for
each NoC can probe and register as interconnect-provider.

The plan is to get patches 2,5 through the Qcom/ARM tree and the rest
through the interconnect tree.

v5:
- Make reg and clocks DT properties required. (Bjorn)
- Remove _clk suffix from clock names. (Bjorn)
- Use the more succinct return !!icc_smd_rpm; (Bjorn)

v4: https://lore.kernel.org/lkml/20190613151323.10850-1-georgi.djakov@linaro.org/
- Move DT headers into the dt-bindings patch (Bjorn)
- Pick Bjorn's r-b on some patches.
- Return error if platform_device_register_data() fails (Bjorn)
- Use platform_set_drvdata() only in the child device. (Bjorn)
- Hide the smd-rpm proxy driver from config menu. (Bjorn)
- Add remove() function to zero out the rpm handle. (Bjorn)
- Move move the qcs404 driver patch later in the serie. (Bjorn)
- Insert the DT nodes after rng to keep the list sorted by address. (Bjorn)

v3: https://lore.kernel.org/lkml/20190611164157.24656-1-georgi.djakov@linaro.org/
- Drop the patch introducing the qcom,qos DT property.
- Add two new patches to create an interconnect proxy device. This device is
  part of the RPM hardware and handles the communication of the bus bandwidth
  requests.
- Add a DT reg property and move the interconnect nodes under the "soc" node.

v2: https://lore.kernel.org/lkml/20190415104357.5305-1-georgi.djakov@linaro.org/
- Use the clk_bulk API. (Bjorn)
- Move the port IDs into the provider file. (Bjorn)
- Use ARRAY_SIZE in the macro to automagically count the num_links. (Bjorn)
- Improve code readability. (Bjorn)
- Add patch [4/4] introducing a qcom,qos DT property to represent the link to
  the MMIO QoS registers HW block.

v1: https://lore.kernel.org/lkml/20190405035446.31886-1-georgi.djakov@linaro.org/


Bjorn Andersson (1):
  interconnect: qcom: Add QCS404 interconnect provider driver

Georgi Djakov (4):
  dt-bindings: interconnect: Add Qualcomm QCS404 DT bindings
  soc: qcom: smd-rpm: Create RPM interconnect proxy child device
  interconnect: qcom: Add interconnect SMD over SMD driver
  arm64: dts: qcs404: Add interconnect provider DT nodes

 .../bindings/interconnect/qcom,qcs404.txt     |  45 ++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  28 +
 drivers/interconnect/qcom/Kconfig             |  12 +
 drivers/interconnect/qcom/Makefile            |   4 +
 drivers/interconnect/qcom/qcs404.c            | 539 ++++++++++++++++++
 drivers/interconnect/qcom/smd-rpm.c           |  77 +++
 drivers/interconnect/qcom/smd-rpm.h           |  15 +
 drivers/soc/qcom/smd-rpm.c                    |  17 +-
 .../dt-bindings/interconnect/qcom,qcs404.h    |  88 +++
 9 files changed, 824 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,qcs404.txt
 create mode 100644 drivers/interconnect/qcom/qcs404.c
 create mode 100644 drivers/interconnect/qcom/smd-rpm.c
 create mode 100644 drivers/interconnect/qcom/smd-rpm.h
 create mode 100644 include/dt-bindings/interconnect/qcom,qcs404.h
