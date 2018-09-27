From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] clk: qcom: Add Global Clock controller (GCC) driver
 for SDM660
Date: Thu, 27 Sep 2018 14:51:34 -0500
Message-ID: <20180927195134.GA19806@bogus>
References: <20180810202123.29238-1-ctatlor97@gmail.com>
 <20180925173603.2274-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180925173603.2274-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Taniya Das <tdas@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2018 at 06:35:58PM +0100, Craig Tatlor wrote:
> From: Taniya Das <tdas@codeaurora.org>
> 
> Add support for the global clock controller found on SDM660
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
> Based on CAF implementation.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> [craig: rename parents to fit upstream, and other cleanups]
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> ---
> Changes from V1:
>     Change authorship
>     Add sdm630 compatible
>  .../devicetree/bindings/clock/qcom,gcc.txt    |    1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/qcom/Kconfig                      |    9 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/gcc-sdm660.c                 | 2480 +++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sdm660.h   |  159 ++
>  5 files changed, 2650 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sdm660.c
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sdm660.h
