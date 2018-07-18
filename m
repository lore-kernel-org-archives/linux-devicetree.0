From: Douglas Anderson <dianders@chromium.org>
Subject: [RFC PATCH 0/2] clk: qcom: Quad SPI (qspi) clock support for sdm845
Date: Wed, 18 Jul 2018 11:04:28 -0700
Message-ID: <20180718180431.48580-1-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, andy.gross@linaro.org
Cc: tdas@codeaurora.org, girishm@codeaurora.org, anischal@codeaurora.org, bjorn.andersson@linaro.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


This two-series patch adds the needed clock bits to use the Quad SPI
(qspi) part on sdm845.  It's expected that the bindings part of this
patch could land in the clock tree with an immutable git hash and then
be pulled into the Qualcomm tree so it could be used by dts files.

NOTE: though I seem to have some register defines for these clocks, I
don't actually have a clock plan that includes them.  I also didn't
see any use of Quad SPI in the sdm845 Android tree I looked at.  Thus
the frequency table here is totally made up.  Specifically:
- I know that GPLL0 is running at 600 MHz and that I can have parents
  of GPLL0, GPLL0_EVEN (AKA 300 MHz), and TCXO (AKA 19.2 MHz).
- It seemed sane to add an entry in the table to come straight from
  BI_TCXO.
- From probing lines, it appears that the Quad SPI block has a divide
  by 4 somewhere inside it (probably so it can oversample the lines,
  or possibly so it can generate phase-offset clocks).  Thus we need
  the core to go 4 times faster than we'd expect to run the SPI bus.
- At least one SPI flash part I looked at supported a clock frequency
  of 104 MHz, so it semeed nice to add clocks up to ~400 MHz.

This is the first time I've tried to map Qualcomm register definition
into the clock driver, so it'd be nice if someone could double-check
and make sure I mapped all the numbers correctly.  If nothing else it
does appear to work though.


Douglas Anderson (2):
  clk: qcom: Add qspi (Quad SPI) clock defines for sdm845 to header
  clk: qcom: Add qspi (Quad SPI) clocks for sdm845

 drivers/clk/qcom/gcc-sdm845.c               | 73 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdm845.h |  3 +
 2 files changed, 76 insertions(+)

-- 
2.18.0.233.g985f88cf7e-goog
