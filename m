From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: remoteproc: qcom: Remove additional
 definition tag
Date: Mon, 3 Sep 2018 12:32:28 -0700
Message-ID: <20180903193228.GI3456@tuxbook-pro>
References: <20180829191215.10071-1-sibis@codeaurora.org>
 <20180829191215.10071-4-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180829191215.10071-4-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: p.zabel@pengutronix.de, mka@chromium.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed 29 Aug 12:12 PDT 2018, Sibi Sankar wrote:

> Remove the additional definition tag declared for WCSS sub-system
> under reset-names.
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 601dd9f389aa..3a66cde5895a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -58,8 +58,8 @@ on the Qualcomm Hexagon core.
>  	Usage: required
>  	Value type: <stringlist>
>  	Definition: must be "mss_restart" for the modem sub-system
> -	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
> -		    for the wcss syb-system
> +		    must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
> +		    for the wcss sub-system
>  
>  - cx-supply:
>  - mss-supply:
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
