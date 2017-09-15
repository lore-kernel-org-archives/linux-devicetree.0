From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/2] Support SDHCI on 8974pro devices
Date: Fri, 15 Sep 2017 16:35:22 -0700
Message-ID: <20170915233524.1375-1-bjorn.andersson@linaro.org>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Ritesh Harjani <riteshh@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The calibration clocks for the delay circut should be enabled, as done in the
downstream kernel, in order for reset of the SDHCI not to fail on some Qualcomm
platforms (e.g. 8974pro). These patches makes it possible to reference these
clocks.

Bjorn Andersson (2):
  mmc: sdhci-msm: Utilize bulk clock API
  mmc: sdhci-msm: Enable delay circuit calibration clocks

 .../devicetree/bindings/mmc/sdhci-msm.txt          |  2 +
 drivers/mmc/host/sdhci-msm.c                       | 90 +++++++++++-----------
 2 files changed, 46 insertions(+), 46 deletions(-)

-- 
2.12.0

