From: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] extcon: cros-ec: Add extcon-cros-ec driver to
 support display out.
Date: Thu, 13 Jul 2017 12:45:35 +0200
Message-ID: <CAFqH_51ZsAtcc-tfVygLnvBeijuAWu=q+nJB-zymwenGPfCn-g@mail.gmail.com>
References: <20170301111943.12170-1-enric.balletbo@collabora.com>
 <CGME20170301112844epcas4p34012f1564f1145f8d8a8967f4fe9a821@epcas4p3.samsung.com>
 <20170301111943.12170-2-enric.balletbo@collabora.com> <58B7C9BF.1040708@samsung.com>
 <58E44698.5020605@samsung.com> <b0a76ac2-b524-23b3-ef58-22114e8bf209@collabora.com>
 <59240507.1040005@samsung.com> <3f4c4b85-e9db-0531-e3da-2e671a8fa750@collabora.com>
 <592407B4.5040108@samsung.com> <CANLzEktUM4sitQFRTTbDZm6WsTSA8bAohAr-x_y0szkF9GmRVw@mail.gmail.com>
 <CAFqH_50v+7aAUro8QFsLX82gHwuM58Q8bpRTw7j1vXcexGLYQA@mail.gmail.com> <59674ABC.1000102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59674ABC.1000102-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-07-13 12:26 GMT+02:00 Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
> Hi Enric,
>
> On 2017=EB=85=84 07=EC=9B=94 12=EC=9D=BC 19:28, Enric Balletbo Serra wrot=
e:
>> Hi Chanwoo,
>>
>> 2017-05-24 0:24 GMT+02:00 Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>:
>>> Hi Chanwoo,
>>>
>>>
>>> On Tue, May 23, 2017 at 2:58 AM, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> w=
rote:
>>>
>>>> OK. This patch must need the immutable branch.
>>>>
>>>> I expect that some maintainer will make the immutable branch
>>>> and then send pull request to other maintainer related to them.
>>>>
>>>
>>> I'll create an immutable branch with this this week. Thank you!
>>>
>>
>> The patch that was required for this series [1] is currently merged in
>> mainline, so I think this can go for the next merge window. Want you I
>> rebase these patches on top and resend or you want just pick-up these?
>
> I didn't receive the any mail/info about immutable branch.
>
> It is late to merge this patch to v4.13-rc1. The merge window already ope=
ned.
> because I sent the extcon's pull request to GregKH for v4.13-rc1.
>
> After releasing the v4.13-rc1, please resend these patches.
> I'll apply them on v4.14 queue.
>

Perfect, v4.14 it's fine, I'll resend once this merge window closes.

Thanks,
 Enric

>>
>> Best regards,
>>  Enric
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/drivers/platform/chrome?id=3D68c35ea25bdd4ad10445c4c02f7d48b3dccab8cc
>>
>>
>>> Benson
>>>
>>> --
>>> Benson Leung
>>> Staff Software Engineer
>>> Chrome OS Kernel
>>> Google Inc.
>>> bleung-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
>>> Chromium OS Project
>>> bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
>>
>>
>>
>
>
> --
> Best Regards,
> Chanwoo Choi
> Samsung Electronics
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
