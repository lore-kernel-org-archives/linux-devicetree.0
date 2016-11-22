From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/2] regulator: pwm: DT: Add ramp delay for exponential
 voltage transition
Date: Tue, 22 Nov 2016 15:13:49 -0600
Message-ID: <CAL_JsqLwjA4D1_KgZNxVT9AgiXHMv2kpyA_3zyrtASQSnjY=jQ@mail.gmail.com>
References: <1479479756-10755-1-git-send-email-ldewangan@nvidia.com>
 <20161121161727.y6pvydowiyeyy7qs@rob-hp-laptop> <583406CC.9080306@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <583406CC.9080306-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 22, 2016 at 2:50 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> On Monday 21 November 2016 09:47 PM, Rob Herring wrote:
>>
>> On Fri, Nov 18, 2016 at 08:05:55PM +0530, Laxman Dewangan wrote:
>>>
>>> Some PWM regulator has the exponential transition in voltage change as
>>> opposite to fixed slew-rate linear transition on other regulators.
>>> For such PWM regulators, add the property to tell that voltage change
>>> is exponential and having fixed delay for any level of change.
>>>
>>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> CC: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> CC: Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> ---
>>> This patch is continuation of discussion on patch
>>>         regulator: pwm: Fix regulator ramp delay for continuous mode
>>> https://patchwork.kernel.org/patch/9216857/
>>> where is it discussed to have separate property for PWM which has
>>> exponential voltage transition.
>>>
>>> Changes from V1:
>>> - Pass the flag to tell that voltage ramp is exponential instead of
>>>    providing delay.
>>> ---
>>>   .../devicetree/bindings/regulator/pwm-regulator.txt          | 12
>>> ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
>>> b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
>>> index 3aeba9f..2d9ef3a 100644
>>> --- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
>>> +++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
>>> @@ -54,6 +54,18 @@ Optional properties:
>>>   --------------------
>>>   - enable-gpios:               GPIO to use to enable/disable the
>>> regulator
>>>   +- voltage-ramp-exponential: Boolean, Some of PWM regulator has the
>>> exponential
>>> +                       transition in voltage ramp as opposite to fixed
>>> +                       slew-rate linear transition on other regulators.
>>> +                       For such PWM regulator, presence of this property
>>> will
>>> +                       tell that value of the regulator ramp delay
>>> provided by
>>> +                       DT property "regulator-ramp-delay" is exponential
>>> and
>>> +                       fixed delay for any voltage level change.
>>> +                       If PWM regulator supports the fixed linear slew
>>> rate
>>> +                       then this property should be absent from DT node
>>> and
>>> +                       property "regulator-ramp-delay" is used as linear
>>> slew
>>> +                       rate.
>>
>> Sorry, but on further thought, I don't think we should mix different
>> units for the same property. Also, the fact that the ramp is exponential
>> is irrelevant. You just want an absolute delay time rather than a rate,
>> right? So instead, how about just "regulator-ramp-time-us". Roughly what
>> you had in v1, but not PWM specific.
>
>
> Can we say "regulator-settling-time-us" and make it generic i.e. part of the
> regulator core instead of PWM regulator specific?

Sure.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
