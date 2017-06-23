From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v8 0/3] Add support for Qualcomm A53 CPU clock
Date: Fri, 23 Jun 2017 19:15:30 +0300
Message-ID: <20170623161533.20449-1-georgi.djakov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the A53 CPU clock and allows scaling
of the CPU frequency on msm8916 based platforms.

Changes since v7 (https://lkml.org/lkml/2016/10/31/296)
 * Add the APCS clock controller to the APCS driver to expose both the
 mailbox and clock controller functionality as discussed earlier:
 https://lkml.org/lkml/2016/11/14/860
 * Changed the a53pll compatible string as suggested by Rob.

Changes since v6 (https://lkml.org/lkml/2016/9/7/347)
 * Addressed various comments from Stephen Boyd

Changes since v5 (https://lkml.org/lkml/2016/2/1/407)
 * Rebase to clk-next and update according to the recent API changes.

Changes since v4 (https://lkml.org/lkml/2015/12/14/367)
 * Convert to builtin drivers as now __clk_lookup() is used

Changes since v3 (https://lkml.org/lkml/2015/8/12/585)
 * Split driver into two parts - and separate A53 PLL and
   A53 clock controller drivers.
 * Drop the safe switch hook patch. Add a clock notifier in
   the clock provider to handle switching via safe mux and
   divider configuration.

Changes since v2 (https://lkml.org/lkml/2015/7/24/526)
 * Drop gpll0_vote patch.
 * Switch to the new clk_hw_* APIs.
 * Rebase to the current clk-next.

Changes since v1 (https://lkml.org/lkml/2015/6/12/193)
 * Drop SR2 PLL patch, as it is already applied.
 * Add gpll0_vote rate propagation patch.
 * Update/rebase patches to the current clk-next.


Georgi Djakov (3):
  clk: qcom: Add A53 PLL support
  clk: qcom: Add regmap mux-div clocks support
  mailbox: qcom: Add support for APCS clock controller

 .../devicetree/bindings/clock/qcom,a53pll.txt      |  22 ++
 .../bindings/mailbox/qcom,apcs-kpss-global.txt     |   5 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   2 +
 drivers/clk/qcom/a53-pll.c                         |  94 ++++++++
 drivers/clk/qcom/clk-regmap-mux-div.c              | 237 +++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.h              |  52 +++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            | 122 +++++++++++
 8 files changed, 543 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
 create mode 100644 drivers/clk/qcom/a53-pll.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.h

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
