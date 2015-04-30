From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v3 00/12] MIPS: ath79: Add OF support and DTS for TL-WR1043ND
Date: Thu, 30 Apr 2015 17:41:35 -0300
Message-ID: <5542937F.1050909@vanguardiasur.com.ar>
References: <1429875679-14973-1-git-send-email-albeu@free.fr>	<553E3CC8.3070304@vanguardiasur.com.ar> <20150430010728.0331a736@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150430010728.0331a736@tock>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 04/29/2015 08:07 PM, Alban wrote:
> On Mon, 27 Apr 2015 10:42:32 -0300
> Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
> 
>> On 04/24/2015 08:41 AM, Alban Bedel wrote:
>>> This series add OF bindings and code support for the interrupt
>>> controllers, clocks and GPIOs. However it was only tested on a
>>> TL-WR1043ND with an AR9132, others SoCs are untested, and a few are
>>> not supported at all.
>>>
>  
>> Hi Alban,
> 
> Hi,
> 
>> I've booted a Carambola2 using this (plus a custom devicetree and some
>> small changes):
>>
>> Tested-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>>
>> Just a small comment/question: Shouldn't we allow to build all the
>> devicetree files, instead of just the one that will be built-in?
>>
>> I.e., something like this:
>>
>> dtb-$(CONFIG_MATCH_ATH79_DT)   += ar9132_tl_wr1043nd_v1.dtb
>> dtb-$(CONFIG_MACH_ATH79_DT)    += ar9331_carambola2.dtb
>>
>> It should be useful to catch errors, but also in general, as the
>> devicetree is supposed to be independent of the kernel and should be
>> built separate from it.
> 
> Yes, that would be better, I'll fix that.
> 
>> PS: This series depends on a previous patchset. It's usually useful to
>> mention this in the cover letter and make a poor tester's life
>> easier :)
> 
>>> Most code changes base on the previous bug fix series:
>>> [PATCH v2 0/5] MIPS: ath79: Various small fix to prepare OF support
> 
> Wasn't that clear enough?
> 

Ugh, somehow I managed to miss that.

Sorry for the noise,
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
