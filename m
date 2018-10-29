From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add SCM DT node
Date: Mon, 29 Oct 2018 20:24:46 +0530
Message-ID: <24ab0b3496de7809cc49479ea33c2eab@codeaurora.org>
References: <20181026122542.4714-1-sibis@codeaurora.org>
 <9fb3d2d2-37b5-27d2-ad27-45c77ebe1df2@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9fb3d2d2-37b5-27d2-ad27-45c77ebe1df2@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, bjorn.andersson@linaro.org, dianders@chromium.org, evgreen@chromium.org, benchan@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Stan,
Thanks for the review!

On 2018-10-29 15:02, Stanimir Varbanov wrote:
> Hi Sibi,
> 
> On 10/26/2018 03:25 PM, Sibi Sankar wrote:
>> Add SCM DT node to enable SCM functionality on SDM845.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi 
>> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index b72bdb0a31a5..fad22acfda4d 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -221,6 +221,12 @@
>>  		};
>>  	};
>> 
>> +	firmware {
>> +		scm {
>> +			compatible = "qcom,scm-sdm845", "qcom,scm";
>> +		};
>> +	};
> 
> What will happen if the platform is without tz firmware? I'd move this
> DT node in sdm845-mtp.dts or at least make it status = disabled.

Even in the absence of tz firmware, ATF is expected to implement the 
necessary
handlers for the SMC calls so I don't think it is necessary to keep it 
disabled.

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
