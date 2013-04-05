From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 0/3] clk: Exynos: Register audio subsytem clocks using common
 clk framework
Date: Fri, 05 Apr 2013 12:10:43 +0530
Message-ID: <1365144043-17101-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, thomas.abraham@linaro.org, kgene.kim@samsung.com, sangsu4u.park@samsung.com
List-Id: devicetree@vger.kernel.org

Samsung Exynos SoC has a separate subsystem for audio. This subsystem
has a internal clock controller which controls i2s0 and pcm0 clocks.
This patch series adds the Samsung Exynos SoC audio subsytem clock code
to the common clock framework and provides the I2S0 clock information in
the dtsi file.

Padmavathi Venna (3):
  clk: exynos: register audio subsystem clocks using common clock
    framework
  ARM: dts: add Exynos audio subsystem clock controller node
  ARM: dts: add clock provider information for i2s0 controller in
    Exynos5250

 arch/arm/boot/dts/exynos5250.dtsi      |    8 ++
 drivers/clk/samsung/Makefile           |    1 +
 drivers/clk/samsung/clk-exynos-audss.c |  139 ++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+), 0 deletions(-)
 create mode 100644 drivers/clk/samsung/clk-exynos-audss.c

-- 
1.7.4.4
