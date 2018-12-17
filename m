From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH 00/13] Support CPU frequency scaling on QCS404
Date: Mon, 17 Dec 2018 10:46:17 +0100
Message-ID: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com, mturquette@baylibre.com, jassisinghbrar@gmail.com
Cc: bjorn.andersson@linaro.org, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The following patchset enables CPU frequency scaling support on the
QCS404.

Patch 8 "clk: qcom: hfpll: CLK_IGNORE_UNUSED" is a bit controversial;
in this platform, this PLL provides the clock signal to a CPU
core. But in others it might not.

I opted for the minimal ammount of changes without affecting the
default functionality: simply bypassing the COMMON_CLK_DISABLE_UNUSED
framework and letting the firwmare chose whether to enable or disable
the clock at boot. However maybe a DT property and marking the clock
as critical would be more appropriate for this PLL. I'd appreciate the
maintainer's input on this topic.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Jorge Ramirez-Ortiz (13):
  clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
  mbox: qcom: add APCS child device for QCS404
  mbox: qcom: replace integer with valid macro
  dt-bindings: mailbox: qcom: Add clock-name optional property
  clk: qcom: apcs-msm8916: get parent clock names from DT
  clk: qcom: hfpll: get parent clock names from DT
  clk: qcom: hfpll: register as clock provider
  clk: qcom: hfpll: CLK_IGNORE_UNUSED
  arm64: dts: qcom: qcs404: Add OPP table
  arm64: dts: qcom: qcs404: Add HFPLL node
  arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
  arm64: dts: qcom: qcs404: Add cpufreq support
  arm64: defconfig: Enable HFPLL

 .../bindings/mailbox/qcom,apcs-kpss-global.txt     | 21 +++++++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi               | 35 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 drivers/clk/qcom/apcs-msm8916.c                    | 33 ++++++++++++++------
 drivers/clk/qcom/gcc-qcs404.c                      |  6 ++++
 drivers/clk/qcom/hfpll.c                           | 19 +++++++++++-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            | 21 ++++++++-----
 7 files changed, 118 insertions(+), 18 deletions(-)

-- 
2.7.4
