From: Ding Tianhong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/3] arm64: arch_timer: Work around QorIQ Erratum
 A-008585
Date: Fri, 8 Jul 2016 08:51:37 +0800
Message-ID: <577EF919.4040809@huawei.com>
References: <1467412897-15220-1-git-send-email-oss@buserror.net>
 <1467412897-15220-3-git-send-email-oss@buserror.net>
 <577E2226.3020902@huawei.com> <577E25A4.2010800@arm.com>
 <577E3EF2.9080105@huawei.com> <577E424C.5030908@arm.com>
 <577E524F.3030403@huawei.com> <1467913182.32358.68.camel@buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467913182.32358.68.camel-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016/7/8 1:39, Scott Wood wrote:
> On Thu, 2016-07-07 at 20:59 +0800, Ding Tianhong wrote:
>> On 2016/7/7 19:51, Marc Zyngier wrote:
>>>
>>> On 07/07/16 12:37, Ding Tianhong wrote:
>>>>
>>>> On 2016/7/7 17:49, Marc Zyngier wrote:
>>>>>
>>>>> What makes you think that ignoring the two bottom bits is a safe =
thing
>>>>> to do? Talking about performance when the HW has such a dramatic =
bug
>>>>> is
>>>>> like putting a bigger engine on a car that has no brakes: you jus=
t hit
>>>>> the wall quicker.
>>>>>
>>>>> Thanks,
>>>>>
>>>> I have a chip which has the same problem like Scott's chip, and I
>>>> wish to solve this problem in the same way, our chip designer told=
 me
>>>> that if you got a wrong value from the cntvct_el0, you would not g=
et
>>>> a wrong value until 8 cycles later, so I could ignoring the lowest=
 3
>>>> bits if I reading twice together.
>>> Is that CPU cycles? Or timer cycles? What guarantees do you have th=
at
>>> the two reads are *always* done in the right timing window?
>>>
>> The timer counter only use 56 bits in aarch64, my chip would change =
one of
>> the higher=20
>> bit(55 to 3) to a wrong value when occur bug, so there will be more =
than 8
>> cycles between
>> correct value and wrong value from the timer counter. Maybe Scott's =
problem
>> is not just like
>> mine.
>=20
> It's not like yours.  Most errors I saw were time going backwards by =
1, 3, or
> 7 cycles (with occasional larger errors).
>=20
Looks more series, agree with your solution, thanks=E3=80=82

Thanks.
Ding
> -Scott
>=20
>=20
> .
>=20


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
