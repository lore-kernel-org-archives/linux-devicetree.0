From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC PATCH v1 0/4] Add Rockchip RGA support
Date: Tue, 29 Mar 2016 13:47:38 +0200
Message-ID: <9142448.GZtlcyxafd@diego>
References: <1458552518-25527-1-git-send-email-ykk@rock-chips.com> <CACvgo52vL5_HQfgfnxRMzSJXYw-sWT3QozZaWswQXHr9-bwBSA@mail.gmail.com> <56FA6438.7060508@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56FA6438.7060508@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>, David Airlie <airlied@linux.ie>, Mark Yao <mark.yao@rock-chips.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Russell King <linux@arm.linux.org.uk>, devicetree <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>, linux-rockchip <linux-rockchip@lists.infradead.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am Dienstag, 29. M=E4rz 2016, 19:17:12 schrieb Yakir Yang:
> Hi Emil & Heiko,
>=20
> On 03/29/2016 05:35 AM, Emil Velikov wrote:
> > On 28 March 2016 at 19:44, Heiko St=FCbner <heiko@sntech.de> wrote:
> >> Am Montag, 28. M=E4rz 2016, 13:21:02 schrieb Emil Velikov:
> >>> On 22 March 2016 at 00:42, Heiko Stuebner <heiko@sntech.de> wrote=
:
> >>>> Hi Yakir,
> >>>>=20
> >>>> Am Montag, 21. M=E4rz 2016, 20:17:46 schrieb Yakir Yang:
> >>>>> On 03/21/2016 07:29 PM, Heiko St=FCbner wrote:
> >>>>>> Am Montag, 21. M=E4rz 2016, 17:28:38 schrieb Yakir Yang:
> >>>>>>> This patch set would add the RGA direct rendering based 2d gr=
aphics
> >>>>>>> acceleration module.
> >>>>>>=20
> >>>>>> very cool to see that.
> >>>>>=20
> >>>>> ;)
> >>>>>=20
> >>>>>>> This patch set is based on git repository below:
> >>>>>>> git://people.freedesktop.org/~airlied/linux drm-next
> >>>>>>> commit id: 568d7c764ae01f3706085ac8f0d8a8ac7e826bd7
> >>>>>>>=20
> >>>>>>> And the RGA driver is based on Exynos G2D driver, it only man=
ages
> >>>>>>> the
> >>>>>>> command lists received from user, so user should make the com=
mand
> >>>>>>> list
> >>>>>>> to data and registers needed by operation to use.
> >>>>>>>=20
> >>>>>>> I have prepared an userspace demo application for testing:
> >>>>>>>     https://github.com/yakir-Yang/libdrm-rockchip
> >>>>>>>=20
> >>>>>>> That is a rockchip libdrm library, and I have write a simple =
test
> >>>>>>> case
> >>>>>>> "rockchip_rga_test" that would test the below RGA features:
> >>>>>>> - solid
> >>>>>>> - copy
> >>>>>>> - rotation
> >>>>>>> - flip
> >>>>>>> - window clip
> >>>>>>> - dithering
> >>>>>>=20
> >>>>>> Did you submit your libdrm changes as well?
> >>>>>>=20
> >>>>>> Userspace-interfaces need to be stable so the other side must =
also
> >>>>>> get
> >>>>>> accepted - even before the kernel change if I remember correct=
ly.
> >>>>>=20
> >>>>> Got it, and I just saw exynos_fimg2d already landed at mainline
> >>>>> libdrm.
> >>>>> But I don't find the way to submit patches to libdrm, would you=
 like
> >>>>> share some helps here ;)
> >>>>=20
> >>>> Looking at the libdrm sources on cgit.freedesktop.org, I did not=
 find
