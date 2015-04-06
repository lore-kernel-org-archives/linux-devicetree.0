From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v3 0/5] Refactor Qualcomm RPM regulator to single platform_device
Date: Mon, 6 Apr 2015 16:33:55 -0700
Message-ID: <1428363240-2027-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Stephen Boyd pointed out that the current design of the Qualcomm RPM and
regulator driver consumes 12-20kB of ram just for the platform_device structs.

This third iteration of the patch comes with a patch at the end to tidy up the
probe function - after the various refactorings.

Dropped from the series is the patch to add "regulator-allow-drms"; so it has a
functional dependency towards such a patch, to get drms handling running again.
But if Stephen is fine with patch 5 as answer to his concerns with patch 4 I
think we should merge this.

Changes since v2:
- Dropped unrelated drms dt property patch
- Fixed minor spelling misstake in dt binding
- Added patch to tidy up probe function

Changes since v1:
- Reworked DRMS handling to not have the driver specify the support

Bjorn Andersson (5):
  mfd: devicetree: bindings: Add Qualcomm RPM regulator subnodes
  regulator: qcom: Don't enable DRMS in driver
  regulator: qcom: Refactor of-parsing code
  regulator: qcom: Rework to single platform device
  regulator: qcom: Tidy up probe()

 Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 217 ++++++++++++++-
 drivers/regulator/qcom_rpm-regulator.c             | 290 ++++++++++++++-------
 2 files changed, 398 insertions(+), 109 deletions(-)

-- 
1.8.2.2
