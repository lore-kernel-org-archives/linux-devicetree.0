From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add SCM DT node
Date: Mon, 29 Oct 2018 11:32:06 +0200
Message-ID: <9fb3d2d2-37b5-27d2-ad27-45c77ebe1df2@linaro.org>
References: <20181026122542.4714-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181026122542.4714-1-sibis@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org
Cc: bjorn.andersson@linaro.org, dianders@chromium.org, evgreen@chromium.org, benchan@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Sibi,

On 10/26/2018 03:25 PM, Sibi Sankar wrote:
> Add SCM DT node to enable SCM functionality on SDM845.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index b72bdb0a31a5..fad22acfda4d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -221,6 +221,12 @@
>  		};
>  	};
>  
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm-sdm845", "qcom,scm";
> +		};
> +	};

What will happen if the platform is without tz firmware? I'd move this
DT node in sdm845-mtp.dts or at least make it status = disabled.

-- 
regards,
Stan
