From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: Introduce Qualcomm Turing Clock
 controller
Date: Wed, 27 Mar 2019 18:34:55 -0500
Message-ID: <20190327233455.GA8216@bogus>
References: <20190306174758.22462-1-bjorn.andersson@linaro.org>
 <20190306174758.22462-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190306174758.22462-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed,  6 Mar 2019 09:47:56 -0800, Bjorn Andersson wrote:
> Add devicetree binding for the turing clock controller found in QCS404.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/clock/qcom,turingcc.txt          | 19 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,turingcc-qcs404.h  | 15 +++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,turingcc.txt
>  create mode 100644 include/dt-bindings/clock/qcom,turingcc-qcs404.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
