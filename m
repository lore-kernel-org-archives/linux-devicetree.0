From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/6] arm64: dts: apq8016 dt patches.
Date: Fri,  5 Feb 2016 19:00:19 +0000
Message-ID: <1454698819-13885-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Andy, 

Here are few more dt patches which enables usb and lpass.
I have tested these patches with few changes to defconfig on DB410C.

Thanks,
srini


Srinivas Kandagatla (6):
  arm64: dts: qcom: add manual pullup setting to otg.
  arm64: dts: qcom: apq8016-sbc: add usb support
  arm64: dts: qcom: add audio pinctrls
  arm64: dts: qcom: add lpass node
  arm64: dts: qcom: apq8016-sbc: enable lpass on DB410c
  arm64: dts: qcom: fix usb digital voltage levels

 arch/arm64/boot/dts/qcom/apq8016-sbc-soc-pins.dtsi |  15 ++
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi          |  39 ++++
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi         | 216 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  29 ++-
 4 files changed, 298 insertions(+), 1 deletion(-)

-- 
1.9.1
