From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH v4 3/4] drivers: edac: Add EDAC driver support for QCOM
 SoCs
Date: Tue, 11 Sep 2018 15:11:30 +0530
Message-ID: <a8fff11e-5821-f191-ed2e-ec99fadcb5e6@codeaurora.org>
References: <1536103345-1919-1-git-send-email-vnkgutta@codeaurora.org>
 <1536103345-1919-4-git-send-email-vnkgutta@codeaurora.org>
 <105f8339-61bc-072e-0498-ed44470a5fb8@codeaurora.org>
 <5d8f92b480e1b53e7e04da965d44f7ea@codeaurora.org>
 <b35f111c-0464-dcee-c970-4821f741694b@codeaurora.org>
 <b5d9a1dc741e09db6d4044f4d82f83d9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b5d9a1dc741e09db6d4044f4d82f83d9@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: vnkgutta@codeaurora.org
Cc: Borislav Petkov <bp@alien8.de>, evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org
List-Id: devicetree@vger.kernel.org

On 9/11/2018 4:15 AM, vnkgutta@codeaurora.org wrote:
> On 2018-09-06 22:02, Sai Prakash Ranjan wrote:
>> On 9/7/2018 4:01 AM, vnkgutta@codeaurora.org wrote:
>>> On 2018-09-06 05:38, Sai Prakash Ranjan wrote:
>>>> On 9/5/2018 4:52 AM, Venkata Narendra Kumar Gutta wrote:
>>>>> +static const struct of_device_id qcom_llcc_edac_match_table[] = {
>>>>> +    { .compatible = "qcom,llcc-edac" },
>>>>> +    { },
>>>>> +};
>>>>> +
>>>>>
>>>> Hi Venkata,
>>>>
>>>> Devicetree binding for llcc is updated, but what about this compatible?
>>>
>>> Does it need documentation too? I was not sure if I should add 
>>> documentation for this or not!
>>>
>>
>> It does not require a separate binding, what I meant was to add this
>> compatible in the llcc binding itself, maybe as a subnode if it is
>> correct.
> 
> Hi,
> 
> We aren't really using this of_device_id structure, as this driver is 
> being registered from LLCC through
> platform_register_device_data(...). This structure initialization is 
> just dead code as this driver won't be probed based on the DT entries.
> 
> Hence removing this compatible property and the corresponding struct in 
> the next patchset.
> 
> So, this doesn't need an extra binding/documentation.

Ok. Now that you have removed the compatible, it should be fine.

Thanks
