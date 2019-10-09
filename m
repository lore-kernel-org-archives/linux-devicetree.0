From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
Date: Wed, 9 Oct 2019 14:49:39 +0530
Message-ID: <d17dad3d-d32c-b71c-0e56-d15cb246f742@codeaurora.org>
References: <20190918095018.17979-1-tdas@codeaurora.org>
 <a3cd82c9-8bfa-f4a3-ab1f-2e397fbd9d16@codeaurora.org>
 <20190924231223.9012C207FD@mail.kernel.org>
 <347780b9-c66b-01c4-b547-b03de2cf3078@codeaurora.org>
 <20190925130346.42E0820640@mail.kernel.org>
 <35f8b699-6ff7-9104-5e3d-ef4ee8635832@codeaurora.org>
 <20191001143825.CD3212054F@mail.kernel.org>
 <7ac5f6bf-33c5-580e-bd40-e82f3052d460@codeaurora.org>
 <20191003160130.5A19B222D0@mail.kernel.org>
 <81a2fa46-a7e6-66a2-9649-009f22813c81@codeaurora.org>
 <20191004232022.062A1215EA@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004232022.062A1215EA@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On 10/5/2019 4:50 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-10-04 10:39:31)
>> Hi Stephen,
>>
>> On 10/3/2019 9:31 PM, Stephen Boyd wrote:
>>> Quoting Taniya Das (2019-10-03 03:31:15)
>>>> Hi Stephen,
>>>>
>>>> On 10/1/2019 8:08 PM, Stephen Boyd wrote:
>>>>>
>>>>> Why do you want to keep them critical and registered? I'm suggesting
>>>>> that any clk that is marked critical and doesn't have a parent should
>>>>> instead become a register write in probe to turn the clk on.
>>>>>
>>>> Sure, let me do a one-time enable from probe for the clocks which
>>>> doesn't have a parent.
>>>> But I would now have to educate the clients of these clocks to remove
>>>> using them.
>>>>
>>>
>>> If anyone is using these clks we can return NULL from the provider for
>>> the specifier so that we indicate there isn't support for them in the
>>> kernel. At least I hope that code path still works given all the recent
>>> changes to clk_get().
>>>
>>
>> Could you please confirm if you are referring to update the below?
> 
> I wasn't suggesting that explicitly but sure. Something like this would
> be necessary to make clk_get() pass back a NULL pointer to the caller.
> Does everything keep working with this change?
> 

Even if I pass back NULL, I don't see it working. Please suggest how to 
take it forward.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
