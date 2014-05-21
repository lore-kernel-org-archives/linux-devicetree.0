From: Georgi Djakov <gdjakov@mm-sol.com>
Subject: [PATCH v1 0/4] Add Qualcomm APQ8084 SoC support
Date: Wed, 21 May 2014 17:57:01 +0300
Message-ID: <1400684225-21381-1-git-send-email-gdjakov@mm-sol.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sboyd@codeaurora.org, rvaswani@codeaurora.org, davidb@codeaurora.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Georgi Djakov <gdjakov@mm-sol.com>
List-Id: devicetree@vger.kernel.org

This patchset adds basic support for the Qualcomm Snapdragon 805 APQ8084 SoC.

The first two patches add device-tree files for the SoC and the board, the
second adds the board compatible string to the DT machine descriptor and the
third patch adds the low-level debug UART base address and a Kconfig entry.

Tested on APQ8084-MTP board.

Georgi Djakov (4):
  ARM: dts: qcom: Add APQ8084 SoC support
  ARM: dts: qcom: Add APQ8084-MTP board support
  ARM: qcom: Add APQ8084-MTP board to mach-qcom
  ARM: debug: qcom: Add APQ8084 DEBUG_LL UART support

 arch/arm/Kconfig.debug                 |    9 ++
 arch/arm/boot/dts/Makefile             |    3 +-
 arch/arm/boot/dts/qcom-apq8084-mtp.dts |    6 ++
 arch/arm/boot/dts/qcom-apq8084.dtsi    |  180 ++++++++++++++++++++++++++++++++
 arch/arm/include/debug/msm.S           |    5 +
 arch/arm/mach-qcom/board.c             |    1 +
 6 files changed, 203 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/qcom-apq8084-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-apq8084.dtsi

-- 
1.7.9.5
