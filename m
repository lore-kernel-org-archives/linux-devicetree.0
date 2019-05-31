From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC][PATCH 1/2] dt-bindings: power: reset: qcom: Add
 qcom,pm8998-pon compatability line
Date: Fri, 31 May 2019 16:50:37 -0700
Message-ID: <20190531235037.GC25597@minitux>
References: <20190531234734.102842-1-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190531234734.102842-1-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Amit Pundir <amit.pundir@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 31 May 16:47 PDT 2019, John Stultz wrote:

> Update bindings to support for qcom,pm8998-pon which uses gen2 pon
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  Documentation/devicetree/bindings/power/reset/qcom,pon.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> index 5705f575862d..0c0dc3a1e693 100644
> --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> @@ -9,6 +9,7 @@ Required Properties:
>  -compatible: Must be one of:
>  	"qcom,pm8916-pon"
>  	"qcom,pms405-pon"
> +	"qcom,pm8998-pon"
>  
>  -reg: Specifies the physical address of the pon register
>  
> -- 
> 2.17.1
> 
