From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v2 0/3] arm msm compatible+model cleanup
Date: Wed,  5 Sep 2018 20:35:14 +0200
Message-ID: <20180905183517.9390-1-niklas.cassel@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Minor arm msm compatible+model cleanup


Changes since v1:
Instead of adding compatible to msm8996.dtsi,
drop both compatible and model from msm8996.dtsi
and msm8916.dtsi, since all DTS board files that
includes these already specifies both model and
compatible themselves.

Niklas Cassel (3):
  arm64: dts: db820c: Add qcom,apq8096 to compatible string
  arm64: dts: msm8916: Drop model and compatible
  arm64: dts: msm8996: Drop model

 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi       | 3 ---
 arch/arm64/boot/dts/qcom/msm8996.dtsi       | 2 --
 3 files changed, 1 insertion(+), 6 deletions(-)

-- 
2.17.1
