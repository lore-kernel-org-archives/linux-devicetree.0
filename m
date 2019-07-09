Return-Path: <robherring2@gmail.com>
Date: Mon, 8 Jul 2019 19:56:46 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add global clock controller driver
 for SM8150
Message-ID: <20190709015646.GA30394@bogus>
References: <20190607101234.30449-1-vkoul@kernel.org>
 <20190607101234.30449-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607101234.30449-2-vkoul@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Deepak Katragadda <dkatraga@codeaurora.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 07, 2019 at 03:42:34PM +0530, Vinod Koul wrote:
> From: Deepak Katragadda <dkatraga@codeaurora.org>
> 
> Add the clocks supported in global clock controller which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
> 
> Signed-off-by: Deepak Katragadda <dkatraga@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> [vkoul: port to upstream and tidy-up]
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +

>  drivers/clk/qcom/Kconfig                      |    7 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/gcc-sm8150.c                 | 3649 +++++++++++++++++

>  include/dt-bindings/clock/qcom,gcc-sm8150.h   |  243 ++

Next time, please split bindings to separate patch. 

For the DT parts,

Acked-by: Rob Herring <robh@kernel.org>

>  5 files changed, 3901 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sm8150.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8150.h
