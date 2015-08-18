From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/6] DT: APQ8064 for qcom-dt-next
Date: Tue, 18 Aug 2015 14:04:29 +0100
Message-ID: <1439903069-19752-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Apologies for the long delay in sending new version of the patches.
Here are the new patches with fixes and dropping the MDP and panel
related changes.

Some dt patches which depend on pmic header
 "dt-bindings/pinctrl/qcom,pmic-gpio.h" which is availble in linux-next.


Changes since v1(https://lkml.org/lkml/2015/7/28/489)
 - Fixed style related errors spotted by Stephen and Bjorn
 - dropped mdp and Panel related DT, as it seems to go no where
  w.r.t cleaning up the driver.
 - Added few more patches for qs600 which are very trival.

 thanks,
 srini

Srinivas Kandagatla (6):
  ARM: dts: ifc6410: Add pwrseq support for WLAN
  ARM: dts: qs600: add pwrseq support to WLAN
  ARM: dts: apq8064-ifc6410: add notify led support.
  ARM: dts: qs600: remove unnecessary i2c pinctrl nodes in board file.
  ARM: dts: qs600: add alias to serial0
  ARM: dts: qs600: Add SD card detect support.

 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 46 +++++++++++++++++++++++--
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts  | 52 +++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 3 deletions(-)

-- 
1.9.1
