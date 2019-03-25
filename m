From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] soc: qcom: rpmpd: Add QCS404 corners
Date: Mon, 25 Mar 2019 17:33:43 -0500
Message-ID: <20190325223343.GA27389@bogus>
References: <20190221064434.2760-1-bjorn.andersson@linaro.org>
 <20190221064434.2760-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190221064434.2760-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 20 Feb 2019 22:44:33 -0800, Bjorn Andersson wrote:
> Add the shared cx/mx and the low-power-island's cx and mx power-domains
> found on QCS404.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
>  drivers/soc/qcom/rpmpd.c                      | 29 +++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        |  9 ++++++
>  3 files changed, 39 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
