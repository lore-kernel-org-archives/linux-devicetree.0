From: Leonid Segal <leonid.s@variscite.com>
Subject: [PATCH 0/1] arm64: dts: Add Variscite DART-SD410 Evaluation board dts
Date: Wed,  2 Aug 2017 12:46:13 +0300
Message-ID: <20170802094614.25679-1-leonid.s@variscite.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: david.brown@linaro.org, andy.gross@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Leonid Segal <leonid.s@variscite.com>
List-Id: devicetree@vger.kernel.org

Add initial device tree support for Variscite DART-SD410 Evalueation board.
This board is also known as VAR-SD410CustomBoard.

checkpatch.pl gives warnings for some lines that are over 80 characters,
but I decided not to change them since similar lines in other dts files.

Patch has been tested on 96Boards Dragonboard410c and Variscite SD410Customboard
Both Linaro Linux 17.06 release
https://discuss.96boards.org/t/linaro-linux-17-06-releases/2217


Signed-off-by: Leonid Segal <leonid.s@variscite.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/apq8016-var-dart-pmic-pins.dtsi  |  53 +++
 .../boot/dts/qcom/apq8016-var-dart-soc-pins.dtsi   |  88 ++++
 arch/arm64/boot/dts/qcom/apq8016-var-dart.dts      |  21 +
 arch/arm64/boot/dts/qcom/apq8016-var-dart.dtsi     | 525 +++++++++++++++++++++
 5 files changed, 688 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-var-dart-pmic-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-var-dart-soc-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-var-dart.dts
 create mode 100644 arch/arm64/boot/dts/qcom/apq8016-var-dart.dtsi
 
-- 
2.13.0
