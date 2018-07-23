From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 0/2] clk: qcom: Quad SPI (qspi) clock support for sdm845
Date: Mon, 23 Jul 2018 14:54:02 -0700
Message-ID: <20180723215404.74296-1-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, andy.gross@linaro.org
Cc: tdas@codeaurora.org, grahamr@codeaurora.org, girishm@codeaurora.org, anischal@codeaurora.org, bjorn.andersson@linaro.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


This two-series patch adds the needed clock bits to use the Quad SPI
(qspi) part on sdm845.  It's expected that the bindings part of this
patch could land in the clock tree with an immutable git hash and then
be pulled into the Qualcomm tree so it could be used by dts files.

>From the reply to my v1, the clock plan for this clock is:
- MinSVS@19.2
- LowSVS@75
- SVS@150
- Nominal@300
...and intermediate frequencies can be used at frequences less than
300.  I didn't see a need for 75 MHz and it was unclear from previous
replies if this should come from MAIN or EVEN so I left it out.  I
have added 100 MHz here since it is useful (/ 4 = 25 MHz is a useful
clock for SPI flash)

OTHER NOTES:
- From probing lines, it appears that the Quad SPI block has a divide
  by 4 somewhere inside it (probably so it can oversample the lines,
  or possibly so it can generate phase-offset clocks).  Thus we need
  the core to go 4 times faster than we'd expect to run the SPI bus.
- SPI devices usually specify the MAX frequency they should be clocked
  at, so it's important that we use the clk_rcg2_floor_ops here rather
  than the clk_rcg2_ops

Changes in v2:
- Only 19.2, 100, 150, and 300 MHz now.
- All clocks come from MAIN rather than EVEN.
- Use parent map 0 instead of new parent map 9.

Douglas Anderson (2):
  clk: qcom: Add qspi (Quad SPI) clock defines for sdm845 to header
  clk: qcom: Add qspi (Quad SPI) clocks for sdm845

 drivers/clk/qcom/gcc-sdm845.c               | 63 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdm845.h |  3 +
 2 files changed, 66 insertions(+)

-- 
2.18.0.233.g985f88cf7e-goog
