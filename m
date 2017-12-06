From: Amit Kucheria <amit.kucheria-LY4KaoCqKrnby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v11 0/6] Add support for Qualcomm A53 CPU clock
Date: Wed, 6 Dec 2017 11:21:21 +0530
Message-ID: <CAHLCerMok=-0hFLm27_VzSWzC7nArmTz+shQH05DAuBr3An9qw@mail.gmail.com>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171205154701.27730-1-georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 5, 2017 at 9:16 PM, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patchset adds support for the A53 CPU clock on MSM8916 platforms
> and allows scaling of the CPU frequency on msm8916 based platforms.

Though it currently needs some additional patches (that'll follow
soon), FWIW, Tested-by: Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> Changes since v10 (https://lkml.org/lkml/2017/12/1/577)
> * Addressed Bjorn's comments on APCS clock driver.
> * Picked Acks from Rob and Bjorn.
>
> Changes since v9 (https://lkml.org/lkml/2017/9/21/511)
> * Added the clock properties to the APCS DT node, instead of adding a subnode
> and also replaced patch "mailbox: qcom: Populate APCS child platform devices"
> with "mailbox: qcom: Create APCS child device for clock controller".
> * Dropped patch "mailbox: qcom: Move the apcs struct into a separate header",
> and use dev_get_regmap(dev->parent) in the child driver.
> * Addressed Bjorn's comments on a53-pll and apcs-clk drivers.
> * Added SPDX copyright identifiers.
>
> Changes since v8 (https://lkml.org/lkml/2017/6/23/476)
>  * Converted APCS mailbox driver to use regmap and to populate child
>  platform devices that will handle the rest of the functionality
>  provided by APCS block.
>  * Picked Rob's Ack for the PLL binding.
>  * Changed the APCS binding and put it into a separate patch.
>  * Addressed review comments.
>  * Minor changes.
>
> Changes since v7 (https://lkml.org/lkml/2016/10/31/296)
>  * Add the APCS clock controller to the APCS driver to expose both the
>  mailbox and clock controller functionality as discussed earlier:
>  https://lkml.org/lkml/2016/11/14/860
>  * Changed the a53pll compatible string as suggested by Rob.
>
> Changes since v6 (https://lkml.org/lkml/2016/9/7/347)
>  * Addressed various comments from Stephen Boyd
>
> Changes since v5 (https://lkml.org/lkml/2016/2/1/407)
>  * Rebase to clk-next and update according to the recent API changes.
>
> Changes since v4 (https://lkml.org/lkml/2015/12/14/367)
>  * Convert to builtin drivers as now __clk_lookup() is used
>
> Changes since v3 (https://lkml.org/lkml/2015/8/12/585)
>  * Split driver into two parts - and separate A53 PLL and
>    A53 clock controller drivers.
>  * Drop the safe switch hook patch. Add a clock notifier in
>    the clock provider to handle switching via safe mux and
>    divider configuration.
>
> Changes since v2 (https://lkml.org/lkml/2015/7/24/526)
>  * Drop gpll0_vote patch.
>  * Switch to the new clk_hw_* APIs.
>  * Rebase to the current clk-next.
>
> Changes since v1 (https://lkml.org/lkml/2015/6/12/193)
>  * Drop SR2 PLL patch, as it is already applied.
>  * Add gpll0_vote rate propagation patch.
>  * Update/rebase patches to the current clk-next.
>
> Georgi Djakov (6):
>   mailbox: qcom: Convert APCS IPC driver to use regmap
>   mailbox: qcom: Create APCS child device for clock controller
>   clk: qcom: Add A53 PLL support
>   clk: qcom: Add regmap mux-div clocks support
>   dt-bindings: mailbox: qcom: Document the APCS clock binding
>   clk: qcom: Add APCS clock controller support
>
>  .../devicetree/bindings/clock/qcom,a53pll.txt      |  22 ++
>  .../bindings/mailbox/qcom,apcs-kpss-global.txt     |  18 ++
>  drivers/clk/qcom/Kconfig                           |  21 ++
>  drivers/clk/qcom/Makefile                          |   3 +
>  drivers/clk/qcom/a53-pll.c                         | 110 ++++++++++
>  drivers/clk/qcom/apcs-msm8916.c                    | 149 ++++++++++++++
>  drivers/clk/qcom/clk-regmap-mux-div.c              | 229 +++++++++++++++++++++
>  drivers/clk/qcom/clk-regmap-mux-div.h              |  46 +++++
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c            |  35 +++-
>  9 files changed, 628 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>  create mode 100644 drivers/clk/qcom/a53-pll.c
>  create mode 100644 drivers/clk/qcom/apcs-msm8916.c
>  create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.c
>  create mode 100644 drivers/clk/qcom/clk-regmap-mux-div.h
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
