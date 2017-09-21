From: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v9 0/7] Add support for Qualcomm A53 CPU clock
Date: Thu, 21 Sep 2017 19:49:33 +0300
Message-ID: <20170921164940.20343-1-georgi.djakov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the A53 CPU clock on MSM8916 platforms
and allows scaling of the CPU frequency on msm8916 based platforms.

Changes since v8 (https://lkml.org/lkml/2017/6/23/476)
 * Converted APCS mailbox driver to use regmap and to populate child
 platform devices that will handle the rest of the functionality
 provided by APCS block.
 * Picked Rob's Ack for the PLL binding.
 * Changed the APCS binding and put it into a separate patch.
 * Addressed review comments.
 * Minor changes.

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


Georgi Djakov (7):
  mailbox: qcom: Convert APCS IPC driver to use regmap
  mailbox: qcom: Populate APCS child platform devices
  mailbox: qcom: Move the apcs struct into a separate header
  clk: qcom: Add A53 PLL support
  clk: qcom: Add regmap mux-div clocks support
  dt-bindings: clock: Document qcom,apcs binding
  clk: qcom: Add APCS clock controller support

 .../devicetree/bindings/clock/qcom,a53pll.txt      |  22 ++
 .../devicetree/bindings/clock/qcom,apcs.txt        |  27 +++
 drivers/clk/qcom/Kconfig                           |  21 ++
 drivers/clk/qcom/Makefile                          |   3 +
 drivers/clk/qcom/a53-pll.c                         | 107 ++++++++++
 drivers/clk/qcom/apcs-msm8916.c                    | 172 +++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.c              | 237 +++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.h              |  54 +++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |  36 ++--
 include/linux/mailbox/qcom-apcs.h                  |  34 +++
 10 files changed, 700 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,apcs.txt
 create mode 100644 drivers/clk/qcom/a53-pll.c
 create mode 100644 drivers/clk/qcom/apcs-msm8916.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.h
 create mode 100644 include/linux/mailbox/qcom-apcs.h

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
