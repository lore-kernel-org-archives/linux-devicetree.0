From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
Date: Wed, 1 May 2019 08:17:09 -0600
Message-ID: <807e0789-6a7d-28b5-2811-df8e7e4ae393@codeaurora.org>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677473-29242-1-git-send-email-jhugo@codeaurora.org>
 <20190501033430.GB2938@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501033430.GB2938@tuxbook-pro>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, agross@kernel.org, marc.w.gonzalez@free.fr, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/30/2019 9:34 PM, Bjorn Andersson wrote:
> On Tue 30 Apr 19:24 PDT 2019, Jeffrey Hugo wrote:
> 
>> The global clock controller on MSM8998 can consume a number of external
>> clocks.  Document them.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> index 8661c3c..7d45323 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> @@ -28,6 +28,16 @@ Required properties :
>>   - #clock-cells : shall contain 1
>>   - #reset-cells : shall contain 1
>>   
>> +For MSM8998 only:
>> +	- clocks: a list of phandles and clock-specifier pairs,
>> +		  one for each entry in clock-names.
>> +	- clock-names: "xo" (required)
>> +		       "usb3_pipe" (optional)
>> +		       "ufs_rx_symbol0" (optional)
>> +		       "ufs_rx_symbol1" (optional)
>> +		       "ufs_tx_symbol0" (optional)
>> +		       "pcie0_pipe" (optional)
> 
> The optional clocks here comes from hardware blocks that in turn depends
> on the gcc, so we would need to resolve them lazily (in contrast to xo).
> 
> We typically don't list these in DT, but if this is close to the
> complete list of incoming clocks then I like the explicitness of it.

I reviewed the hardware documentation, and this is a complete list, 
except for some "aud_ref_clk" which I can't tell exactly where it comes 
from, and I see no use for it.  As near as I can tell, this list should 
cover all the needs going forward.

> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 
>> +
>>   Optional properties :
>>   - #power-domain-cells : shall contain 1
>>   - Qualcomm TSENS (thermal sensor device) on some devices can
>> -- 
>> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
>> Qualcomm Technologies, Inc. is a member of the
>> Code Aurora Forum, a Linux Foundation Collaborative Project.
>>


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
