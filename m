From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V4] dt-bindings: timer: gpt: update binding doc
Date: Mon, 18 Feb 2019 16:20:07 +0100
Message-ID: <c0e15cd1-0a87-9371-06cc-7d55f06d5c9e@linaro.org>
References: <1546076081-23196-1-git-send-email-Anson.Huang@nxp.com>
 <20190111145214.GA15957@bogus>
 <AM6PR0402MB39111964EB06DF1D0447BB1BF5630@AM6PR0402MB3911.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM6PR0402MB39111964EB06DF1D0447BB1BF5630@AM6PR0402MB3911.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, Rob Herring <robh@kernel.org>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 18/02/2019 16:17, Anson Huang wrote:
> Hi, Rob
> 
> Best Regards!
> Anson Huang
> 
>> -----Original Message-----
>> From: Rob Herring [mailto:robh@kernel.org]
>> Sent: 2019Äê1ÔÂ11ÈÕ 22:52
>> To: Anson Huang <anson.huang@nxp.com>
>> Cc: daniel.lezcano@linaro.org; tglx@linutronix.de; mark.rutland@arm.com;
>> linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; dl-linux-imx
>> <linux-imx@nxp.com>
>> Subject: Re: [PATCH V4] dt-bindings: timer: gpt: update binding doc
>>
>> On Sat, Dec 29, 2018 at 09:39:34AM +0000, Anson Huang wrote:
>>> The i.MX GPT timer driver binding doc is out of date, update it
>>> according to current GPT timer driver.
>>>
>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>> ---
>>> ChangeLog since V3:
>>> 	be more specific about the backwards compatible of each SoC;
>>> ---
>>>  .../devicetree/bindings/timer/fsl,imxgpt.txt       | 39 ++++++++++++++++++--
>> --
>>>  1 file changed, 33 insertions(+), 6 deletions(-)
>>
>> This now seems in line with my 9+ year old memory of the lineage of this
>> block. :)
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> Rob
> 
> Do you know who will pick-up this patch?

I will. Applied for 5.1

Thanks
  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org ©¦ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
