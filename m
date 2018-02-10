From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] Fix broken bananapi m2 devicetree/regulators
Date: Sat, 10 Feb 2018 23:07:01 +0100
Message-ID: <da8909da-4eea-0fdf-e104-4442f7986455@gmail.com>
References: <20180209175236.21215-1-embed3d@gmail.com>
 <160b60e2-6e50-0d63-e6ac-b67e10317e12@orpaltech.com>
 <d3fcc9d2-f2e6-189c-529f-890f2afdd837@gmail.com>
 <40887d4b-0fb0-239e-e5a9-1a87f82946c2@orpaltech.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD257DPK24NRBCG27XJQKGQEXUWHEFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <40887d4b-0fb0-239e-e5a9-1a87f82946c2-RHPENKW2UW+1Z/+hSey0Gg@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Sergey Suloev <ssuloev-RHPENKW2UW+1Z/+hSey0Gg@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10.02.2018 22:08, Sergey Suloev wrote:
> On 02/11/2018 12:01 AM, Philipp Rossak wrote:
>> Hey Sergey,
>>
>> Thanks for mentioning, but I think the problem has nothing to do with=20
>> those patches. I tested them with the v4.15.0 Kernel since this is the=
=20
>> last stable release and we are right now in the merging window.
>>
>> I tested the latest mainline, without those patches and the kernel is=20
>> not booting (I can't see any uart output).
>>
>> Thanks,
>> Philipp
>>
>> On 10.02.2018 14:56, Sergey Suloev wrote:
>>> On 02/09/2018 08:52 PM, Philipp Rossak wrote:
>>>> This patchseries fixes the bananapi m1 devicetree, to be able to=20
>>>> boot again.
>>>> The first two patches update/improve the devicetree and the last=20
>>>> patch adds
>>>> all missing regulators.
>>>>
>>>> Regards,
>>>> Philipp
>>>>
>>>> Philipp Rossak (3):
>>>> =C2=A0=C2=A0 arm: dts: sun6i: a31s: bpi-m2: update mmc supply nodes
>>>> =C2=A0=C2=A0 arm: dts: sun6i: a31s: bpi-m2: improve pmic properties
>>>> =C2=A0=C2=A0 arm: dts: sun6i: a31s: fix: bpi-m2: add missing regulator=
s
>>>>
>>>> =C2=A0 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts | 70=20
>>>> +++++++++++++++++++++++-
>>>> =C2=A0 1 file changed, 67 insertions(+), 3 deletions(-)
>>>>
>>> patches are not working
>>>
>>> Thanks
>>>
> same problem, but after applying the patches my device is till hanging.
>=20
>=20
Can you please share a bootlog? Here is mine [1]. As you can see I'm=20
able to boot.
I build it with this branch [2]. For testing you should replace the dtb=20
and the uImage/zImage

Philipp


[1]: https://pastebin.com/mVjv3LDf
[2]: https://github.com/embed-3d/linux/tree/testing/bpi-m2-regulator-test-2

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
