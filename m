From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: qcom: gcc-qcs404: Add CDSP related clocks and resets
Date: Wed, 27 Mar 2019 18:26:32 -0500
Message-ID: <20190327232632.GA26636@bogus>
References: <20190306055148.10823-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190306055148.10823-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 05, 2019 at 09:51:48PM -0800, Bjorn Andersson wrote:
> Add the clocks and resets need in order to control the Turing
> remoteproc.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/clk/qcom/gcc-qcs404.c               | 90 +++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-qcs404.h |  5 ++

Acked-by: Rob Herring <robh@kernel.org>

>  2 files changed, 95 insertions(+)
