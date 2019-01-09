From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v10 1/9] dt-bindings: opp: Introduce opp-level bindings
Date: Wed, 9 Jan 2019 14:50:42 +0530
Message-ID: <d48db4fd-0b6b-8963-048d-3304b850e28c@codeaurora.org>
References: <20190109090420.8100-1-rnayak@codeaurora.org>
 <20190109090420.8100-2-rnayak@codeaurora.org>
 <20190109090912.ciq4uzo5sjghyms2@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190109090912.ciq4uzo5sjghyms2@vireshk-i7>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: andy.gross@linaro.org, robh@kernel.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com
List-Id: devicetree@vger.kernel.org



On 1/9/2019 2:39 PM, Viresh Kumar wrote:
> On 09-01-19, 14:34, Rajendra Nayak wrote:
>> On some SoCs (especially from Qualcomm and MediaTek) an OPP
>> node needs to describe an additional level/corner value
>> that is then communicated to a remote microprocessor by the CPU, which
>> then takes some actions (like adjusting voltage values across variousi
>> rails) based on the value passed.
>>
>> Add opp-level as an additional property in the OPP node and describe it
>> in the OPP bindings document.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/opp/opp.txt | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
>> index c396c4c0af92..e83fb7cbfd58 100644
>> --- a/Documentation/devicetree/bindings/opp/opp.txt
>> +++ b/Documentation/devicetree/bindings/opp/opp.txt
>> @@ -129,6 +129,11 @@ Optional properties:
>>   - opp-microamp-<name>: Named opp-microamp property. Similar to
>>     opp-microvolt-<name> property, but for microamp instead.
>>   
>> +- opp-level: On some SoC platforms an OPP node can describe a positive value
>> +  representing a corner/level that's communicated with a remote microprocessor
>> +  (usually called the power manager) which then translates it into a certain
>> +  voltage on a voltage rail.
>> +
> 
> This binding is generic enough and doesn't have anything to do with a
> remote mp and so such statements should be avoided in here. And then
> Linux can use it the way it wants.
> 
> Maybe just say that it describes the performance level of the device.
> That's all.

Sure, does this seem fine?

- opp-level: A value representing the performance level of the device,
   expressed as a 32-bit big-endian integer.

I assume the changelog mentioning the motivation behind adding this is fine?

> 
>>   - clock-latency-ns: Specifies the maximum possible transition latency (in
>>     nanoseconds) for switching to this OPP from any other OPP.
>>   
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
