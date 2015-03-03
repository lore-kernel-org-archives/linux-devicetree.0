From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/4] mfd: devicetree: bindings: Add Qualcomm RPM regulator
 subnodes
Date: Tue, 03 Mar 2015 15:25:02 -0800
Message-ID: <54F642CE.5000606@codeaurora.org>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com> <1425356740-26285-2-git-send-email-bjorn.andersson@sonymobile.com> <54F60339.6000803@codeaurora.org> <20150303215424.GH26334@sonymobile.com> <54F62F79.6070204@codeaurora.org> <20150303221743.GJ26334@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150303221743.GJ26334@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/03/15 14:17, Bjorn Andersson wrote:
> On Tue 03 Mar 14:02 PST 2015, Stephen Boyd wrote:
>
>> On 03/03/15 13:54, Bjorn Andersson wrote:
>>> On Tue 03 Mar 10:53 PST 2015, Stephen Boyd wrote:
>>>
>>>> On 03/02/15 20:25, Bjorn Andersson wrote:
>>> [..]
>>>>> +
>>>>> +- vin_l1_l2_l12_l18-supply:
>>>>> +- vin_l24-supply:
>>>>> +- vin_l25-supply:
>>>>> +- vin_l27-supply:
>>>>> +- vin_l28-supply:
>>>>> +- vin_lvs_1_3_6-supply:
>>>>> +- vin_lvs2-supply:
>>>>> +- vin_lvs_4_5_7-supply:
>>>>> +- vin_ncp-supply:
>>>> Can you also include vin_s1,vin_s2, etc. for the rest of the supplies I
>>>> left out? It looks like you've covered all the inputs for the other pmics.
>>>>
>>> Sorry, I had problems finding the information in the rather sparse
>>> documentation I have for the 8921, so I just assumed that I could steal
>>> your list.
>>>
>>> I finally managed to find the pinout diagram, so the correct list for
>>> pm8921 seems to be:
>>>
>>> - vdd_l1_2_12_18-supply
>>> - vdd_l3_15_17-supply
>>> - vdd_l5_8_16-supply
>> vin_l4-supply?
>>
> Ahh, right, I missed the vdd_l4_l14 pad.
>
>>> - vdd_l6_7-supply
>>> - vdd_l9_11-supply
>>> - vdd_l10_22-supply
>>> - vdd_l21_23_29-supply
>> Also these seem to be vin_l21_l23_l29 where "l" precedes all numbers
>> (for all the LDOs).
>>
> The other pmics name their inputs like that; should we just pick that
> naming scheme for all these supplies and be happy?

Ok.

>>> - vdd_l24-supply
>>> - vdd_l25-supply
>>> - vdd_l26-supply
>>> - vdd_l27-supply
>>> - vdd_l28-supply
>>> - vdd_ncp-supply
>>> - vdd_s1-supply
>>> - vdd_s2-supply
>>> - vdd_s4-supply
>>> - vdd_s5-supply
>>> - vdd_s6-supply
>>> - vdd_s7-supply
>>> - vdd_s8-supply
>>> - vin_lvs1_3_6-supply
>>> - vin_lvs2-supply
>>> - vin_lvs4_5_7-supply
>>>
>>> I will send out an updated patch with these.
>> s/vdd/vin/ seems to match my datasheet.
>>
> For all of these? Same with the other pmics?
>
> These are the documented pad names that I have, nice to see that they
> are named differently in different documents.

Oh. I seem to have been looking at some pre-published doc that was still
laying around. vdd seems to match the official documentation so that
sounds good to me.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
