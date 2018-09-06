From: vnkgutta@codeaurora.org
Subject: Re: [PATCH v4 4/4] dt-bindings: msm: Update documentation of
 qcom,llcc
Date: Thu, 06 Sep 2018 15:43:09 -0700
Message-ID: <819c72c265051ce791d37d4b80d2c117@codeaurora.org>
References: <1536103345-1919-1-git-send-email-vnkgutta@codeaurora.org>
 <1536103345-1919-5-git-send-email-vnkgutta@codeaurora.org>
 <9ecd23b7-b04d-ac82-4cbc-3a858f264824@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9ecd23b7-b04d-ac82-4cbc-3a858f264824@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Borislav Petkov <bp@alien8.de>, evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org
List-Id: devicetree@vger.kernel.org

On 2018-09-06 06:16, Sai Prakash Ranjan wrote:
> On 9/5/2018 4:52 AM, Venkata Narendra Kumar Gutta wrote:
>> Add reg-names and interrupts for LLCC documentation and the usage
>> examples. llcc broadcast base is added in addition to llcc base,
>> which is used for llcc broadcast writes.
>> 
>> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../devicetree/bindings/arm/msm/qcom,llcc.txt         | 19 
>> +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt 
>> b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
>> index 5e85749..2e007dc 100644
>> --- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
>> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
>> @@ -16,11 +16,26 @@ Properties:
>>   - reg:
>>   	Usage: required
>>   	Value Type: <prop-encoded-array>
>> -	Definition: Start address and the the size of the register region.
>> +	Definition: The first element specifies the llcc base start address 
>> and
>> +		    the size of the register region. The second element specifies
>> +		    the llcc broadcast base address and size of the register 
>> region.
>> +
>> +- reg-names:
>> +        Usage: required
>> +        Value Type: <stringlist>
>> +        Definition: Register region names. Must be "llcc_base", 
>> "llcc_bcast_base".
>> +
>> +- interrupts:
>> +	Usage: required
>> +	Definition: The interrupt is associated with the llcc edac device.
>> +			It's used for llcc cache single and double bit error detection
>> +			and reporting.
>>     Example:
>>     	cache-controller@1100000 {
>>   		compatible = "qcom,sdm845-llcc";
>> -		reg = <0x1100000 0x250000>;
>> +		reg = <0x1100000 0x200000>, <0x1300000 0x50000> ;
>> +		reg-names = "llcc_base", "llcc_bcast_base";
>> +		interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
>>   	};
>> 
> 
> Also, llcc_bcast_base should be llcc_broadcast_base as given in Patch
> 1 or you can change to llcc_bcast_base in Patch 1 of series.

My bad, I'll correct that in the next series.
