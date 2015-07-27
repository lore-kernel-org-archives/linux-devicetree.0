From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v1 0/7] APQ8064 dt patches.
Date: Mon, 27 Jul 2015 14:49:05 +0100
Message-ID: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

Here are some DT patches which are fixes + pmic gpio/mpp nodes for APQ8064.
I tested these patches on APQ8064 based IFC6410 board. These patches are
on top of your qcom/dt branch.

I got few more DT patches which depend on the pmic gpio and mpp dt-bindings header file,
this header file is already available in the linux-next, Should I send those patches too?
Or wait till it appears on 4.3-rc1?

Thanks,
srini


Pramod Gurav (1):
  ARM: dts: apq8064: Add DT support for GSBI6 and for UART pin mux

Srinivas Kandagatla (6):
  ARM: dts: apq8064: remove temporary fixed regulator for mmc
  ARM: dts: ifc6410: add real regulators for sdcc nodes.
  ARM: dts: qs600: Add real regulators to sdcc
  ARM: dts: apq8064: Add pm8921 mfd and its gpio node
  ARM: dts: apq8064: add pm8921 mpp support
  ARM: dts: apq8064: fix missing gsbi cell-index

 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 21 +++++++
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts  | 28 +++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi         | 91 ++++++++++++++++++++++++-----
 3 files changed, 126 insertions(+), 14 deletions(-)

-- 
1.9.1
