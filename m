From: Sricharan R <sricharan@codeaurora.org>
Subject: Re: [PATCH 1/6] pinctrl: qcom: Add ipq6018 pinctrl driver
Date: Mon, 10 Jun 2019 16:30:59 +0530
Message-ID: <1766bee3-e4da-7c7c-9881-4a58885640dc@codeaurora.org>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-2-git-send-email-sricharan@codeaurora.org>
 <20190608032613.GC24059@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190608032613.GC24059@builder>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: robh+dt@kernel.org, Stephen Boyd <sboyd@kernel.org>, linus.walleij@linaro.org, agross@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 6/8/2019 8:56 AM, Bjorn Andersson wrote:
> On Wed 05 Jun 10:15 PDT 2019, Sricharan R wrote:
> 
>> Add initial pinctrl driver to support pin configuration with
>> pinctrl framework for ipq6018.
>>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
>> Signed-off-by: speriaka <speriaka@codeaurora.org>
> 

 Thanks for the review !!

> These should start with the author, then followed by each person that
> handled the patch on its way to the list - so your name should probably
> be last.  If you have more than one author add Co-developed-by, in
> addition to the Signed-off-by.
> 
> And please spell our speriaka's first and last name.
> 
 
  ok, will fix it.

> [..]
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.txt
> [..]
>> +- #gpio-cells:
>> +	Usage: required
>> +	Value type: <u32>
>> +	Definition: must be 2. Specifying the pin number and flags, as defined
>> +		    in <dt-bindings/gpio/gpio.h>
> 
> You're missing the required "gpio-ranges" property.
> 

 ok, will add.

>> +
> [..]
>> +- function:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: Specify the alternative function to be configured for the
>> +		    specified pins. Functions are only valid for gpio pins.
>> +		    Valid values are:
>> +	adsp_ext, alsp_int, atest_bbrx0, atest_bbrx1, atest_char, atest_char0,
> 
> Please indent these.
> 

 ok.

> [..]
> 
> The rest should be in a separate patch from the binding.
> 
>> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> [..]
>> +enum ipq6018_functions {
> [..]
>> +	msm_mux_NA,
> 
> I like when these are sorted, and if you make the last entry msm_mux__
> the msm_pingroup array becomes easier to read.
> 

 ok.

>> +};
> [..]
>> +static const struct msm_function ipq6018_functions[] = {
> [..]
>> +	FUNCTION(gcc_tlmm),
> 
> As above, please sort these.
> 

 ok.

>> +};
>> +
>> +static const struct msm_pingroup ipq6018_groups[] = {
>> +	PINGROUP(0, qpic_pad, wci20, qdss_traceclk_b, NA, burn0, NA, NA, NA,
>> +		 NA),
> 
> Please ignore the 80-char and skip the line breaks.
> 

 ok.

>> +	PINGROUP(1, qpic_pad, mac12, qdss_tracectl_b, NA, burn1, NA, NA, NA,
>> +		 NA),
>> +	PINGROUP(2, qpic_pad, wci20, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(3, qpic_pad, mac01, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(4, qpic_pad, mac01, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
>> +	PINGROUP(5, qpic_pad4, mac21, qdss_tracedata_b, NA, NA, NA, NA, NA, NA),
> 
> Is there a reason to keep qpic_padN as separate functions from qpic_pad?
> 
  Hmm, the auto-gen scripts needs to be fixed. Will correct it.

> [..]
>> +static struct platform_driver ipq6018_pinctrl_driver = {
>> +	.driver = {
>> +		.name = "ipq6018-pinctrl",
>> +		.owner = THIS_MODULE,
> 
> .owner is populated automagically by platform_driver_register, so please
> omit this.
> 

 ok, missed it. will fix. 

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
