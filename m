From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/5] arm: allwinner: a64: drop the dummy
 vcc3v3 regulator in Pine64 DT
Date: Mon, 24 Jul 2017 00:24:32 +0100
Message-ID: <2b0358ba-e851-ba9d-f643-dd60138a0b55@arm.com>
References: <20170719161019.62133-1-icenowy@aosc.io>
 <20170719161019.62133-3-icenowy@aosc.io>
 <4e2c9486-9c0d-14e9-62e7-8642758c5472@arm.com>
 <7FACC99F-F900-437B-9642-741D7D980D25@aosc.io>
 <493424f1-6df3-ec19-a7cf-f76706cb2c51@arm.com>
 <20170721143858.3hufnu7v3ki6xmgf@flea>
 <0d30c993-a3a4-3923-b112-e65d1ea97cce@arm.com>
 <20170721203933.l4thb6hjc6elsnjw@flea>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDNZNK75ZIKRB47B2TFQKGQESJO7AFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170721203933.l4thb6hjc6elsnjw@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "agraf-l3A5Bk7waGM@public.gmane.org" <agraf-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 21/07/17 21:39, Maxime Ripard wrote:

Hi Maxime,

sorry for causing some frustration on your side.
I am trying to answer to some of your comments. Just be aware that I am
leaving for holidays in a few hours (and trying to stay away as much
from computers as possible), so don't expect any replies in the next
three weeks.

> On Fri, Jul 21, 2017 at 04:08:42PM +0100, Andre Przywara wrote:
>> On 21/07/17 15:38, Maxime Ripard wrote:
>>> On Fri, Jul 21, 2017 at 02:02:18PM +0100, Andre Przywara wrote:
>>>> On 21/07/17 13:49, Icenowy Zheng wrote:
>>>>> =E4=BA=8E 2017=E5=B9=B47=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=
=8D=888:45:39, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> =E5=86=99=E5=88=B0:
>>>>>> On 19/07/17 17:10, Icenowy Zheng wrote:
>>>>>>> The Pine64 DT used to contain a dummy vcc3v3 regulator, in order to
>>>>>>> satisfy some device nodes when proper AXP803 regulator support is
>>>>>>> available. It's in fact the DCDC1 regulator of AXP803.
>>>>>>>
>>>>>>> Drop the dummy regulator, and fix the reference of this regulator t=
o
>>>>>>> DCDC1.
>>>>>>
>>>>>> Do we really need to have this?
>>>>>> While I see that this is technically correct, it breaks older kernel=
s,
>>>>>> which miss the AXP driver. So we can't use this DT for syncing it in=
to
>>>>>> U-Boot anymore, while still expecting various kernels (for instance
>>>>>> from
>>>>>> distribution installers) to work via UEFI (for which U-Boot provides
>>>>>> the
>>>>>> DT). That would be a shame, because we start to see generic arm64
>>>>>> distribution installers to work out of the box.
>>>>>>
>>>>>> I see these solutions:
>>>>>> 1) We drop this patch, instead add a comment that technically it's
>>>>>> DCDC1. I believe we can't really turn off DCDC1 anyway.
>>>>>> 2) We keep theses patches, but don't sync them to U-Boot to have a
>>>>>> universal DT in there which works with every kernel.
>>>>>> 3) We keep these patches *and* sync them to U-Boot, but add the fixe=
d
>>>>>> regulator back in via a U-Boot specific .dtsi "overlay" snippet. Thi=
s
>>>>>> would take care of the parts that break compatibility. The end resul=
t
>>>>>> would be similar to 2), then.
>>>>>>
>>>>>> The easiest and most maintainable would be 1), but I am OK with 3) a=
s
>>>>>> well, though I am not sure this won't get messy in the future and wi=
ll
>>>>>> work for every change that we make.
>>>>>>
>>>>>> What do you think?
>>>>>
>>>>> 4) Do nothing.
>>>>>
>>>>> We only promise old DTs will run with newer kernel, but
>>>>> we don't promise newer DTs to run with old kernel.And
>>>>> U-Boot is intended to update less frequently than Linux.
>>>>>
>>>>> When updateing U-Boot, please update kernel as well.
>>>>
>>>> Which means you tie your firmware to a kernel. I know this is the old
>>>> embedded approach, but we should really get rid of this, as I don't se=
e
>>>> how this will work nicely with the Pinebook, for instance (which is no=
t
>>>> really "embedded" anymore).
>>>>
>>>> U-Boot sits on the SPI flash there, and you are expected to just run a=
ny
>>>> (not only Linux) distribution from a USB pen drive, for instance, with
>>>> that one firmware version, using UEFI. This already works today, but i=
s
>>>> only sustainable if we have forward DT compatibility as well.
>>>
>>> We've been discussing this over and over and over again.
>>
>> Don't tell me ;-)
>> But apart from "We don't care" I haven't got a real solution out of this
>> discussion.

