From: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
Subject: [PATCH v2 00/03] Add clock driver for Actions Semi S500 SoC
Date: Tue, 4 Sep 2018 12:34:24 -0300
Message-ID: <CADHB5bAFM=Qs6f0zf6iQuYfmT-ErSwG3-2mTsLnL-MCCUw1FhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux@armlinux.org.uk, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Guilherme_G=2E_Sim=C3=B5es?= <guilherme.simoes@lsitec.org.br>, Jon maddog Hall <jon.maddog.hall@gmail.com>, mkzuffo@lsi.usp.br, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, sboyd@kernel.org, mark.rutland@arm.com, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, Michael Turquette <mturquette@baylibre.com>, will.deacon@arm.com, thomas liau <thomas.liau@actions-semi.com>, darren@cubietech.com, robh+dt@kernel.org, jeff.chen@actions-semi.com, pn@denx.de, mp-cs@actions-semi.com, Laisa Costa - LSI-TEC <laisa.costa@lsitec.org.br>
List-Id: devicetree@vger.kernel.org

This patchset adds clock support for Actions Semi Owl series S500 SoC
with relevant clock bindings and device tree info.
Updates from v1 to v2:
SoC supports were organized in alphabetical manner.
"_DELAY" suffixes were removed.
Patch generation format changed.
Commits were rebased on top of Saravanan's patches.
Changed patches ordering.

Signed-off-by: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>

---
 arch/arm/boot/dts/owl-s500-cubieboard6.dts     |   8 +-
 arch/arm/boot/dts/owl-s500-guitar-bb-rev-b.dts |   8 +-
 arch/arm/boot/dts/owl-s500-sparky.dts          |   8 +-
 arch/arm/boot/dts/owl-s500.dtsi                |  24 ++
 drivers/clk/actions/Kconfig                    |   5 +
 drivers/clk/actions/Makefile                   |   1 +
 drivers/clk/actions/owl-pll.c                  |   2 +-
 drivers/clk/actions/owl-pll.h                  |  15 +-
 drivers/clk/actions/owl-s500.c                 | 524 +++++++++++++++++++++++++
 drivers/clk/actions/owl-s700.c                 |  18 +-
 drivers/clk/actions/owl-s900.c                 |  18 +-
 include/dt-bindings/clock/actions,s500-cmu.h   |  78 ++++
 12 files changed, 664 insertions(+), 45 deletions(-)
 create mode 100644 drivers/clk/actions/owl-s500.c
 create mode 100644 include/dt-bindings/clock/actions,s500-cmu.
