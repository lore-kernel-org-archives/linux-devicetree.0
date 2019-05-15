From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/8] Allwinner H6 Mali GPU support
Date: Thu, 16 May 2019 00:05:16 +0200
Message-ID: <CAJiuCcd=gCQJ4mxn3wNhHXveOhFLnYSEs+cnOMHcALPvd7bQZw@mail.gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com> <20190513151405.GW17751@phenom.ffwll.local>
 <de50a9da-669f-ab25-2ef2-5ffb90f8ee03@baylibre.com> <CAJiuCccuEw0BK6MwROR+XUDvu8AJTmZ5tu=pYwZbGAuvO31pgg@mail.gmail.com>
 <CAJiuCccWa5UTML68JDQq6q8SyNZzVWwQWTOL=+84Bh4EMHGC3A@mail.gmail.com> <3c2c9094-69d4-bace-d5ee-c02b7f56ac82@arm.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBKE26LTAKGQEIS3RY4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3c2c9094-69d4-bace-d5ee-c02b7f56ac82-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Robin,

On Tue, 14 May 2019 at 23:57, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> wrote:
>
> On 2019-05-14 10:22 pm, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi,
> >
> > On Tue, 14 May 2019 at 17:17, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> >>
> >> Hi,
> >>
> >> On Tue, 14 May 2019 at 12:29, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>=
 wrote:
> >>>
> >>> Hi,
> >>>
> >>> On 13/05/2019 17:14, Daniel Vetter wrote:
> >>>> On Sun, May 12, 2019 at 07:46:00PM +0200, peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote=
:
> >>>>> From: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> The Allwinner H6 has a Mali-T720 MP2. The drivers are
> >>>>> out-of-tree so this series only introduce the dt-bindings.
> >>>>
> >>>> We do have an in-tree midgard driver now (since 5.2). Does this stuf=
f work
> >>>> together with your dt changes here?
> >>>
> >>> No, but it should be easy to add.
> >> I will give it a try and let you know.
> > Added the bus_clock and a ramp delay to the gpu_vdd but the driver
> > fail at probe.
> >
> > [    3.052919] panfrost 1800000.gpu: clock rate =3D 432000000
> > [    3.058278] panfrost 1800000.gpu: bus_clock rate =3D 100000000
> > [    3.179772] panfrost 1800000.gpu: mali-t720 id 0x720 major 0x1
> > minor 0x1 status 0x0
> > [    3.187432] panfrost 1800000.gpu: features: 00000000,10309e40,
> > issues: 00000000,21054400
> > [    3.195531] panfrost 1800000.gpu: Features: L2:0x07110206
> > Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002821 AS:0xf
> > JS:0x7
> > [    3.207178] panfrost 1800000.gpu: shader_present=3D0x3 l2_present=3D=
0x1
> > [    3.238257] panfrost 1800000.gpu: Fatal error during GPU init
> > [    3.244165] panfrost: probe of 1800000.gpu failed with error -12
> >
> > The ENOMEM is coming from "panfrost_mmu_init"
> > alloc_io_pgtable_ops(ARM_MALI_LPAE, &pfdev->mmu->pgtbl_cfg,
> >                                           pfdev);
> >
> > Which is due to a check in the pgtable alloc "cfg->ias !=3D 48"
> > arm-lpae io-pgtable: arm_mali_lpae_alloc_pgtable cfg->ias 33 cfg->oas 4=
0
> >
> > DRI stack is totally new for me, could you give me a little clue about
> > this issue ?
>
> Heh, this is probably the one bit which doesn't really count as "DRI stac=
k".
>
> That's merely a somewhat-conservative sanity check - I'm pretty sure it
> *should* be fine to change the test to "cfg->ias > 48" (io-pgtable
> itself ought to cope). You'll just get to be the first to actually test
> a non-48-bit configuration here :)

Thanks a lot, the probe seems fine now :)

I try to run glmark2 :
# glmark2-es2-drm
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    glmark2 2017.07
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
    OpenGL Information
    GL_VENDOR:     panfrost
    GL_RENDERER:   panfrost
    GL_VERSION:    OpenGL ES 2.0 Mesa 19.1.0-rc2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
[build] use-vbo=3Dfalse:

But it seems that H6 is not so easy to add :(.

[  345.204813] panfrost 1800000.gpu: mmu irq status=3D1
[  345.209617] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
0x0000000002400400
[  345.209617] Reason: TODO
[  345.209617] raw fault status: 0x800002C1
[  345.209617] decoded fault status: SLAVE FAULT
[  345.209617] exception type 0xC1: TRANSLATION_FAULT_LEVEL1
[  345.209617] access type 0x2: READ
[  345.209617] source id 0x8000
[  345.729957] panfrost 1800000.gpu: gpu sched timeout, js=3D0,
status=3D0x8, head=3D0x2400400, tail=3D0x2400400, sched_job=3D000000009e204=
de9
[  346.055876] panfrost 1800000.gpu: mmu irq status=3D1
[  346.060680] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
0x0000000002C00A00
[  346.060680] Reason: TODO
[  346.060680] raw fault status: 0x810002C1
[  346.060680] decoded fault status: SLAVE FAULT
[  346.060680] exception type 0xC1: TRANSLATION_FAULT_LEVEL1
[  346.060680] access type 0x2: READ
[  346.060680] source id 0x8100
[  346.561955] panfrost 1800000.gpu: gpu sched timeout, js=3D1,
status=3D0x8, head=3D0x2c00a00, tail=3D0x2c00a00, sched_job=3D00000000b55a9=
a85
[  346.573913] panfrost 1800000.gpu: mmu irq status=3D1
[  346.578707] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
0x0000000002C00B80
[  346.578707] Reason: TODO
[  346.578707] raw fault status: 0x800002C1
[  346.578707] decoded fault status: SLAVE FAULT
[  346.578707] exception type 0xC1: TRANSLATION_FAULT_LEVEL1
[  346.578707] access type 0x2: READ
[  346.578707] source id 0x8000
[  347.073947] panfrost 1800000.gpu: gpu sched timeout, js=3D0,
status=3D0x8, head=3D0x2c00b80, tail=3D0x2c00b80, sched_job=3D00000000cf6af=
8e8
[  347.104125] panfrost 1800000.gpu: mmu irq status=3D1
[  347.108930] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
0x0000000002800900
[  347.108930] Reason: TODO
[  347.108930] raw fault status: 0x810002C1
[  347.108930] decoded faultn thi status: SLAVE FAULT
[  347.108930] exception type 0xC1: TRANSLATION_FAULT_LEVEL1
[  347.108930] access type 0x2: READ
[  347.108930] source id 0x8100
[  347.617950] panfrost 1800000.gpu: gpu sched timeout, js=3D1,
status=3D0x8, head=3D0x2800900, tail=3D0x2800900, sched_job=3D000000009325f=
db7
[  347.629902] panfrost 1800000.gpu: mmu irq status=3D1
[  347.634696] panfrost 1800000.gpu: Unhandled Page fault in AS0 at VA
0x0000000002800A80

Regards,
Clement

>
> Robin.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/CAJiuCcd%3DgCQJ4mxn3wNhHXveOhFLnYSEs%2BcnOMHcALPvd7bQZw%40mail=
.gmail.com.
For more options, visit https://groups.google.com/d/optout.
