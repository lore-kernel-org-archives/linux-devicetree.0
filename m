From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Introduce QCOM Display clock
 bindings
Date: Tue, 12 Jun 2018 14:59:07 -0600
Message-ID: <20180612205907.GA12993@rob-hp-laptop>
References: <1528098985-3676-1-git-send-email-tdas@codeaurora.org>
 <1528098985-3676-2-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1528098985-3676-2-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 04, 2018 at 01:26:24PM +0530, Taniya Das wrote:
> Add device tree bindings for display clock controller for Qualcomm
> Technology Inc's SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,dispcc.txt      | 19 +++++++++
>  include/dt-bindings/clock/qcom,dispcc-sdm845.h     | 45 ++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc.txt
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sdm845.h

Reviewed-by: Rob Herring <robh@kernel.org>
