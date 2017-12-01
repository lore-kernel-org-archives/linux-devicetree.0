From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v10 0/6] Add support for Qualcomm A53 CPU clock
Date: Fri,  1 Dec 2017 19:02:18 +0200
Message-ID: <20171201170224.25053-1-georgi.djakov@linaro.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: sboyd@codeaurora.org, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, robh@kernel.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the A53 CPU clock on MSM8916 platforms
and allows scaling of the CPU frequency on msm8916 based platforms.

Changes since v9 (https://lkml.org/lkml/2017/9/21/511)
* Added the clock properties to the APCS DT node, instead of adding a subnode
and also replaced patch "mailbox: qcom: Populate APCS child platform devices"
with "mailbox: qcom: Create APCS child device for clock controller".
* Dropped patch "mailbox: qcom: Move the apcs struct into a separate header",
and use dev_get_regmap(dev->parent) in the child driver.
* Addressed Bjorn's comments on a53-pll and apcs-clk drivers.
* Added SPDX copyright identifiers.

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


Georgi Djakov (6):
  mailbox: qcom: Convert APCS IPC driver to use regmap
  mailbox: qcom: Create APCS child device for clock controller
  clk: qcom: Add A53 PLL support
  clk: qcom: Add regmap mux-div clocks support
  dt-bindings: mailbox: qcom: Document the APCS clock binding
  clk: qcom: Add APCS clock controller support

 .../devicetree/bindings/clock/qcom,a53pll.txt      |  22 ++
 .../bindings/mailbox/qcom,apcs-kpss-global.txt     |  18 ++
 drivers/clk/qcom/Kconfig                           |  21 ++
 drivers/clk/qcom/Makefile                          |   3 +
 drivers/clk/qcom/a53-pll.c                         | 109 ++++++++++
 drivers/clk/qcom/apcs-msm8916.c                    | 149 +++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.c              | 230 +++++++++++++++++++++
 drivers/clk/qcom/clk-regmap-mux-div.h              |  47 +++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |  35 +++-
 9 files changed, 629 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
 create mode 100644 drivers/clk/qcom/a53-pll.c
 create mode 100644 drivers/clk/qcom/apcs-msm8916.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.c
 create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.h

