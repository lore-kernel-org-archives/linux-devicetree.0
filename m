From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: MediaTek: Add binding document for the
 AUXADC
Date: Thu, 17 Mar 2016 16:39:44 +0100
Message-ID: <56EACFC0.5000300@gmail.com>
References: <1455866326-15095-1-git-send-email-s.hauer@pengutronix.de>
 <20160223203254.GA14660@rob-hp-laptop> <56CDBFFE.9050406@gmail.com>
 <20160224151204.GP3939@pengutronix.de> <56CDF7AB.7050201@gmail.com>
 <20160307065233.GA21851@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160307065233.GA21851-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On 07/03/16 07:52, Sascha Hauer wrote:
> On Wed, Feb 24, 2016 at 07:34:19PM +0100, Matthias Brugger wrote:
>>
>>
>> On 24/02/16 16:12, Sascha Hauer wrote:
>>> Hi Matthias,
>>>
>>> On Wed, Feb 24, 2016 at 03:36:46PM +0100, Matthias Brugger wrote:
>>>>
>>>>
>>>> On 23/02/16 21:32, Rob Herring wrote:
>>>>> On Fri, Feb 19, 2016 at 08:18:46AM +0100, Sascha Hauer wrote:
>>>>>> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>>>> ---
>>>>>>
>>>>>> This is a supplement to the MTK Thermal series which was lacking the
>>>>>> description for the AUXADC.
>>>>>
>>>>> So it will be applied with that I presume.
>>>>>
>>>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>>>
>>>>
>>>> Well the basic problem that I see is, that the auxadc has some more
>>>> registers (at least in mt6589) for the touch screen registers.
>>>> So this makes it a candidate for syscon and regmap.
>>>> But this needs a patch in the thermal driver first...
>>>
>>> When we want to have a driver for the auxadc we are free to write one.
>>> No need to use syscon and/or regmap for it.
>>>
>>> Note that the auxadc is not used by the thermal *driver*, it's used by
>>> the thermal *hardware*. It's the hardware that directly reads/writes
>>> auxadc registers. If MTK did it right then a real auxadc driver should
>>> not be disturbed by the thermal controller accesses. At least from
>>
>> Right, didn't realize this.
>>
>>> checking the datasheet the registers the thermal controller accesses
>>> are completely orthogonal to the ones a auxadc driver would use.
>>>
>>
>> As you already explained, syscon/regmap is not needed here. Just for
>> completion: we already had completely orthogonal registers for the reset
>> controller, and we decided to use regmap there as well.
>> We should stay consistent on this.
>
> Matthias, is this some kind of action topic for me? We can use regmap
> for the AUXADC driver if we want to, I have no problem with that.
>

No, no need for that, I will take the patch as is. I will let you know 
when it got queued.

Sorry for the delay.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
