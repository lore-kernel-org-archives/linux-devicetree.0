From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/4] dt-bindings: reset: aoss: Add AOSS reset binding
 for SC7180 SoCs
Date: Wed, 21 Aug 2019 12:32:03 +0200
Message-ID: <1566383523.4193.5.camel@pengutronix.de>
References: <20190821095442.24495-1-sibis@codeaurora.org>
         <20190821095442.24495-2-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821095442.24495-2-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-08-21 at 15:24 +0530, Sibi Sankar wrote:
> Add SC7180 AOSS reset to the list of possible bindings.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> index 510c748656ec5..8f0bbdc6afd91 100644
> --- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> @@ -8,7 +8,8 @@ Required properties:
>  - compatible:
>  	Usage: required
>  	Value type: <string>
> -	Definition: must be:
> +	Definition: must be one of:
> +		    "qcom,sc7180-aoss-cc"
>  		    "qcom,sdm845-aoss-cc"
>  
>  - reg:

Does sc7180 have exactly the same resets (mss, camss, venus, gpu,
dispss, wcss, and lpass) as sdm845? If so, it could be considered
compatible, and the driver changes wouldn't be needed at all:

-	Definition: must be:
+	Definition: must be one of:
+		    "qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"
 	
	    "qcom,sdm845-aoss-cc"

Is there a reason not to do this?

regards
Philipp
