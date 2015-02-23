From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 00/12] ARM: dts: apq8064 dt patches.
Date: Mon, 23 Feb 2015 07:53:55 +0000
Message-ID: <1424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Kumar, 
Now that the rpm header file dependency is resolved, Could you
queue these dt patches for rc2.


Thanks,
srini

Nicolas Dechesne (3):
  ARM: DT: apq8064: add pci support in CM QS600
  ARM: DT: apq8064: Add usb host support to CM QS-600
  ARM: DT: apq8064: Add USB OTG support for CM QS-600

Pramod Gurav (1):
  ARM: qcom: Add DT alias for serial port

Rob Clark (1):
  ARM: dts: APQ8064: Add MDP support

Srinivas Kandagatla (7):
  ARM: dts: apq8064: add RPM regulators support
  ARM: dts: apq8064: Add usb host support.
  ARM: dts: apq8064: Add USB OTG support
  ARM: dts: apq8064: Add SATA controller support.
  ARM: dts: apq8064: Remove incorrect gsbi2 node.
  ARM: dts: Move i2c1 pinctrl to apq8064.dtsi
  ARM: dts: apq8064 add i2c3 node for panel.

 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts |  49 +++
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts  |  98 +++++-
 arch/arm/boot/dts/qcom-apq8064.dtsi         | 499 +++++++++++++++++++++++++++-
 3 files changed, 629 insertions(+), 17 deletions(-)

-- 
1.9.1
