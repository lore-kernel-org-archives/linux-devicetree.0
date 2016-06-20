From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] firmware: qcom: scm: Expose PAS command 10 as
 reset-controller
Date: Mon, 20 Jun 2016 16:27:05 -0700
Message-ID: <20160620232705.GT28218@codeaurora.org>
References: <1466185243-31569-1-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466185243-31569-1-git-send-email-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/17, Bjorn Andersson wrote:
> PAS command 10 is used to assert and deassert the MSS reset via
> TrustZone, expose this as a reset-controller to mimic the direct
> access case.
> 
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
