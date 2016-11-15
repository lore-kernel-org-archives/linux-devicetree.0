From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: pwm: DT: Add ramp delay for exponential
 voltage transition
Date: Tue, 15 Nov 2016 22:43:37 +0530
Message-ID: <582B4241.9030009@nvidia.com>
References: <1478281075-3498-1-git-send-email-ldewangan@nvidia.com> <20161114154807.j4oo4veslhknauxy@rob-hp-laptop> <582AF4B7.4050705@nvidia.com> <CAL_Jsq+=oyRC7ZPcva_B6CB_vCquzpRw0UU=nfdjxEbzkKjiVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+=oyRC7ZPcva_B6CB_vCquzpRw0UU=nfdjxEbzkKjiVw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Aleksandr Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Tuesday 15 November 2016 07:57 PM, Rob Herring wrote:
> On Tue, Nov 15, 2016 at 5:42 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On Monday 14 November 2016 09:18 PM, Rob Herring wrote:
>>> On Fri, Nov 04, 2016 at 11:07:54PM +0530, Laxman Dewangan wrote:
>>>>
>>>> regulator
>>>>    +- pwm-regulator-voltage-ramp-time-us: Integer, voltage ramp time in
>>> This is a really long name. Drop the 'pwm-regulator-' part as it is
>>> redundant. The fact that it is PWM reg specific is captured as it is
>>> documented that way.
>>>
>> We already have the regulator-ramp-delay from the regulator core.
>> Just wanted to make this (pwm-regulator-voltage-ramp-time-us) for pwm
>> specific.
> Neither of these are very clear that one is linear and one is
> exponential. Maybe you should use the existing property to express the
> time and just add a boolean property like "voltage-ramp-exponential"?

OK, this can work.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
