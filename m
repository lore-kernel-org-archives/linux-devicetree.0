From: Rob Herring <robh@kernel.org>
Subject: Re: [v5 2/2] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
Date: Tue, 1 May 2018 07:43:33 -0500
Message-ID: <20180501124333.GA32660@rob-hp-laptop>
References: <1525164093-16645-1-git-send-email-tdas@codeaurora.org>
 <1525164093-16645-3-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1525164093-16645-3-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 01, 2018 at 02:11:33PM +0530, Taniya Das wrote:
> Add the RPMh clock driver to control the RPMh managed clock resources on
> some of the Qualcomm Technologies, Inc. SoCs.
> 
> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/clk-rpmh.c           | 387 ++++++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,rpmh.h |   2 -
>  4 files changed, 397 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/clk/qcom/clk-rpmh.c

> diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
> index 36caab2..f48fbd6 100644
> --- a/include/dt-bindings/clock/qcom,rpmh.h
> +++ b/include/dt-bindings/clock/qcom,rpmh.h
> @@ -18,7 +18,5 @@
>  #define RPMH_RF_CLK2_A				9
>  #define RPMH_RF_CLK3				10
>  #define RPMH_RF_CLK3_A				11
> -#define RPMH_RF_CLK4				12
> -#define RPMH_RF_CLK4_A				13

Did you mean to have this or squash into previous patch?
