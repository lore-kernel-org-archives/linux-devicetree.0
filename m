From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: Reserve gpio ranges on MTP
Date: Tue, 30 Oct 2018 10:18:00 -0600
Message-ID: <835f226e-8f9b-c89f-d818-d513f18d1494@codeaurora.org>
References: <20181030054554.1954-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030054554.1954-1-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/29/2018 11:45 PM, Bjorn Andersson wrote:
> GPIOs 0 through 3 and 81 through 84 are configured to not be accessible
> from the application CPUs. Mark them as reserved to allow the MSM8998
> MTP to boot after the introduction of 3edfb7bd76bd ("gpiolib: Show
> correct direction from the beginning").
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> index b4276da1fb0d..11fd1fe8bdb5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> @@ -241,3 +241,7 @@
>   		};
>   	};
>   };
> +
> +&tlmm {
> +	gpio-reserved-ranges = <0 4>, <81 4>;
> +};
> 

Does Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt 
need to be updated?  Seems like the majority of the other qcom pinctrl 
bindings docs mention that gpio-reserved-ranges is optional.

In any case,
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
