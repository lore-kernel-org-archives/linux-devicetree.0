From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [[PATCH v2] 2/2] dt-bindings: clock: Introduce QCOM RPMh clock
 bindings
Date: Sat, 14 Apr 2018 07:33:14 +0530
Message-ID: <63dbb808-ba93-e5ae-329d-de34184019b5@codeaurora.org>
References: <1523183533-23171-1-git-send-email-tdas@codeaurora.org>
 <1523183533-23171-3-git-send-email-tdas@codeaurora.org>
 <20180409225853.GM453@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180409225853.GM453@tuxbook-pro>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Bjorn,

Thanks for your review comments.

On 4/10/2018 4:28 AM, Bjorn Andersson wrote:
> On Sun 08 Apr 03:32 PDT 2018, Taniya Das wrote:
> 
>> From: Amit Nischal <anischal@codeaurora.org>
>>
>> Add RPMh clock device bindings for Qualcomm Technology Inc's SoCs. These
>> devices would be used for communicating resource state requests to control
>> the clocks managed by RPMh.
>>
>> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,rpmh-clk.txt    | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
>> new file mode 100644
>> index 0000000..4ade82b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
>> @@ -0,0 +1,22 @@
>> +Qualcomm Technologies, Inc. RPMh Clocks
>> +-------------------------------------------------------
>> +
>> +Resource Power Manager Hardened (RPMh) manages shared resources on
>> +some Qualcomm Technologies Inc. SoCs. It accepts clock requests from
>> +other hardware subsystems via RSC to control clocks.
>> +
>> +Required properties :
>> +- compatible : shall contain "qcom,rpmh-clk-sdm845"
> 
> We have a chance to fix this to Rob's liking, so please make this
> "qcom,sdm845-rpmh-clock" (or maybe "qcom,sdm845-rpmhcc"?)

I would fix  it to "qcom,sdm845-rpmh-clk".

> 
>> +
>> +- #clock-cells : must contain 1
>> +
>> +Example :
>> +
>> +#include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +	&apps_rsc {
>> +		rpmh: clock-controller {
> 
> I believe the clock-controller, the power-domain and the bus-scaler are
> equal contenders of the label "rpmh", so please make it more specific.
> How about "rpmhcc" to mimic previous platforms?
> 

Would update it "rpmhcc".

>> +			compatible = "qcom,rpmh-clk-sdm845";
>> +			#clock-cells = <1>;
>> +		};
>> +	};
> 
> Regards,
> Bjorn
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
