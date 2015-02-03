From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: [PATCH 0/3] Add initial DT support for Qualcomm SPMI PMIC devices
Date: Tue,  3 Feb 2015 14:17:57 +0200
Message-ID: <1422965880-11047-1-git-send-email-iivanov@mm-sol.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Following set of patches add initial DT support for PMIC devices
found on recent Quqalcomm chipsets. Details for SPMI bus and PMIC arbiter
could be found here [1].

Regards,
Ivan

[1] http://lwn.net/Articles/564637/

Ivan T. Ivanov (3):
  ARM: dts: qcom: Add SPMI PMIC Arbiter nodes for APQ8084 and MSM8974
  ARM: dts: qcom: Add 8x74 chipset SPMI PMIC's nodes
  ARM: dts: qcom: Add APQ8084 chipset SPMI PMIC's nodes

 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts        |  2 ++
 arch/arm/boot/dts/qcom-apq8084-ifc6540.dts            |  1 +
 arch/arm/boot/dts/qcom-apq8084-mtp.dts                |  1 +
 arch/arm/boot/dts/qcom-apq8084.dtsi                   | 16 ++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts |  2 ++
 arch/arm/boot/dts/qcom-msm8974.dtsi                   | 16 ++++++++++++++++
 arch/arm/boot/dts/qcom-pm8841.dtsi                    | 18 ++++++++++++++++++
 arch/arm/boot/dts/qcom-pm8941.dtsi                    | 18 ++++++++++++++++++
 arch/arm/boot/dts/qcom-pma8084.dtsi                   | 18 ++++++++++++++++++
 9 files changed, 92 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-pm8841.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-pm8941.dtsi
 create mode 100644 arch/arm/boot/dts/qcom-pma8084.dtsi

--
1.9.1
