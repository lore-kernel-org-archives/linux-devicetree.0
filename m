From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v1 0/4] Add Rockchip RGA support
Date: Tue, 29 Mar 2016 14:27:29 +0100
Message-ID: <CACvgo51UVYtNoSpqnh0Hu+A-EkabVagzaSim=wf8ubsNACP0MA@mail.gmail.com>
References: <1458552518-25527-1-git-send-email-ykk@rock-chips.com>
	<1511371.I0NIYzh3kP@diego>
	<56EFE66A.8020404@rock-chips.com>
	<1867694.1mDULrSexE@phil>
	<CACvgo513q-Vtm2wG4Cwh4G1u0OUNVAAFmHFv-kg4fHDEy7i_eg@mail.gmail.com>
	<56FA69C5.5090602@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56FA69C5.5090602-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-rockchip <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Yakir,

On 29 March 2016 at 12:40, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Hi Emil,
>
> On 03/28/2016 08:21 PM, Emil Velikov wrote:
>>
>> On 22 March 2016 at 00:42, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
>>>
>>> Hi Yakir,
>>>
>>> Am Montag, 21. M=C3=A4rz 2016, 20:17:46 schrieb Yakir Yang:
>>>>
>>>> On 03/21/2016 07:29 PM, Heiko St=C3=BCbner wrote:
>>>>>
>>>>> Am Montag, 21. M=C3=A4rz 2016, 17:28:38 schrieb Yakir Yang:
>>>>>>
>>>>>> This patch set would add the RGA direct rendering based 2d graph=
ics
>>>>>> acceleration module.
>>>>>
>>>>> very cool to see that.
>>>>
>>>> ;)
>>>>
>>>>>> This patch set is based on git repository below:
>>>>>> git://people.freedesktop.org/~airlied/linux drm-next
>>>>>> commit id: 568d7c764ae01f3706085ac8f0d8a8ac7e826bd7
>>>>>>
>>>>>> And the RGA driver is based on Exynos G2D driver, it only manage=
s the
>>>>>> command lists received from user, so user should make the comman=
d list
>>>>>> to data and registers needed by operation to use.
>>>>>>
>>>>>> I have prepared an userspace demo application for testing:
>>>>>>     https://github.com/yakir-Yang/libdrm-rockchip
>>>>>>
>>>>>> That is a rockchip libdrm library, and I have write a simple tes=
t case
>>>>>> "rockchip_rga_test" that would test the below RGA features:
>>>>>> - solid
>>>>>> - copy
>>>>>> - rotation
>>>>>> - flip
>>>>>> - window clip
>>>>>> - dithering
>>>>>
>>>>> Did you submit your libdrm changes as well?
>>>>>
>>>>> Userspace-interfaces need to be stable so the other side must als=
o get
>>>>> accepted - even before the kernel change if I remember correctly.
>>>>
>>>> Got it, and I just saw exynos_fimg2d already landed at mainline li=
bdrm.
>>>> But I don't find the way to submit patches to libdrm, would you li=
ke
>>>> share some helps here ;)
>>>
>>> Looking at the libdrm sources on cgit.freedesktop.org, I did not fi=
nd any
>>> specific manual on submitting patches.
>>>
>>> But looking at the dri-list archive, dri-devel-PD4FTy7X32lNgt0PjOBp9/EVdHwE84te@public.gmane.org=
g is
>>> the
>>> right list and looking at the libdrm history it looks like Emil Vel=
ikov
>>> <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> seems to be doing maintenance-stuff in l=
ibdrm.
>>> And as a 3rd recipient, please also include the linux-rockchip list=
=2E
>>>
>>> @Emil, please shout if I read that wrong :-)
>>>
>> You got it spot on Heiko. There are a few notes though...
>>
>> As one reuses the existing hardware/IP block, it would be better to
>> avoid copy/pasting code around.
>> Namely:
>>   - (if possible) factor out the exynos g2d kernel functionality to =
a
>> separate kernel module and wire up the rockhip (via dt ?) to use it
>>   - factor out the g2d specifics out of exynos_drm.h (into
>> exynos_g2d_drm.h perhaps ?) and make sure exynos_drm.h includes the
>> new header
>>   - if neither of these are possible, then please ensure that the ne=
w
>> header uses correct types (see the docs [1]), use MIT/X11 license (i=
f
>> possible) and link where upstream userspace is happy with the
>> interface (ideally more than a simple test app like libdrm)
>
>
> Whops... you have provided the third choice, nice  :-D
>
> And I got little idea about license, where should I use the MIT/X11
> license, should I declare the MIT/X11 license in kernel uapi head
> file, but Andreas just remind that kernel do not allow to no GUN
> license. Or may be I can:
Now that's a lovely typo - (GNU vs GUN) :-)

But seriously - what makes you think that the kernel does not allow
MIT/X11 licensed code ? Most of the DRM subsystem uses it.

> 1. Use GUN license in kernel rockchip_drm.h uapi head file
> 2. Use MIT/X11 license in libdrm rockchip_drm.h head file.
>
I would suggest keeping the license the same in both places (the
libdrm ones should be a direct copy of the kernel one produced with
`make headers_install`), regardless of which one you opt for.

> And I don't understand the "link where upstream userspace is happy
> with the interface", could you reference small example here.
>
Already mentioned elsewhere but for posterity:

If designing a new interface one should provide a reference to a
maintained upstream project, where the design was approved. Reason
being is that unlike ChromeOS's kernel upstream one gets to keep its
interfaces forever. And yes, I realise that CrOS folks are trying
really hard to upstream things and use vanilla kernel.

Regards,
Emil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
