From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5] clk: qcom: Add spmi_pmic clock divider support
Date: Thu, 21 Sep 2017 18:36:09 -0500
Message-ID: <20170921233609.t65nskglysn4v4qp@rob-hp-laptop>
References: <1505817286-12445-1-git-send-email-tirupath@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505817286-12445-1-git-send-email-tirupath@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Tirupathi Reddy <tirupath@codeaurora.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 19, 2017 at 04:04:46PM +0530, Tirupathi Reddy wrote:
> Clkdiv module provides a clock output on the PMIC with CXO as
> the source. This clock can be routed through PMIC GPIOs. Add
> a device driver to configure this clkdiv module.
> 
> Signed-off-by: Tirupathi Reddy <tirupath@codeaurora.org>
> ---
>  .../bindings/clock/clk-spmi-pmic-div.txt           |  56 ++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/qcom/Kconfig                           |   9 +
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/clk-spmi-pmic-div.c               | 343 +++++++++++++++++++++
>  4 files changed, 409 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/clk-spmi-pmic-div.txt
>  create mode 100644 drivers/clk/qcom/clk-spmi-pmic-div.c
