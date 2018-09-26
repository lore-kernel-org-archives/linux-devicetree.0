From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: Introduce QCOM LPASS clock
 bindings
Date: Wed, 26 Sep 2018 17:47:42 -0500
Message-ID: <20180926224742.GA9096@bogus>
References: <1537266338-18661-1-git-send-email-tdas@codeaurora.org>
 <1537266338-18661-2-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1537266338-18661-2-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, 18 Sep 2018 15:55:37 +0530, Taniya Das wrote:
> Add device tree bindings for Low Power Audio subsystem clock controller for
> Qualcomm Technology Inc's SDM845 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt         |  2 ++
>  .../devicetree/bindings/clock/qcom,lpasscc.txt     | 35 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sdm845.h        |  2 ++
>  include/dt-bindings/clock/qcom,lpass-sdm845.h      | 16 ++++++++++
>  4 files changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
>  create mode 100644 include/dt-bindings/clock/qcom,lpass-sdm845.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
