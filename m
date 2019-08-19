From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 1/2] clk: qcom: Add DT bindings for SC7180 gcc clock
 controller
Date: Mon, 19 Aug 2019 18:01:16 +0530
Message-ID: <139b48fd-2fcc-c6bb-ae6b-fb8cbbd82def@codeaurora.org>
References: <20190807181301.15326-1-tdas@codeaurora.org>
 <20190807181301.15326-2-tdas@codeaurora.org>
 <20190807221442.01F8D2173C@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807221442.01F8D2173C@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org



On 8/8/2019 3:44 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-08-07 11:13:00)
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> index 8661c3cd3ccf..18d95467cb36 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> @@ -23,6 +23,7 @@ Required properties :
>>                          "qcom,gcc-sdm630"
>>                          "qcom,gcc-sdm660"
>>                          "qcom,gcc-sdm845"
>> +                       "qcom,gcc-sc7180"
>>
>>   - reg : shall contain base register location and length
>>   - #clock-cells : shall contain 1
> 
> Can you please list the clk inputs that you're expecting now? Similar to
> what Vinod did for the other most recent GCC driver. We should probably
> convert this binding to YAML.
> 

Thanks Stephen for review, will send the YAML binding in the next patch 
series along with the clock inputs updated.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
