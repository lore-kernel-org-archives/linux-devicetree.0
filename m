From: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/4] arm64: dts: msm8996: Add reserve-memory nodes
Date: Thu, 20 Oct 2016 14:17:18 -0700
Message-ID: <a1ba395b-acf8-e65d-2f11-504a093cb9c2@codeaurora.org>
References: <1476989765-7524-1-git-send-email-spjoshi@codeaurora.org>
 <1476989765-7524-2-git-send-email-spjoshi@codeaurora.org>
 <20161020195704.GN7509@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161020195704.GN7509@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Trilok Soni <tsoni-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/20/2016 12:57 PM, Bjorn Andersson wrote:
> On Thu 20 Oct 11:56 PDT 2016, Sarangdhar Joshi wrote:
>
>> Add reserve-memory nodes required for Qualcomm
>> Peripheral Image Loaders
>>
>
> Awesome stuff,
>
> Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Thanks for reviewing.

>
> Regards,
> Bjorn
>
>> Signed-off-by: Sarangdhar Joshi <spjoshi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 36216ae..949b096 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -36,6 +36,31 @@
>>  		#size-cells = <2>;
>>  		ranges;
>>
>> +		mba_region: mba@91500000 {
>> +			reg = <0x0 0x91500000 0x0 0x200000>;
>> +			no-map;
>> +		};
>> +
>> +		slpi_region: slpi@90b00000 {
>> +			reg = <0x0 0x90b00000 0xa00000>;
>> +			no-map;
>> +		};
>> +
>> +		venus_region: venus@90400000 {
>> +			reg = <0x0 0x90400000 0x0 0x700000>;
>> +			no-map;
>> +		};
>> +
>> +		adsp_region: adsp@8ea00000 {
>> +			reg = <0x0 0x8ea00000 0x0 0x1a00000>;
>> +			no-map;
>> +		};
>> +
>> +		mpss_region: mpss@88800000 {
>> +			reg = <0x0 0x88800000 0x0 0x6200000>;
>> +			no-map;
>> +		};
>> +
>>  		smem_mem: smem-mem@86000000 {
>>  			reg = <0x0 0x86000000 0x0 0x200000>;
>>  			no-map;
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

Regards,
Sarang
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
