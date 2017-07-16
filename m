From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v2 1/2] extcon: cros-ec: Add extcon-cros-ec driver to
 support display out.
Date: Sun, 16 Jul 2017 15:01:44 +0900
Message-ID: <CAGTfZH2TCMcb6jymvq4-S9ORmkfaGu8=hSfbx=nmkW3rYbKjbg@mail.gmail.com>
References: <20170301111943.12170-1-enric.balletbo@collabora.com>
 <CGME20170301112844epcas4p34012f1564f1145f8d8a8967f4fe9a821@epcas4p3.samsung.com>
 <20170301111943.12170-2-enric.balletbo@collabora.com> <58B7C9BF.1040708@samsung.com>
 <58E44698.5020605@samsung.com> <b0a76ac2-b524-23b3-ef58-22114e8bf209@collabora.com>
 <59240507.1040005@samsung.com> <3f4c4b85-e9db-0531-e3da-2e671a8fa750@collabora.com>
 <592407B4.5040108@samsung.com> <CANLzEktUM4sitQFRTTbDZm6WsTSA8bAohAr-x_y0szkF9GmRVw@mail.gmail.com>
 <CAFqH_50v+7aAUro8QFsLX82gHwuM58Q8bpRTw7j1vXcexGLYQA@mail.gmail.com>
 <59674ABC.1000102@samsung.com> <CAFqH_51ZsAtcc-tfVygLnvBeijuAWu=q+nJB-zymwenGPfCn-g@mail.gmail.com>
Reply-To: cwchoi00@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqH_51ZsAtcc-tfVygLnvBeijuAWu=q+nJB-zymwenGPfCn-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Guenter Roeck <groeck@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Enric,

On Thu, Jul 13, 2017 at 7:45 PM, Enric Balletbo Serra
<eballetbo@gmail.com> wrote:
> 2017-07-13 12:26 GMT+02:00 Chanwoo Choi <cw00.choi@samsung.com>:
>> Hi Enric,
>>
>> On 2017=EB=85=84 07=EC=9B=94 12=EC=9D=BC 19:28, Enric Balletbo Serra wro=
te:
>>> Hi Chanwoo,
>>>
>>> 2017-05-24 0:24 GMT+02:00 Benson Leung <bleung@chromium.org>:
>>>> Hi Chanwoo,
>>>>
>>>>
>>>> On Tue, May 23, 2017 at 2:58 AM, Chanwoo Choi <cw00.choi@samsung.com> =
wrote:
>>>>
>>>>> OK. This patch must need the immutable branch.
>>>>>
>>>>> I expect that some maintainer will make the immutable branch
>>>>> and then send pull request to other maintainer related to them.
>>>>>
>>>>
>>>> I'll create an immutable branch with this this week. Thank you!
>>>>
>>>
>>> The patch that was required for this series [1] is currently merged in
>>> mainline, so I think this can go for the next merge window. Want you I
>>> rebase these patches on top and resend or you want just pick-up these?
>>
>> I didn't receive the any mail/info about immutable branch.
>>
>> It is late to merge this patch to v4.13-rc1. The merge window already op=
ened.
>> because I sent the extcon's pull request to GregKH for v4.13-rc1.
>>
>> After releasing the v4.13-rc1, please resend these patches.
>> I'll apply them on v4.14 queue.
>>
>
> Perfect, v4.14 it's fine, I'll resend once this merge window closes.

v4.13-rc1 was released. Please resend these patches and then I'll merge the=
m.

>
> Thanks,
>  Enric
>
>>>
>>> Best regards,
>>>  Enric
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/drivers/platform/chrome?id=3D68c35ea25bdd4ad10445c4c02f7d48b3dccab8c=
c
>>>
>>>
>>>> Benson
>>>>
>>>> --
>>>> Benson Leung
>>>> Staff Software Engineer
>>>> Chrome OS Kernel
>>>> Google Inc.
>>>> bleung@google.com
>>>> Chromium OS Project
>>>> bleung@chromium.org
>>>
>>>
>>>
>>
>>
>> --
>> Best Regards,
>> Chanwoo Choi
>> Samsung Electronics



--=20
Best Regards,
Chanwoo Choi
Samsung Electronics
