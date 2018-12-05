From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: Add power-domain bindings
 for Q6V5
Date: Wed, 5 Dec 2018 16:55:06 -0600
Message-ID: <20181205225506.GA5884@bogus>
References: <20181120210828.12590-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120210828.12590-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, 21 Nov 2018 02:38:28 +0530, Sibi Sankar wrote:
> Add power-domain bindings for Q6V5 MSS on SDM845 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> Add dt-binding corresponding to https://patchwork.kernel.org/patch/10586893/
> (remoteproc: q6v5: Add support to vote for rpmh power domains)
> 
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt      | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
