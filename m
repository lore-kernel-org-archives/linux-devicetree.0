From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 0/4] Refactor Qualcomm RPM regulator to single platform_device
Date: Mon, 2 Mar 2015 20:25:36 -0800
Message-ID: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Stephen Boyd pointed out that the current design of the Qualcomm RPM and
regulator driver consumes 12-20kB of ram just for the platform_device structs.

This series starts with a new revision of the dt binding documentation for the
rpm regulators, it then extend the of_parse_cb callback to support changing the
constraints flags during register of a regulator, refactor the
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

Bjorn Andersson (4):
  mfd: devicetree: bindings: Add Qualcomm RPM regulator subnodes
  regulator: core: Expose init_data to of_parse_cb
  regulator: qcom: Refactor of-parsing code
  regulator: qcom: Rework to single platform device

 Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 201 +++++++++++++-
 drivers/regulator/max77686.c                       |   3 +-
 drivers/regulator/of_regulator.c                   |   2 +-
 drivers/regulator/qcom_rpm-regulator.c             | 290 ++++++++++++++-------
 include/linux/regulator/driver.h                   |   3 +-
 5 files changed, 389 insertions(+), 110 deletions(-)

-- 
1.8.2.2
