From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 4/7] clk: qcom: Add A53 PLL support
Date: Thu, 21 Sep 2017 17:51:25 -0500
Message-ID: <20170921225125.f4dhxsodfgq5rrdt@rob-hp-laptop>
References: <20170921164940.20343-1-georgi.djakov@linaro.org>
 <20170921164940.20343-5-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170921164940.20343-5-georgi.djakov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 07:49:37PM +0300, Georgi Djakov wrote:
> The CPUs on Qualcomm MSM8916-based platforms are clocked by two PLLs,
> a primary (A53) CPU PLL and a secondary fixed-rate GPLL0. These sources
> are connected to a mux and half-integer divider, which is feeding the
> CPU cores.
> 
> This patch adds support for the primary CPU PLL which generates the
> higher range of frequencies above 1GHz.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,a53pll.txt      |  22 +++++

Please add acks when posting new versions.

>  drivers/clk/qcom/Kconfig                           |  10 ++
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/a53-pll.c                         | 107 +++++++++++++++++++++
>  4 files changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>  create mode 100644 drivers/clk/qcom/a53-pll.c
