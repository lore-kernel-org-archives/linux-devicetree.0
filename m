From: Evan Green <evgreen@chromium.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sdm845: Add UFS DT nodes
Date: Wed, 17 Oct 2018 10:23:10 -0700
Message-ID: <20181017172312.194281-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: swboyd@chromium.org, dianders@chromium.org, Evan Green <evgreen@chromium.org>
List-Id: devicetree@vger.kernel.org

This series adds the DT nodes for the Universal Flash Storage controller
present on the SDM845, and activates it for the MTP reference platform.

This series applies atop the for-next branch of:
https://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git
because it needs the regulator names.

Can Guo (1):
  arm64: dts: qcom: sdm845: Add UFS nodes for sdm845-mtp

Evan Green (1):
  arm64: dts: qcom: sdm845: add UFS controller

 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 11 +++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 66 +++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

-- 
2.19.1.331.ge82ca0e54c-goog
