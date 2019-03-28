From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/9] dt-bindings: power: Add rpm power domain bindings
 for qcs404
Date: Thu, 28 Mar 2019 13:40:29 -0500
Message-ID: <20190328184029.GA20260@bogus>
References: <20190327123832.11566-1-sibis@codeaurora.org>
 <20190327123832.11566-5-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190327123832.11566-5-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, rnayak@codeaurora.org, david.brown@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Mar 2019 18:08:27 +0530, Sibi Sankar wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add RPM power domain bindings for the qcs404 family of SoC
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [sibis: Add supported rpmpd states for qcs404]
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> skip adding Rob's R-b due to some additional changes
> https://lore.kernel.org/lkml/20190325223343.GA27389@bogus/
> 
>  .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h        | 22 +++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
