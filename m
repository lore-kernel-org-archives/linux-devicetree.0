From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 07/11] pinctrl: use ngpios propety from DT
Date: Wed, 28 Oct 2015 08:39:47 -0700
Message-ID: <5630EC43.6080900@broadcom.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
 <1445233398-27129-8-git-send-email-pramodku@broadcom.com>
 <CACRpkdY1GDs6ypqCiY3iiv3DkfnHchnY+bWPoCqU=_sgn9f5vQ@mail.gmail.com>
 <0C803592FC378B4E83922050AB46442A2AD742F0@SJEXCHMB10.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0C803592FC378B4E83922050AB46442A2AD742F0-HXj2mutaA2qau4nib9vn7Zr/X4hKkxxPpWgKQ6/u3Fg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jason Uy <jasonuy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 10/28/2015 4:52 AM, Pramod Kumar wrote:
> Hi Linus,
>
>> -----Original Message-----
>> From: Linus Walleij [mailto:linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org]
>> Sent: 27 October 2015 15:22
>> To: Pramod Kumar
>> Cc: Rob Herring; Pawel Moll; Mark Rutland; Ian Campbell; Kumar Gala; Ray Jui;
>> Scott Branden; Russell King; linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; bcm-kernel-feedback-
>> list; Jason Uy; Masahiro Yamada; Thomas Gleixner; Laurent Pinchart;
>> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
>> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jonas Gorski
>> Subject: Re: [PATCH 07/11] pinctrl: use ngpios propety from DT
>>
>> On Mon, Oct 19, 2015 at 7:43 AM, Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> wrote:
>>
>>> Since identical hardware is used in several instances and all pins are
>>> not routed to pinctrl hence getting total number of gpios from DT make
>>> more sense hence stop using total number of gpios pins from drivers
>>> and extract it from DT.
>>>
>>> Signed-off-by: Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
>> This patch is wrong.
>>
>> Keep this per-compatible code, and only overrid the ngpios if and only if:
>>
>> - The ngpios is set in the DT node
>> - The ngpios in the DT node is *smaller* than the hardware
>>    defined number of GPIOs.
>>
>> ngpios is for restricting the number of available lines due to routing etc, not to
>> define what the hardware has, because the hardware most certainly have all the
>> lines, it's just that you're not using all of them.
>>
>> Yours,
>> Linus Walleij
>
> I discussed with ASIC team regarding this iProc GPIO block. They use a library to create the GPIOs block where "total number of GPIO pins( let say N) in GPIO block" is used as an parameter.
> Library uses a construct for *a* GPIO pin. This gets instantiated N times to create a complete GPIO block with N pins.

Just to confirm, N can be *any number*, and when it exceeds 32, 
additional registers will be created by the library, correct? I think 
that's what I saw with Cygnus, where 3 instances of this GPIO controller 
was used, with two of them less supporting less than 32 GPIOs and one of 
them (ASIU) supporting 146 GPIOs, in which case, 5 register banks are 
used with 0x200 segment each.

>
> All iProc based SoCs uses this library. So I'm not sure whether attaching "total number of GPIOs pins" to compatible-string make sense in this case.

The closest I can think of is to tie a very large number of N to the 
"brcm,iproc-gpio" compatible string for all new iProc SoCs, but even 
that, one can argue how large is *large*

> I personally feel that passing this number from the DT makes more sense here. Any iProc based future as well as current SoCs would be able to use this driver without any change.
>
> Please advise us in this case.
>
> Regards,
> Pramod
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
