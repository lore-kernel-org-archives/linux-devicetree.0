From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 3/5] dt-bindings: arm: Document Socionext MB86S71 and
 Fujitsu F-Cue
Date: Mon, 13 Nov 2017 16:40:36 +0100
Message-ID: <4c5fdcbd-057f-12a2-55f4-ff5f85b80f64@suse.de>
References: <20170625170020.11791-1-afaerber@suse.de>
 <20170625170020.11791-4-afaerber@suse.de>
 <20170628164605.2gnvrv4g7jluzyrm@rob-hp-laptop>
 <CAK7LNATqjOMUajUCYVq=L6wWVTUEc1M7Po+KQ3M3Z=A7+FHX5w@mail.gmail.com>
 <51221840-b08e-45f1-5601-937fb15f3947@suse.de>
 <CAK7LNASYvdWq5rV6q5Xf4Zqjso3H+XQY9Z6byJgcgfN7wT6fog@mail.gmail.com>
 <a39e3d09-4182-ee54-c855-3817498b306a@suse.de>
 <CAKv+Gu8fkOhQCx-BsyTkottkk63dohzSqa8RhAgTDcMVcmFbxQ@mail.gmail.com>
 <3327258c-b222-248b-9550-7620a57328f5@suse.de>
 <CAKv+Gu98dns-VoWF6xc0h_2R7SjcA3+85KVhLyLDgOBenhXJRQ@mail.gmail.com>
 <4d589d7a-2035-085e-17c4-1b88785b59f9@suse.de>
 <CAKv+Gu-m-KYnsgyFBUuez3gRhwPF=_sD4fGpE6BDugzW9NUnsA@mail.gmail.com>
 <c3c5b129-cd30-335d-80fd-05e9e4756121@suse.de>
 <CAKv+Gu_Wkdd3EdOjKJYZN5Ypjodpu5kFU=Ubg9H5e6ER3zq8Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKv+Gu_Wkdd3EdOjKJYZN5Ypjodpu5kFU=Ubg9H5e6ER3zq8Mg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Satoru OKAMOTO <okamoto.satoru-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Yang Zhang <yang.zhang-Gho8P0DEy2Vg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 06.11.2017 um 12:28 schrieb Ard Biesheuvel:
> On 6 November 2017 at 06:58, Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org> wrote:
>> Am 05.11.2017 um 04:39 schrieb Ard Biesheuvel:
> [...]
>>>
>>> Again, I am not the one who is ranting here. You hit a nerve by
>>> accusing me of 'rebelling against linux.git' while this is quite the
>>> opposite of what I am doing.
>>
>> Actually you did confirm that point by starting an argument about not
>> needing a central repository and you not liking Linux as the location.
>> That was exactly what I meant with my original comment.
>>
>> Adding Actions Semi was somewhat easy as a new vendor and now - roughly
>> a year after the board went to market - there's Linaro contributions
>> from Mani that I'm thankful for.
>>
>> Whereas patches keep falling into a dark hole when there's already other
>> work for a certain vendor, such as Marvell and now Socionext, with no
>> one feeling responsible for either taking them or saying, "hey, we're
>> not going to submit any conflicting DT bindings for SynQuacer because we
>> use ACPI, so please go ahead with proposal X, thanks for your efforts".
>>
>> Don't complain about me ranting if you belittle my volunteer work that I
>> believe Linaro and its partners should've done in the first place: If I
>> can get an initial mainline PoC done as an individual on a few
>> evenings/weekends, then the same should be super-easy for an
>> organization with lots of engineers and paying member companies.
> 
> The only person doing the ranting, rebelling and belittling in this
> thread is you. I have never commented on the nature of your work, let
> alone belittle it.

You have stated your opinion that Device Trees don't belong in a central
repository and that Linux was the wrong place for them. My contributions
to Linux have been mainly such Device Trees and bindings, such as this
patch series here. Quod erat demonstrandum.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
