From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v6 0/2] Add phy support for arasan,sdhci-5.1
Date: Sat,  5 Mar 2016 10:23:53 +0800
Message-ID: <1457144633-30615-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Michal Simek <michal.simek@xilinx.com>, soren.brinkmann@xilinx.com, Rob Herring <robh+dt@kernel.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
List-Id: devicetree@vger.kernel.org


Phy is mandatory requirement for arasan,sdhci-5.1, so we introduce
generic phy support for sdhci-of-arasan.
This version is rebased on Ulf's next to make it applied cleanly.
Also, we fix some preexisting problems of err handling suggested by Adrian.


Shawn Lin (2):
  Documentation: bindings: add description of phy for sdhci-of-arasan
  mmc: sdhci-of-arasan: add phy support for sdhci-of-arasan

 .../devicetree/bindings/mmc/arasan,sdhci.txt       | 20 +++++-
 drivers/mmc/host/sdhci-of-arasan.c                 | 71 +++++++++++++++++++---
 2 files changed, 81 insertions(+), 10 deletions(-)

-- 
2.3.7


