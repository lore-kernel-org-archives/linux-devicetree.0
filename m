From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH v5 0/2] clk: Add Artpec-6 SoC support
Date: Thu, 31 Mar 2016 20:02:49 +0200
Message-ID: <cover.1459447089.git.larper@axis.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-kernel@vger.kernel.org, Lars Persson <larper@axis.com>
List-Id: devicetree@vger.kernel.org

Add clock support for the Artpec-6 SoC port. The ARM parts are merged in
4.6-rc1.

Changes since v4:
- Update the maintainer entry with the correct clock directory.
- Implement split clock registration with early clocks through CLK_OF_DECLARE
  and deferrable clocks through a platform driver.

Changes since v3:
- The binding was corrected to handle two fractional divider clocks as input to
  the clock controller.
- Updated clk-artpec6.c to handle a distinct fractional divider input for each
  i2s clock mux.

Changes since v2:
- Moved axis,artpec6-clkctrl.h to the first patch with the DT bindings.

Changes since v1:
- The driver now provides all clocks from the main clock controller block
  through one DT node.
- Added a header file for the clock indexes.
- Refer to clock-bindings.txt in the bindings document.

Lars Persson (2):
  clk: add device tree binding for Artpec-6 clock controller
  clk: add artpec-6 clock controller

 .../devicetree/bindings/clock/artpec6.txt          |  41 ++++
 MAINTAINERS                                        |   2 +-
 drivers/clk/Makefile                               |   1 +
 drivers/clk/axis/Makefile                          |   1 +
 drivers/clk/axis/clk-artpec6.c                     | 230 +++++++++++++++++++++
 include/dt-bindings/clock/axis,artpec6-clkctrl.h   |  38 ++++
 6 files changed, 312 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt
 create mode 100644 drivers/clk/axis/Makefile
 create mode 100644 drivers/clk/axis/clk-artpec6.c
 create mode 100644 include/dt-bindings/clock/axis,artpec6-clkctrl.h

-- 
2.1.4

