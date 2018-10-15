From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc: Add global clock controller
 driver for QCS404
Date: Mon, 15 Oct 2018 08:27:27 -0500
Message-ID: <20181015132727.GA19377@bogus>
References: <20181010145138.17185-1-vkoul@kernel.org>
 <20181010145138.17185-3-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181010145138.17185-3-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shefali Jain <shefjain@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Anu Ramanathan <anur@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 10, 2018 at 08:21:38PM +0530, Vinod Koul wrote:
> From: Shefali Jain <shefjain@codeaurora.org>
> 
> Add the clocks supported in global clock controller which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
> 
> Signed-off-by: Shefali Jain <shefjain@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Co-developed-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> [bamse, vkoul: rebase and tidyup for upstream]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
>  drivers/clk/qcom/Kconfig                           |    8 +
>  drivers/clk/qcom/Makefile                          |    1 +
>  drivers/clk/qcom/gcc-qcs404.c                      | 2744 ++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-qcs404.h        |  165 ++
>  5 files changed, 2919 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-qcs404.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-qcs404.h

For the DT bits,

Acked-by: Rob Herring <robh@kernel.org>
