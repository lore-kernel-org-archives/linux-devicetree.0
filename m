From: Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: soc: qcom: Add RSC power domain
 specifier
Date: Tue, 3 Sep 2019 14:14:17 +0530
Message-ID: <6002b812-b575-85c7-41a4-2b9a200b4ff3@codeaurora.org>
References: <20190823081703.17325-1-mkshah@codeaurora.org>
 <20190823081703.17325-4-mkshah@codeaurora.org> <20190827223252.GA26039@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827223252.GA26039@bogus>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: swboyd@chromium.org, agross@kernel.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bjorn.andersson@linaro.org, evgreen@chromium.org, dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org, ulf.hansson@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 8/28/2019 4:02 AM, Rob Herring wrote:
> On Fri, Aug 23, 2019 at 01:47:00PM +0530, Maulik Shah wrote:
>> In addition to transmitting resource state requests to the remote
>> processor, the RSC is responsible for powering off/lowering the
>> requirements from CPUs subsystem for the associated hardware like
>> buses, clocks, and regulators when all CPUs and cluster is powered down.
>>
>> The power domain is configured to a low power state and when all the
>> CPUs are powered down, the RSC can lower resource state requirements
>> and power down the rails that power the CPUs.
>>
>> Add PM domain specifier property for RSC controller.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>   Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt b/Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt
>> index 9b86d1eff219..d0ab6e9b6745 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt
>> +++ b/Documentation/devicetree/bindings/soc/qcom/rpmh-rsc.txt
>> @@ -83,6 +83,13 @@ Properties:
>>   	Value type: <string>
>>   	Definition: Name for the RSC. The name would be used in trace logs.
>>   
>> +- #power-domain-cells:
>> +	Usage: optional
>> +	Value type: <u32>
>> +	Definition: Number of cells in power domain specifier. Optional for
>> +		    controllers that may be in 'solver' state where they can
>> +		    be in autonomous mode executing low power modes.
> What's the value? It's always 0?

yes. its value is always 0. i will update definition to mention this in 
next version.

>> +
>>   Drivers that want to use the RSC to communicate with RPMH must specify their
>>   bindings as child nodes of the RSC controllers they wish to communicate with.
>>   
>> @@ -112,6 +119,7 @@ TCS-OFFSET: 0xD00
>>   				  <SLEEP_TCS   3>,
>>   				  <WAKE_TCS    3>,
>>   				  <CONTROL_TCS 1>;
>> +		#power-domain-cells = <0>;
>>   	};
>>   
>>   Example 2:
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by The Linux Foundation.
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
