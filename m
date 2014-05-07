From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: KConfig and DTS files
Date: Wed, 07 May 2014 16:06:49 -0700
Message-ID: <536ABC89.8060301@boundarydevices.com>
References: <536A697D.3020002@boundarydevices.com>	<142702592.Qpp2HrZZke@wuerfel>	<536A8456.1040208@boundarydevices.com>	<5898724.4EExDycMZy@wuerfel>	<536A8F03.5070509@boundarydevices.com> <CAJAp7OjNdmsomhm9jJ9-jP01z1Uz9snVgRCD07zOFdMYAhQ6Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJAp7OjNdmsomhm9jJ9-jP01z1Uz9snVgRCD07zOFdMYAhQ6Lw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 05/07/2014 03:20 PM, Bjorn Andersson wrote:
> On Wed, May 7, 2014 at 12:52 PM, Eric Nelson
> <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org> wrote:
> [...]
>>
>> I still wonder about the choice of not allowing inclusion
>> of at least include/generated/autoconf.h.
>
> Because what you just showed is the use case where you have 1 defconfig, build 1
> zImage and then you can have a completely separate delivery of X number of
> dtbs, all defining some variant of your original board.
> All without recompiling, or even have the source available.
>

I agree that there's some benefit in being able to generate
different DTBs, and it's an advantage (size, speed) to customize
the .config as well.

When those clearly go together, it seems natural to define them as
such.

I've heard (and appreciate) the pointers about how to get
past our current issue(s), but what's the rationale
for not allowing the inclusion of autoconf.h and
conditionals in the DTS?

Is it a concern that things will become polluted and
hard to read?

Please advise,


Eric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
