From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 0/3] UFS: Add support for SM8150 UFS
Date: Fri,  6 Sep 2019 10:40:14 +0530
Message-ID: <20190906051017.26846-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Evan Green <evgreen@chromium.org>, Can Guo <cang@codeaurora.org>, Stanley Chu <stanley.chu@mediatek.com>, Subhash Jadavani <subhashj@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

This series adds compatible strings for ufs hc and ufs qmp phy found in
Qualcomm SM8150 SoC. Also update the qmp phy driver with version 4 and
support for ufs phy.

Changes since v1:
 - make the numbers a lower case hex
 - add review tags recieved

Vinod Koul (3):
  dt-bindings: ufs: Add sm8150 compatible string
  dt-bindings: phy-qcom-qmp: Add sm8150 UFS phy compatible string
  phy: qcom-qmp: Add SM8150 QMP UFS PHY support

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  |   7 +-
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 125 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  96 ++++++++++++++
 4 files changed, 228 insertions(+), 1 deletion(-)

-- 
2.20.1
