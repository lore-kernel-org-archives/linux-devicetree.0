From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 0/3] arm64: dts: sdm845: Add RPMh-regulators and usb
Date: Wed, 22 Aug 2018 10:36:26 -0700
Message-ID: <20180822173629.202885-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, swboyd@chromium.org, tfiga@chromium.org, Manu Gautam <mgautam@codeaurora.org>, David Collins <collinsd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series adds device tree nodes for the RPMh regulators and USB.
These patches are based on patches in various downstream kernels from
Manu Gautam, David Collins, and Vivek Gautam.

This series was tested on SDM845-MTP (with no-AC firmware) atop
linuxnext (next-20180822) with some extra patches:

>From the mailing list:
- dts: arm64/sdm845: Add node for arm,mmu-500
  https://lkml.kernel.org/r/20180814102740.30222-3-vivek.gautam@codeaurora.org

Changes in v3:
- Don't just fix qfprom unit address, fix the reg too (Stephen).
- Rebased to next-20180822
- Set vin-supply for s4a_1p8 properly (Stephen).
- All regulators now HPM / disallow mode change; see commit text.
- Added a few extra labels for some regulators.
- Updated commit text descriptions.

Changes in v2:
- Use "0x784000" for qfprom rather than "0x780000" as per docs.
- Add calibration for 2nd USB port too
- LDO14 initial mode is LPM and shouldn't be always on (Vivek G)
- LDO25 should have min voltage of 3.3V

Douglas Anderson (2):
  arm64: dts: qcom: sdm845-mtp: Add RPMh VRM/XOB regulators
  arm64: dts: qcom: sdm845-mtp: Add nodes for USB

Manu Gautam (1):
  arm64: dts: qcom: sdm845: Add USB-related nodes

 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 382 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 196 ++++++++++++
 2 files changed, 578 insertions(+)

-- 
2.18.0.1017.ga543ac7ca45-goog
