From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: clock: Add support for the MSM8998
 mmcc
Date: Tue, 5 Feb 2019 15:08:43 -0700
Message-ID: <ba5d7855-9dd2-5a99-ae8c-a7fce125ca25@codeaurora.org>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org>
 <1548866159-30304-1-git-send-email-jhugo@codeaurora.org>
 <154940414347.169292.9150834270087697417@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154940414347.169292.9150834270087697417@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, bjorn.andersson@linaro.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
Cc: marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/5/2019 3:02 PM, Stephen Boyd wrote:
> Quoting Jeffrey Hugo (2019-01-30 08:35:59)
>> Document the multimedia clock controller found on MSM8998
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/clock/qcom,mmcc.txt | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
>> index 8b0f784..ae85bca 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
>> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
>> @@ -10,11 +10,18 @@ Required properties :
>>                          "qcom,mmcc-msm8960"
>>                          "qcom,mmcc-msm8974"
>>                          "qcom,mmcc-msm8996"
>> +                       "qcom,mmcc-msm8998"
>>   
>>   - reg : shall contain base register location and length
>>   - #clock-cells : shall contain 1
>>   - #reset-cells : shall contain 1
>>   
>> +For MSM8998 only:
>> +       - clocks: a list of phandles and clock-specifier pairs,
>> +                 one for each entry in clock-names.
>> +       - clock-names: "xo" for the xo clock,
>> +                      "gpll0" for the global pll 0 clock.
> 
> Wouldn't the DSI plls also be listed here? And anything else that is
> external to this clock controller?
> 

We can't get the DSI plls from DT as far as I am aware (upstream).  That 
is why I mentioned in the cover letter we need to rely on the global 
namespace.

Also, the DSI plls, etc present a chicken and egg situation, as the plls 
require mmcc, and mmcc requires the plls.  I forsee an unsolvable 
EPROBE_DEFER issue.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
