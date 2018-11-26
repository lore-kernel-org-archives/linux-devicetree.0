From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: Introduce QCOM Graphics clock
 bindings
Date: Mon, 26 Nov 2018 16:09:28 -0600
Message-ID: <20181126220928.GA10395@bogus>
References: <1543120569-14444-1-git-send-email-tdas@codeaurora.org>
 <1543120569-14444-2-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543120569-14444-2-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Amit Nischal <anischal@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Sun, 25 Nov 2018 10:06:07 +0530, Taniya Das wrote:
> From: Amit Nischal <anischal@codeaurora.org>
> 
> Add device tree bindings for graphics clock controller for
> Qualcomm Technology Inc's SDM845 SoCs.
> 
> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gpucc.txt       | 18 ++++++++++++++++
>  include/dt-bindings/clock/qcom,gpucc-sdm845.h      | 24 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.txt
>  create mode 100644 include/dt-bindings/clock/qcom,gpucc-sdm845.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
