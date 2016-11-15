From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: pwm: DT: Add ramp delay for exponential
 voltage transition
Date: Tue, 15 Nov 2016 08:27:53 -0600
Message-ID: <CAL_Jsq+=oyRC7ZPcva_B6CB_vCquzpRw0UU=nfdjxEbzkKjiVw@mail.gmail.com>
References: <1478281075-3498-1-git-send-email-ldewangan@nvidia.com>
 <20161114154807.j4oo4veslhknauxy@rob-hp-laptop> <582AF4B7.4050705@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <582AF4B7.4050705-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 15, 2016 at 5:42 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> On Monday 14 November 2016 09:18 PM, Rob Herring wrote:
>>
>> On Fri, Nov 04, 2016 at 11:07:54PM +0530, Laxman Dewangan wrote:
>>>
>>> Some PWM regulator has the exponential transition in voltage change as
>>> opposite to fixed slew-rate linear transition on other regulators.
>>> For such PWM regulators, add the property for providing the delay
>>> from DT node.
>>>
>>> Add DT binding details of the new property
>>> "pwm-regulator-voltage-ramp-time-us" added for providing voltage
>>> transition delay.
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
>>> ---
>>>   Documentation/devicetree/bindings/regulator/pwm-regulator.txt | 10
>>> ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
>>> b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
>>> index 3aeba9f..a163f42 100644
>>> --- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
>>> +++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
>>> @@ -54,6 +54,16 @@ Optional properties:
>>>   --------------------
>>>   - enable-gpios:               GPIO to use to enable/disable the
>>> regulator
>>>   +- pwm-regulator-voltage-ramp-time-us: Integer, voltage ramp time in
>>
>> This is a really long name. Drop the 'pwm-regulator-' part as it is
>> redundant. The fact that it is PWM reg specific is captured as it is
>> documented that way.
>>
>
> We already have the regulator-ramp-delay from the regulator core.
> Just wanted to make this (pwm-regulator-voltage-ramp-time-us) for pwm
> specific.

Neither of these are very clear that one is linear and one is
exponential. Maybe you should use the existing property to express the
time and just add a boolean property like "voltage-ramp-exponential"?

> Can we have "pwm-regulator-ramp-delay" or "pwm-regulator-settling-time-us"?

How are those better? Same comment applies.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
