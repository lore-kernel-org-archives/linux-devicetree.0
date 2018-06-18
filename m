Return-Path: <SRS0=Mmip=JE=linaro.org=vinod.koul@kernel.org>
From: Vinod Koul <vinod.koul@linaro.org>
Subject: [PATCH 0/5]: input: pm8941-pwrkey: Add support for reboot reason
Date: Mon, 18 Jun 2018 20:05:43 +0530
Message-Id: <20180618143548.29900-1-vkoul@kernel.org>
To: linux-input@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
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

Vinod Koul (5):
  dt-bindings: power: reset: Add qcom pon binding
  power: reset: qcom-pon: Add Qcom PON driver
  dt-bindings: Input: Add additional property to qcom pwrkey
  input: pm8941-pwrkey: Abstract register offsets and event code
  input: pm8941-pwrkey: Add resin entry

 .../bindings/input/qcom,pm8941-pwrkey.txt          |  9 +++
 .../devicetree/bindings/power/reset/qcom,pon.txt   | 47 +++++++++++
 drivers/input/misc/pm8941-pwrkey.c                 | 64 ++++++++++++---
 drivers/power/reset/Kconfig                        |  8 ++
 drivers/power/reset/Makefile                       |  1 +
 drivers/power/reset/qcom-pon.c                     | 91 ++++++++++++++++++++++
 6 files changed, 210 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt
 create mode 100644 drivers/power/reset/qcom-pon.c

-- 
2.14.4
