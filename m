From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/2] Add OSM L3 Interconnect Provider
Date: Wed,  7 Aug 2019 16:54:30 +0530
Message-ID: <20190807112432.26521-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, georgi.djakov@linaro.org
Cc: bjorn.andersson@linaro.org, agross@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, mark.rutland@arm.com, evgreen@chromium.org, daidavid1@codeaurora.org, saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series aims to add Operating State Manager (OSM) L3
interconnect provider support on SDM845 SoCs to handle bandwidth
requests from CPU/GPU to scale L3 caches.

Sibi Sankar (2):
  dt-bindings: interconnect: Add OSM L3 DT bindings
  interconnect: qcom: Add OSM L3 interconnect provider support

 .../bindings/interconnect/qcom,osm-l3.yaml    |  55 ++++
 drivers/interconnect/qcom/Kconfig             |   7 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/osm-l3.c            | 292 ++++++++++++++++++
 .../dt-bindings/interconnect/qcom,osm-l3.h    |  13 +
 5 files changed, 369 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
 create mode 100644 drivers/interconnect/qcom/osm-l3.c
 create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
