From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 10/19] ARM: dts: at91: replace gpio-key,wakeup with
 wakeup-source property
Date: Wed, 21 Oct 2015 12:13:54 +0100
Message-ID: <56277372.6080203@arm.com>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-11-git-send-email-sudeep.holla@arm.com>
 <5627672D.60108@atmel.com> <56276832.9040006@arm.com>
 <CAPDyKFq8CfzVPPCz=1AxZM3wsw8pkOPG6Ua_5spDuYa=Gzshrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPDyKFq8CfzVPPCz=1AxZM3wsw8pkOPG6Ua_5spDuYa=Gzshrw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 21/10/15 12:01, Ulf Hansson wrote:
> On 21 October 2015 at 12:25, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrot=
e:
>>
>>
>> On 21/10/15 11:21, Nicolas Ferre wrote:
>>>
>>> Le 21/10/2015 12:10, Sudeep Holla a =C3=A9crit :
>>>>
>>>> Though the keyboard driver for GPIO buttons(gpio-keys) will contin=
ue to
>>>> check for/support the legacy "gpio-key,wakeup" boolean property to
>>>> enable gpio buttons as wakeup source, "wakeup-source" is the new
>>>> standard binding.
>>>>
>>>> This patch replaces the legacy "gpio-key,wakeup" with the unified
>>>> "wakeup-source" property in order to avoid any futher copy-paste
>>>> duplication.
>>>>
>>>> Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>>
>>>
>>> I'm not against this if the whole series goes further.
>>> Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>>
>>
>> Thanks !
>>
>>> I suspect that we would need to take this patch with us on the AT91
>>> branches that would go to arm-soc. Is it the intentions?
>>>
>>
>> Yes that was my intention for splitting the patches per SoC group.
>> Many SoC maintainers prefer that.
>
> Hold on! All patches that changes the DT parsing to accept the
> "standardized wakeup-source" binding, need to be merged upstream
> before corresponding DTS changes.
>

Agreed. Sorry for that I forgot about it as there are only few
subsystems that needed additions. Most of the input subsystem had
already moved to new binding, just that binding documents were left
unchanged.

> Therefore, I suggest we go for a two step approach, starting with
> changes affecting the DT parsing/documentation for various
> drivers/subsystem and perhaps we can reach 4.4 for these.
> Then the DTS changes can go in at any later point.
>

Looks good to me.

--=20
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
