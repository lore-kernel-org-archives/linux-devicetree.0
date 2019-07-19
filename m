From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv8 1/5] arm64: dts: qcom: sdm845: Add Coresight support
Date: Fri, 19 Jul 2019 15:58:58 +0530
Message-ID: <a1a2a9c6-f58b-f849-76e4-3a76d6faaab5@codeaurora.org>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <52550ed9bbc10dca860eb1700aef5c97f644327b.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <33215f68-1bf9-322a-d889-1d22514bdbdc@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <33215f68-1bf9-322a-d889-1d22514bdbdc@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>, gregkh@linuxfoundation.org, mathieu.poirier@linaro.org, leo.yan@linaro.org, alexander.shishkin@linux.intel.com, mike.leach@linaro.org, robh+dt@kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, david.brown@linaro.org, mark.rutland@arm.com
Cc: rnayak@codeaurora.org, vivek.gautam@codeaurora.org, sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, marc.w.gonzalez@free.fr
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On 7/19/2019 3:16 PM, Suzuki K Poulose wrote:
> 
> Hi Sai,
> 
> 
> On 12/07/2019 15:16, Sai Prakash Ranjan wrote:
>> Add coresight components found on Qualcomm SDM845 SoC.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 451 +++++++++++++++++++++++++++
>>   1 file changed, 451 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi 
>> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 4babff5f19b5..5d7e3f8e0f91 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -1815,6 +1815,457 @@
>>               clock-names = "xo";
>>           };
>> +        stm@6002000 {
>> +            compatible = "arm,coresight-stm", "arm,primecell";
>> +            reg = <0 0x06002000 0 0x1000>,
>> +                  <0 0x16280000 0 0x180000>;
>> +            reg-names = "stm-base", "stm-stimulus-base";
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            out-ports {
>> +                port {
>> +                    stm_out: endpoint {
>> +                        remote-endpoint =
>> +                          <&funnel0_in7>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        funnel@6041000 {
>> +            compatible = "arm,coresight-funnel", "arm,primecell";
> 
> We added support for static funnels and have thus updated our DT 
> bindings. And
> that implies, the above binding is now obsolete.
> As of the coresight/next tree, and thus linux-next, this must be 
> arm,coresight-dynamic-funnel and same applies everywhere else in the 
> series. Please could you
> update the series ?
> 

Sure, will update in the next version of the series.

Thanks,
Sai


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
