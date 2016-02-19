From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH v2 0/2] clk: Add Artpec-6 SoC support
Date: Fri, 19 Feb 2016 15:30:13 +0100
Message-ID: <cover.1455891890.git.larper@axis.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

Add clock support for the Artpec-6 SoC port. The ARM parts are in the series
"arm: Add Artpec-6 SoC" and it goes through the arm-soc tree.

Changes since v1:

- The driver now provides all clocks from the main clock controller block
  through one DT node.
- Added a header file for the clock indexes.
- Refer to clock-bindings.txt in the bindings document.

A platform driver was not possible because the clocks are needed earlier in the
kernel startup.

Lars Persson (2):
  clk: add device tree binding for Artpec-6 clock controller
  clk: add artpec-6 clock controller

 .../devicetree/bindings/clock/artpec6.txt          |  41 +++++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/axis/Makefile                          |   1 +
 drivers/clk/axis/clk-artpec6.c                     | 177 +++++++++++++++++++++
 include/dt-bindings/clock/axis,artpec6-clkctrl.h   |  38 +++++
 5 files changed, 258 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt
 create mode 100644 drivers/clk/axis/Makefile
 create mode 100644 drivers/clk/axis/clk-artpec6.c
 create mode 100644 include/dt-bindings/clock/axis,artpec6-clkctrl.h

-- 
2.1.4
