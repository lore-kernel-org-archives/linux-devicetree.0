From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v2 0/5] Refactor Qualcomm RPM regulator to single platform_device
Date: Wed, 1 Apr 2015 15:55:41 -0700
Message-ID: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Stephen Boyd pointed out that the current design of the Qualcomm RPM and
regulator driver consumes 12-20kB of ram just for the platform_device structs.

This series starts with a new revision of the dt binding documentation for the
rpm regulators, introduces the regulator-allow-drms property, remove the
flagging of DRMS support from the qcom-rpm regulator driver, refactor the
qcom_rpm-regulator driver to move all custom parse code to a function suitable
for usage as of_parse_cb. The final patch defines the tables of registers and
change the probe function to register the appropriate regulators based on pmic.

As Stephen pointed out in his PATCH/RFC/argument [1], this gives a more
accurate representation of input supplies, as they are now named as in the
specification.

Note that for platforms with multiple pmics (e.g. 8660 and 8974) will have
multiple regulator subnodes to the rpm node - something that will be clearer
with this binding than the previously suggested.

[1] https://lkml.org/lkml/2015/2/26/713

Changes since v1:
- Reworked DRMS handling to not have the driver specify the support

Bjorn Andersson (5):
  mfd: devicetree: bindings: Add Qualcomm RPM regulator subnodes
  regulator: Introduce property to flag drms
  regulator: qcom: Don't enable DRMS in driver
  regulator: qcom: Refactor of-parsing code
  regulator: qcom: Rework to single platform device

 Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 217 +++++++++++++++-
 .../devicetree/bindings/regulator/regulator.txt    |   1 +
 drivers/regulator/of_regulator.c                   |   3 +
 drivers/regulator/qcom_rpm-regulator.c             | 289 ++++++++++++++-------
 4 files changed, 401 insertions(+), 109 deletions(-)

-- 
1.8.2.2
