Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v5 0/6] input: pm8941-pwrkey: Add support for reboot reason
Date: Thu, 28 Jun 2018 20:38:44 +0530
Message-Id: <20180628150850.15358-1-vkoul@kernel.org>
To: linux-input@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

To add support for reboot reason there have been some attempts [1], [2]
in past. Based on these discussions we added a new pon driver and made
pwrkey and resin as child nodes to pon.

Since the pwrkey and resin are similar, abstract pwrkey driver
and then add support for resin in the same driver.

Since the patches touch reset and input subsystems, it would be nice if
folks can ACK and we carry thru one subsystem, I would prefer that to be
input, other way would work fine too.

[1]: https://patchwork.kernel.org/patch/9751627/
[2]: https://patchwork.kernel.org/patch/10381801/

Changes in v5:
 - Make pon driver tristate

Changes in v4:
 - Add Rob's ack
 - Fix typo and description in pon binding
 - Separate out resin binding to an independent patch

Changes in v3:
 - Add Bjorn's ack
 - Make variable for event code u32

Changes in v2:
 - Add Bjorn's ack
 - Fix power binding by removing reg property
 - Use single block for parent check in pm8941-pwrkey as suggested by
   Dimitry

Vinod Koul (6):
  dt-bindings: power: reset: Add qcom pon binding
  power: reset: qcom-pon: Add Qcom PON driver
  dt-bindings: Input: Add additional property to qcom pwrkey
  input: pm8941-pwrkey: Abstract register offsets and event code
  dt-bindings: power: reset: qcom: Add resin binding
  input: pm8941-pwrkey: Add resin entry

 .../bindings/input/qcom,pm8941-pwrkey.txt          | 10 +++
 .../devicetree/bindings/power/reset/qcom,pon.txt   | 45 +++++++++++
 drivers/input/misc/pm8941-pwrkey.c                 | 69 ++++++++++++----
 drivers/power/reset/Kconfig                        | 11 +++
 drivers/power/reset/Makefile                       |  1 +
 drivers/power/reset/qcom-pon.c                     | 91 ++++++++++++++++++++++
 6 files changed, 214 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt
 create mode 100644 drivers/power/reset/qcom-pon.c

-- 
2.14.4