> >>>> any
> >>>> specific manual on submitting patches.
> >>>>=20
> >>>> But looking at the dri-list archive, dri-devel@lists.freedesktop=
=2Eorg is
> >>>> the
> >>>> right list and looking at the libdrm history it looks like Emil =
Velikov
> >>>> <emil.l.velikov@gmail.com> seems to be doing maintenance-stuff i=
n
> >>>> libdrm.
> >>>> And as a 3rd recipient, please also include the linux-rockchip l=
ist.
> >>>>=20
> >>>> @Emil, please shout if I read that wrong :-)
> >>>=20
> >>> You got it spot on Heiko. There are a few notes though...
> >>>=20
> >>> As one reuses the existing hardware/IP block, it would be better =
to
> >>> avoid copy/pasting code around.
> >>>=20
> >>> Namely:
> >>>   - (if possible) factor out the exynos g2d kernel functionality =
to a
> >>>=20
> >>> separate kernel module and wire up the rockhip (via dt ?) to use =
it
> >>>=20
> >>>   - factor out the g2d specifics out of exynos_drm.h (into
> >>>=20
> >>> exynos_g2d_drm.h perhaps ?) and make sure exynos_drm.h includes t=
he
> >>> new header
> >>=20
> >> I think the IP blocks themself are quite different between Rockchi=
p's RGA
> >> and Samsung's g2d and I guess the similarities are more along the =
lines
> >> on how that gets integrated into the respective drm driver and
> >> userspace.
> Yes, the hardware IP blocks is quite different. I just reference two =
things
> from Exynos g2d code:
> 1. UAPI side: let userspace pass the detail mode tranform register se=
tting
>      to kernel directly, so we don't need to pass the rendering
> parameters to
>      kernel, just simplify the ioctl parameters.
>=20
> 2. Kernel side: reference the cmdlist manager method. Two simply task=
: one
>      for collecting the userspace register setting, another start
> rendering process.
>=20
> > In this case, the exynos_g2d_drm.h seems like a good idea. As I'm
> > obviously biased, it's better to check how others feel on the topic=
=2E
>=20
> Do you mean that just create an exynos_g2d_drm.h, so both exynos_drm.=
h
> and rockchip_drm.h could include them ? It's good to reuse code, but =
in this
> case I thought it's better to keep both exist.
>=20
> I have try to do that, split the common 'exynos_g2d_drm.h'. But I
> thought it may
> caused some name confusion. For example, the drm rockchip code need c=
all the
> EXYNOS_G2D_SET_CMDLIST ioctl to send command list. This may like drm
> rockchip
> is calling the Exynos G2D hardware, but actually it just the name con=
flict.
>=20
> Actually the head file is much simple, just contained 60 lines.
>=20
> So, is it okay not to split the head file, just keep the data structu=
re
> define both
> rockchip_drm.h and exynos_drm.h
>=20
> >>>   - if neither of these are possible, then please ensure that the=
 new
> >>>=20
> >>> header uses correct types (see the docs [1]), use MIT/X11 license=
 (if
> >>> possible) and link where upstream userspace is happy with the
> >>> interface (ideally more than a simple test app like libdrm)
> >>> These might sound like an overkill, although getting UAPI right a=
nd
> >>> maintaining it forever forces us to do so.
> >>=20
> >> As for a real-world usecase, maybe the armsoc xserver might be som=
ewhat
> >> easy to use. While the core changes I did are in the core project
> >> already, I'm still keeping the actual Rockchip support separate [0=
] due
> >> to the not-yet- resolved create_gem ioctl.
> >>=20
> >> Anyway, the armsoc xserver has some exa implementation hooks were =
I guess
> >> it might be relatively easy to hook up soc-specific things.
> >=20
> > Ouch the armsoc ddx... Last time I've checked it felt like a place
> > where everyone is doing his own thing, with no actual reviews and/o=
r
> > maintainer. Iirc most/all of it's functionality was achievable with
> > modesetting ddx (with or without glamor) ? I take it that things ha=
ve
> > changed and/or I misunderstood something ?
>=20
> Yeah, previously I plan to add RGA support to Rockchip armsoc DDX, bu=
t
> seems Mark start to work on modetestting, so I may need to switch to
> follow him.

It is great to hear that people who actually know what they're doing in=
=20
graphics-land are working on x11 support :-D .


Heiko
