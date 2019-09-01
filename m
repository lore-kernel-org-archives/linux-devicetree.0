From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 0/2] Add PDC Global and AOSS reset support
Date: Sun,  1 Sep 2019 23:14:05 +0530
Message-ID: <20190901174407.30756-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sboyd@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This patch series converts PDC Global and AOSS reset bindings to yaml
and adds support on SC7180 SoCs.

v3:
 * Convert to yaml bindings

v2:
 * Addressed Philipp's review comments

Sibi Sankar (2):
  dt-bindings: reset: aoss: Convert AOSS reset bindings to yaml
  dt-bindings: reset: pdc: Convert PDC Global bindings to yaml

 .../bindings/reset/qcom,aoss-reset.txt        | 52 -------------------
 .../bindings/reset/qcom,aoss-reset.yaml       | 47 +++++++++++++++++
 .../bindings/reset/qcom,pdc-global.txt        | 52 -------------------
 .../bindings/reset/qcom,pdc-global.yaml       | 47 +++++++++++++++++
 4 files changed, 94 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,aoss-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.txt
 create mode 100644 Documentation/devicetree/bindings/reset/qcom,pdc-global.yaml

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
