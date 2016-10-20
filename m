From: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/4] arm64: dts: msm8996: Add SMEM reserve-memory node
Date: Thu, 20 Oct 2016 14:16:41 -0700
Message-ID: <4ca66e5d-c235-435b-c966-49a0e0722b8e@codeaurora.org>
References: <1476989765-7524-1-git-send-email-spjoshi@codeaurora.org>
 <20161020195743.GO7509@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161020195743.GO7509@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Trilok Soni <tsoni-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/20/2016 12:57 PM, Bjorn Andersson wrote:
> On Thu 20 Oct 11:56 PDT 2016, Sarangdhar Joshi wrote:
>
>> Add DT node to carveout memory for shared memory region.
>>
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks for reviewing.

>
> Regards,
> Bjorn
>
>> Signed-off-by: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index d6da223..36216ae 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -31,6 +31,17 @@
>>  		reg = <0 0 0 0>;
>>  	};
>>
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		smem_mem: smem-mem@86000000 {
>> +			reg = <0x0 0x86000000 0x0 0x200000>;
>> +			no-map;
>> +		};
>> +	};
>> +
>>  	cpus {
>>  		#address-cells = <2>;
>>  		#size-cells = <0>;
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

Regards,
Sarang
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
