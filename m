From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 4/5] mfd: arizona: Update DT binding documentation for
 mic detection
Date: Tue, 13 Oct 2015 19:11:57 +0900
Message-ID: <561CD8ED.7030004@samsung.com>
References: <1443803363-3251-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1443803363-3251-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20151007100017.GB12635@sirena.org.uk> <20151007122642.GH17172@x1>
 <20151012084554.GB8805@ck-lbox> <561B8896.7040409@samsung.com>
 <561B8AA6.50503@samsung.com> <20151013080350.GW17172@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20151013080350.GW17172@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 10=EC=9B=94 13=EC=9D=BC 17:03, Lee Jones wrote:
> On Mon, 12 Oct 2015, Chanwoo Choi wrote:
>=20
>> On 2015=EB=85=84 10=EC=9B=94 12=EC=9D=BC 19:16, Chanwoo Choi wrote:
>>> Hi Charles,
>>>
>>> On 2015=EB=85=84 10=EC=9B=94 12=EC=9D=BC 17:45, Charles Keepax wrot=
e:
>>>> On Wed, Oct 07, 2015 at 01:26:42PM +0100, Lee Jones wrote:
>>>>> On Wed, 07 Oct 2015, Mark Brown wrote:
>>>>>
>>>>>> On Fri, Oct 02, 2015 at 05:29:22PM +0100, Charles Keepax wrote:
>>>>>>> Add additional bindings to allow configuration of the system sp=
ecific
>>>>>>> microphone detection settings.
>>>>>>
>>>>>> This all seems pretty much fine to me - the things it is control=
ling are
>>>>>> fairly specific to the way the former Wolfson devices do, they o=
nly
>>>>>> really make sense with a fairly particular algorithm which isn't=
 widely
>>>>>> implemented.
>>>>>
>>>>> Is that an Ack?
>>>>
>>>> I am guessing Mark is slightly hesitant to ack as he probably
>>>> doesn't want to add reviewing all our jack detection bindings to
>>>> his already fairly sizable work load and doing so here likely
>>>> means it will be expected in the future. From talking to people at
>>>> LinuxCon it looks like it is pretty unlikely the DT maintainers
>>>> will be acking individual bindings as well, basically they are
>>>> only really looking at major/framework things and leaving the
>>>> rest to subsystem maintainers.
>>>>
>>>> Given that these patches only touch MFD/Extcon and extcon
>>>> is a subsystem designed to handle things like jack detection
>>>> isn't it really sufficient that you and Chanwoo have looked this
>>>> and are happy with it? Otherwise I really don't see anyway to
>>>> move this forward and would appreciate any suggestions?
>>>
>>> I'm positive about your patches. After receiving the ack from MFD m=
aintainer
>>> I want to apply this patch-set on extcon git repository.
>>>
>>> Also, I reviewed this patch on previous patch[1].
>>> [1]https://lkml.org/lkml/2015/9/11/81
>>
>> As you said, this patch touch MFD and EXTCON subsystem.
>> If you get the Ack or agreement from MFD maintainer,
>> I'm willing to apply it on extcon git.
>>
>> Also, If this patch dont receive the additional ack message
>> unitl the end of this week, I'll merge patch1-3 on extcon-next branc=
h
>> for Linux 4.4.
>=20
> Absolutely not!
>=20
> I should be extremely cross if you 'go over my head' and apply MFD
> patches without the correct Acks.
>=20

Just I mean that if there is any reply or opinion about patch.
But, You're right. It is misconception of me. We should check them cros=
s before applying them.

Thanks,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
