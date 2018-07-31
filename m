Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v6 0/3] input: pm8941-pwrkey: Add support for reboot reason
Date: Tue, 31 Jul 2018 10:18:04 +0530
Message-Id: <20180731044807.16878-1-vkoul@kernel.org>
To: linux-input@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

To add support for reboot reason there have been some attempts [1], [2]
in past. Based on these discussions we added a new pon driver and made
pwrkey and resin as child nodes to pon.

Since the pwrkey and resin are similar, abstract pwrkey driver
and then add support for resin in the same driver.

[1]: https://patchwork.kernel.org/patch/9751627/
[2]: https://patchwork.kernel.org/patch/10381801/

Changes in v6:
 - Drop power changes merged thru reset tree
 - Rebase on input-next

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

Vinod Koul (3):
  dt-bindings: Input: Add additional property to qcom pwrkey
  input: pm8941-pwrkey: Abstract register offsets and event code
  input: pm8941-pwrkey: Add resin entry

 .../bindings/input/qcom,pm8941-pwrkey.txt          |  9 +++
 drivers/input/misc/pm8941-pwrkey.c                 | 69 ++++++++++++++++++----
 2 files changed, 65 insertions(+), 13 deletions(-)

-- 
2.14.4
