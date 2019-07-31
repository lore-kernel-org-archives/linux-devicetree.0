From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH v4 00/13] Support CPU frequency scaling on QCS404
Date: Wed, 31 Jul 2019 22:29:16 +0200
Message-ID: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, sibis@codeaurora.org, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net
Cc: vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

The following patchset enables CPU frequency scaling support on the
QCS404 (with dynamic voltage scaling).

It is important to notice that this functionality will be superseded
by Core Power Reduction (CPR), a more accurate form of AVS found on
certain Qualcomm SoCs.

Some of the changes required to support CPR do conflict with the
configuration required for CPUFreq.

In particular, the following commit for CPR - already merged - will
need to be reverted in order to enable CPUFreq.

   Author: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
   Date:   Thu Jul 25 12:41:36 2019 +0200
       cpufreq: Add qcs404 to cpufreq-dt-platdev blacklist
    
Patch 8 "clk: qcom: hfpll: CLK_IGNORE_UNUSED" is a bit controversial;
in this platform, this PLL provides the clock signal to a CPU
core. But in others it might not.

We opted for the minimal ammount of changes without affecting the
default functionality: simply bypassing the COMMON_CLK_DISABLE_UNUSED
framework and letting the firwmare chose whether to enable or disable
the clock at boot. However maybe a DT property and marking the clock
as critical would be more appropriate for this PLL. we'd appreciate the
maintainer's input on this topic.

v2:
   - dts: ms8916: apcs mux/divider: new bindings
     (the driver can still support the old bindings)

   - qcs404.dtsi
     fix apcs-hfpll definition
     fix cpu_opp_table definition

   - GPLL0_AO_OUT operating frequency
     define new alpha_pll_fixed_ops to limit the operating frequency

v3:
  - qcom-apcs-ipc-mailbox
    replace goto to ease readability

  - apcs-msm8916.c
    rework patch to use of_clk_parent_fill

  - hfpll.c
    add relevant comments to the code

  - qcs404.dtsi
    add voltage scaling support

v4:
 - squash OPP definition and DVFS enablement in dts
   (patches 10 and 13 in previous version)
   
 - qcom-apcs-ipc-mailbox
   replace return condition for readability
   
 - answer one question on CLK_IGNORE_UNUSED in mailing list

Jorge Ramirez-Ortiz, Niklas Cassel (13):
  clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
  mbox: qcom: add APCS child device for QCS404
  mbox: qcom: replace integer with valid macro
  dt-bindings: mailbox: qcom: Add clock-name optional property
  clk: qcom: apcs-msm8916: get parent clock names from DT
  clk: qcom: hfpll: get parent clock names from DT
  clk: qcom: hfpll: register as clock provider
  clk: qcom: hfpll: CLK_IGNORE_UNUSED
  arm64: dts: qcom: msm8916: Add the clocks for the APCS mux/divider
  arm64: dts: qcom: qcs404: Add HFPLL node
  arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
  arm64: dts: qcom: qcs404: Add DVFS support
  arm64: defconfig: Enable HFPLL

 .../mailbox/qcom,apcs-kpss-global.txt         | 24 +++++++++--
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  3 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          | 43 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/clk/qcom/apcs-msm8916.c               | 23 ++++++++--
 drivers/clk/qcom/clk-alpha-pll.c              |  8 ++++
 drivers/clk/qcom/clk-alpha-pll.h              |  1 +
 drivers/clk/qcom/gcc-qcs404.c                 |  2 +-
 drivers/clk/qcom/hfpll.c                      | 25 ++++++++++-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       | 11 +++--
 10 files changed, 128 insertions(+), 13 deletions(-)

-- 
2.22.0
