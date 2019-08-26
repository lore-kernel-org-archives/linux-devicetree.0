From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RESEND PATCH v2 1/2] dt-bindings: reset: aoss: Add AOSS reset
 binding for SC7180 SoCs
Date: Mon, 26 Aug 2019 10:36:08 +0200
Message-ID: <1566808568.3842.2.camel@pengutronix.de>
References: <20190824152411.21757-1-sibis@codeaurora.org>
         <20190824152411.21757-2-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190824152411.21757-2-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 2019-08-24 at 20:54 +0530, Sibi Sankar wrote:
> Add SC7180 AOSS reset to the list of possible bindings.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> index 510c748656ec5..3eb6a22ced4bc 100644
> --- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> @@ -8,8 +8,8 @@ Required properties:
>  - compatible:
>  	Usage: required
>  	Value type: <string>
> -	Definition: must be:
> -		    "qcom,sdm845-aoss-cc"
> +	Definition: must be one of:
> +		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"

Should this emphasize that the common sdm845 compatible always has to be
included?

+	Definition: must be:
+		"qcom,sdm845-aoss-cc" for SDM845 or
+		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc" for SC7180

or like the qcom,kpss-gcc bindings:

+	Definition: should be one of the following. The generic
compatible
+		"qcom,sdm845-aoss-cc" should also be
included.
+		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"
+	
	"qcom,sdm845-aoss-cc"

regards
Philipp
