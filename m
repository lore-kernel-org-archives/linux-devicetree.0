From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/2] Add OSM L3 Interconnect Provider
Date: Wed, 21 Aug 2019 14:41:30 +0530
Message-ID: <20190821091132.14994-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, georgi.djakov@linaro.org
Cc: bjorn.andersson@linaro.org, agross@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, mark.rutland@arm.com, evgreen@chromium.org, daidavid1@codeaurora.org, saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series aims to add Operating State Manager (OSM) L3
interconnect provider support on SDM845 SoCs to handle bandwidth
requests from CPU to scale L3 caches.

v2:
 * addressed review comments from Evan
 * dropped unused gpu icc node on SDM845 SoC

Sibi Sankar (2):
  dt-bindings: interconnect: Add OSM L3 DT bindings
  interconnect: qcom: Add OSM L3 interconnect provider support

 .../bindings/interconnect/qcom,osm-l3.yaml    |  56 ++++
 drivers/interconnect/qcom/Kconfig             |   7 +
 drivers/interconnect/qcom/Makefile            |   2 +
 drivers/interconnect/qcom/osm-l3.c            | 284 ++++++++++++++++++
 .../dt-bindings/interconnect/qcom,osm-l3.h    |  12 +
 5 files changed, 361 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
 create mode 100644 drivers/interconnect/qcom/osm-l3.c
 create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
