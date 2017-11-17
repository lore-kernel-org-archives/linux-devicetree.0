From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V6] clk: qcom: Add spmi_pmic clock divider support
Date: Fri, 17 Nov 2017 14:22:43 -0600
Message-ID: <20171117202243.you76ej4qvk3ul3g@rob-hp-laptop>
References: <1510912127-4582-1-git-send-email-tirupath@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510912127-4582-1-git-send-email-tirupath@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tirupathi Reddy <tirupath@codeaurora.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 17, 2017 at 03:18:47PM +0530, Tirupathi Reddy wrote:
> Clkdiv module provides a clock output on the PMIC with CXO as
> the source. This clock can be routed through PMIC GPIOs. Add
> a device driver to configure this clkdiv module.
> 
> Signed-off-by: Tirupathi Reddy <tirupath@codeaurora.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Normally your S-o-B would be last.

> ---
>  .../bindings/clock/clk-spmi-pmic-div.txt           |  59 ++++

Please split bindings to a separate patch.

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/qcom/Kconfig                           |   9 +
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/clk-spmi-pmic-div.c               | 308 +++++++++++++++++++++
>  4 files changed, 377 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
>  create mode 100644 drivers/clk/qcom/clk-spmi-pmic-div.c
