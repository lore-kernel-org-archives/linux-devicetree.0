From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: clock: Introduce QCOM GCC clock
 bindings
Date: Mon, 14 Oct 2019 11:50:30 -0500
Message-ID: <20191014165030.GA22526@bogus>
References: <20191014102308.27441-1-tdas@codeaurora.org>
 <20191014102308.27441-5-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191014102308.27441-5-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette =?iso-8859-1?Q?=A0?= <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, 14 Oct 2019 15:53:07 +0530, Taniya Das wrote:
> Add device tree bindings for Global clock subsystem clock
> controller for Qualcomm Technology Inc's SC7180 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.yaml   |  14 ++
>  include/dt-bindings/clock/qcom,gcc-sc7180.h   | 155 ++++++++++++++++++
>  2 files changed, 169 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sc7180.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
