From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v1 0/4] Add Rockchip RGA support
Date: Mon, 28 Mar 2016 22:35:36 +0100
Message-ID: <CACvgo52vL5_HQfgfnxRMzSJXYw-sWT3QozZaWswQXHr9-bwBSA@mail.gmail.com>
References: <1458552518-25527-1-git-send-email-ykk@rock-chips.com>
	<1867694.1mDULrSexE@phil>
	<CACvgo513q-Vtm2wG4Cwh4G1u0OUNVAAFmHFv-kg4fHDEy7i_eg@mail.gmail.com>
	<13797722.SiyveTZ1bB@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <13797722.SiyveTZ1bB@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-rockchip <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28 March 2016 at 19:44, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> Am Montag, 28. M=C3=A4rz 2016, 13:21:02 schrieb Emil Velikov:
>> On 22 March 2016 at 00:42, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
>> > Hi Yakir,
>> >
>> > Am Montag, 21. M=C3=A4rz 2016, 20:17:46 schrieb Yakir Yang:
>> >> On 03/21/2016 07:29 PM, Heiko St=C3=BCbner wrote:
>> >> > Am Montag, 21. M=C3=A4rz 2016, 17:28:38 schrieb Yakir Yang:
>> >> >> This patch set would add the RGA direct rendering based 2d gra=
phics
>> >> >> acceleration module.
>> >> >
>> >> > very cool to see that.
>> >>
>> >> ;)
>> >>
>> >> >> This patch set is based on git repository below:
>> >> >> git://people.freedesktop.org/~airlied/linux drm-next
>> >> >> commit id: 568d7c764ae01f3706085ac8f0d8a8ac7e826bd7
>> >> >>
>> >> >> And the RGA driver is based on Exynos G2D driver, it only mana=
ges the
>> >> >> command lists received from user, so user should make the comm=
and list
>> >> >> to data and registers needed by operation to use.
>> >> >>
>> >> >> I have prepared an userspace demo application for testing:
>> >> >>    https://github.com/yakir-Yang/libdrm-rockchip
>> >> >>
>> >> >> That is a rockchip libdrm library, and I have write a simple t=
est case
>> >> >> "rockchip_rga_test" that would test the below RGA features:
>> >> >> - solid
>> >> >> - copy
>> >> >> - rotation
>> >> >> - flip
>> >> >> - window clip
>> >> >> - dithering
>> >> >
>> >> > Did you submit your libdrm changes as well?
>> >> >
>> >> > Userspace-interfaces need to be stable so the other side must a=
lso get
>> >> > accepted - even before the kernel change if I remember correctl=
y.
>> >>
>> >> Got it, and I just saw exynos_fimg2d already landed at mainline l=
ibdrm.
>> >> But I don't find the way to submit patches to libdrm, would you l=
ike
>> >> share some helps here ;)
>> >
>> > Looking at the libdrm sources on cgit.freedesktop.org, I did not f=
ind any
>> > specific manual on submitting patches.
>> >
>> > But looking at the dri-list archive, dri-devel-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org=
rg is
>> > the
>> > right list and looking at the libdrm history it looks like Emil Ve=
likov
>> > <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> seems to be doing maintenance-stuff in =
libdrm.
>> > And as a 3rd recipient, please also include the linux-rockchip lis=
t.
>> >
>> > @Emil, please shout if I read that wrong :-)
>>
>> You got it spot on Heiko. There are a few notes though...
>>
>> As one reuses the existing hardware/IP block, it would be better to
>> avoid copy/pasting code around.
>> Namely:
>>  - (if possible) factor out the exynos g2d kernel functionality to a
>> separate kernel module and wire up the rockhip (via dt ?) to use it
>>  - factor out the g2d specifics out of exynos_drm.h (into
>> exynos_g2d_drm.h perhaps ?) and make sure exynos_drm.h includes the
>> new header
>
> I think the IP blocks themself are quite different between Rockchip's=
 RGA and
> Samsung's g2d and I guess the similarities are more along the lines o=
n how
> that gets integrated into the respective drm driver and userspace.
>
In this case, the exynos_g2d_drm.h seems like a good idea. As I'm
obviously biased, it's better to check how others feel on the topic.

>
>>  - if neither of these are possible, then please ensure that the new
>> header uses correct types (see the docs [1]), use MIT/X11 license (i=
f
>> possible) and link where upstream userspace is happy with the
>> interface (ideally more than a simple test app like libdrm)
>> These might sound like an overkill, although getting UAPI right and
>> maintaining it forever forces us to do so.
>
> As for a real-world usecase, maybe the armsoc xserver might be somewh=
at easy
> to use. While the core changes I did are in the core project already,=
 I'm
> still keeping the actual Rockchip support separate [0] due to the not=
-yet-
> resolved create_gem ioctl.
>
> Anyway, the armsoc xserver has some exa implementation hooks were I g=
uess it
> might be relatively easy to hook up soc-specific things.
>
Ouch the armsoc ddx... Last time I've checked it felt like a place
where everyone is doing his own thing, with no actual reviews and/or
maintainer. Iirc most/all of it's functionality was achievable with
modesetting ddx (with or without glamor) ? I take it that things have
changed and/or I misunderstood something ?

Note: The above is not meant as bashing although it hell sure looks lik=
e one.

Cheers
Emil

> [0] https://github.com/mmind/xf86-video-armsoc/tree/devel/rockchip
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