I just see that "We don't care" might be (mis-)understood as offensive,
apologies for that. What I meant is that in the past there was no answer
to the problem of how to handle *multiple* kernels with *one* DTB
provided by *firmware*. I consider this approach actually the actual
(original) DT use case, though I see that for many ARM platforms this
was never adopted this way.
So "We don't care" referred to the problem being dismissed as being a
real issue, which I find quite sad.

> You're looking for a solution to an industry-wide problem, without
> fixing the industry first. Make the thousands-engineers companies
> heavily involved in mainlining their stuff (you know, the Qualcomm,
> Mediatek [1], Microchip [2], Marvell [3], Rockchip, you name it)
> comply with these arbitrarily made up rules.
>=20
> And then the handful people working on their spare time will follow.

I see that this is indeed part of a bigger discussion, but I am not sure
this should prevent me from commenting on this and pointing to the problems=
.
And by providing possible solutions I was hoping for being not too pesky.

>>> You're using the pinebook as an example, fine.
>>
>> I believe the current approach for supporting Allwinner boards is rooted
>> in some embedded world, where shipping firmware together with some
>> kernel is standard, especially if there is no on-board storage anyway.
>>
>> But the Pinebook is clearly not embedded and comes with SPI flash to
>> boot from, so people might expect to install some Linux distribution on =
it.
>> And with the UEFI support in U-Boot we have a good solution for this
>> (check the debian-testing arm64 installer), and so far this works: every
>> extension we did to the DT was still fine with older kernels - this
>> particular feature might not work (say Ethernet in kernels < 2.13-rc1),
>> but at least it doesn't hurt or introduces regressions.
>=20
> Unless $distribution put some man power in supporting and mainlining
> whatever they are interested in, yeah, I don't care what they think is
> best. We're not their slaves.

To be honest I don't see how distributions would be involved in this, in
a "real computers" world there certainly aren't. Here they just rely on
standard firmware interfaces to boot and find device descriptions,
without being required for explicitly support or spoon-feed particular
systems.
I understand that because of the lack of alternatives (for boards
without any on-board storage) some distributions took care of providing
firmware and device descriptions for selected (ARM based) boards, but my
impression is also that this was never really loved by them. Also this
has the nasty implication of duplicating a lot of effort.
For ARM64 it seems like most distributions never adopted this scheme,
instead relying on UEFI and firmware provided DTBs, for instance.

> And what would distributions think if we're all just tired of this and
> just quit? How would they feel about having to use a 4 years old
> kernel, without any security updates, rigged with bugs and mostly
> unmaintained?
>=20
> It's really time to get serious about this. Some of our most important
> contributors already quit because of the sh*t we take every day, I've
> thought about quitting several times in the last year. And yet, you
> regularly criticize whatever we do on our evenings without real
> documentation (adding your fair shair to the pile we take), want to
> put more maintainance burden on us, all of that without contributing
> anything significant else than "rules" that no-one else comply with?

I am not really sure what to answer here, my intention actually was to
decrease a lot of the maintenance burden we currently have (for instance
being required to add a lot of explicit kernel code for each now SoC).
And I was hoping that with the advent of the new ARM64 architecture we
could seize the chance of changing some things.

> Be reasonable for a minute.
>=20
> I did that once, because it seemed important to some people at the
> moment. It just gave us more ugly hacks, and just made our lives
> harder.
>=20
>>> Please give me the full documented, reviewed and acked-by binding
>>> for all the features the pinebook has.
>>>
>>> If you can't, this discussion is pointless, since you will expect
>>> changes in the DT.
>>
>> It's not about *changes* per se, it's about breaking compatibility,
>> which can be avoided.
>> As long as we just *add* features (DE2/HDMI, for instance) and don't
>> introduce regressions, touching the DT is fine.
>>
>> And yes: I expect some hiccups with this, but also would hope for
>> finding some solutions (like the ones sketched in my original email).
>=20
> I'm going to merge this patch unless I can see a written rule
> somewhere in our device tree documentation that prevent me from doing
> so.

I see that many more server oriented ARM64 platforms (AMD Seattle,
Cavium ThunderX, APM XGene) actually provide their DTs in firmware and
rely on stability there. But yes, I see that this is not really
documented, and I think this was considered a per-platform decision in
the past. Hopefully we actually see some more generic DT discussions and
documentation in the near future.

And merging this patch is a fair decision as a maintainer, though you
could have used fewer words to say this ;-)

Cheers,
Andre.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
