From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v1 0/7] DT: APQ8064 for qcom-dt-next
Date: Tue, 28 Jul 2015 13:52:36 +0100
Message-ID: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Andy, 

As discussed here are some dt patches which depend on
pmic header "dt-bindings/pinctrl/qcom,pmic-gpio.h" which is availble in
linux-next.

One more thing we discussed w.r.t MDP patch is that it can use
something like OPPs. Which IMHO can be done at later stage as suggested by Rob.
Having this patch atleast in mainline would enable people to work on mainline
code rather than maintaining it locally. And with iommu patches people can get
a working display too :-)

Rest of the patch series is to do with power-sequence for WLAN and
an heart-beat LED for IFC6410.

Thanks,
srini

Rob Clark (1):
  ARM: dts: apq8064: Add MDP support

Srinivas Kandagatla (6):
  ARM: dts: ifc6410: Add pwrseq support for WLAN
  ARM: dts: qs600: add pwrseq support to WLAN
  ARM: dts: apq8064-ifc6410: add heart-beat led support.
  ARM: dts: ifc6410: enable MDP support
  ARM: dts: qs600: enable MDP support
  ARM: dts: ifc6410: add inforce LVDS panel support

 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts |  36 ++++++++
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts  | 122 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi         |  87 ++++++++++++++++++++
 3 files changed, 245 insertions(+)

-- 
1.9.1
