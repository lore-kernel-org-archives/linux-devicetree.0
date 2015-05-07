From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: device tree compiler with overlay support?
Date: Thu, 7 May 2015 15:22:59 +0200
Message-ID: <CAOMqctQfTR4Byj=9Nf5Zu5fxFL8VKuz2SjR-xgHJvqT6SRfmyg@mail.gmail.com>
References: <CAOMqctSZObmoJQocCg3JvCA=ZDvvrxzKC9Ko=aq0J=LphNW+EA@mail.gmail.com>
 <CAOMqctT3WuqMTqaqUTN44zA2TEYmP9X7SN8ufTouQFoy=GjB1Q@mail.gmail.com>
 <CAMuHMdU=WySZ8kfaVmU6Bed=ofvrDQ9s51m7zyXN0qu-G-d4cg@mail.gmail.com>
 <E8C27FD0-CF22-4D8F-AC05-55518BEF4B84@konsulko.com> <CAOMqctRPiPFtNAMBa5eZx=erL4xtohMxXAeFeMG-7KZaRxDnew@mail.gmail.com>
 <67E0CBA3-C499-4A98-9F23-E228E334546D@konsulko.com> <CAOMqctQUhV6=YyyZNT7Kzmd5pYYaYNxA2F+c9RCH98fUabzMUg@mail.gmail.com>
 <CAOMqctR5ZmgCQNqzoZv6hwAJ0h-r89fPabkK6hVCVeS2io7+Eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMqctR5ZmgCQNqzoZv6hwAJ0h-r89fPabkK6hVCVeS2io7+Eg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7 May 2015 at 12:24, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> On 7 May 2015 at 10:28, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 7 May 2015 at 10:09, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:

>>> If you were to share some details of what you=E2=80=99re trying to =
achieve I might be able to help.
>>>
>>> I have no clue what you guys are trying to do :)
>>>
>>
>> I am trying to load overlays at runtime to see if that's usable for =
something.
>
> So I tried to cherry-pick some more of your patches and I have a few
> observations.
>

>
> When I cat /sys/firmware/devicetree/overlays/0/targets the kernel
> detects a deadlock. /sys/firmware/devicetree/overlay-control/list
> provides same information without deadlock but I am not sure I have
> everything locked properly.
>

=46or some reason it deadlocks against the dt unittests which never
finish. So the workaround is to disable unittests. Why the unittest
locks up needs investigating, though.

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
