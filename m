From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/8] Allwinner H6 Mali GPU support
Date: Tue, 14 May 2019 23:22:00 +0200
Message-ID: <CAJiuCccWa5UTML68JDQq6q8SyNZzVWwQWTOL=+84Bh4EMHGC3A@mail.gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com> <20190513151405.GW17751@phenom.ffwll.local>
 <de50a9da-669f-ab25-2ef2-5ffb90f8ee03@baylibre.com> <CAJiuCccuEw0BK6MwROR+XUDvu8AJTmZ5tu=pYwZbGAuvO31pgg@mail.gmail.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBBHD5TTAKGQE4LVITYI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAJiuCccuEw0BK6MwROR+XUDvu8AJTmZ5tu=pYwZbGAuvO31pgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 14 May 2019 at 17:17, Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>
> Hi,
>
> On Tue, 14 May 2019 at 12:29, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wr=
ote:
> >
> > Hi,
> >
> > On 13/05/2019 17:14, Daniel Vetter wrote:
> > > On Sun, May 12, 2019 at 07:46:00PM +0200, peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > >> From: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > >>
> > >> Hi,
> > >>
> > >> The Allwinner H6 has a Mali-T720 MP2. The drivers are
> > >> out-of-tree so this series only introduce the dt-bindings.
> > >
> > > We do have an in-tree midgard driver now (since 5.2). Does this stuff=
 work
> > > together with your dt changes here?
> >
> > No, but it should be easy to add.
> I will give it a try and let you know.
Added the bus_clock and a ramp delay to the gpu_vdd but the driver
fail at probe.

[    3.052919] panfrost 1800000.gpu: clock rate =3D 432000000
[    3.058278] panfrost 1800000.gpu: bus_clock rate =3D 100000000
[    3.179772] panfrost 1800000.gpu: mali-t720 id 0x720 major 0x1
minor 0x1 status 0x0
[    3.187432] panfrost 1800000.gpu: features: 00000000,10309e40,
issues: 00000000,21054400
[    3.195531] panfrost 1800000.gpu: Features: L2:0x07110206
Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002821 AS:0xf
JS:0x7
[    3.207178] panfrost 1800000.gpu: shader_present=3D0x3 l2_present=3D0x1
[    3.238257] panfrost 1800000.gpu: Fatal error during GPU init
[    3.244165] panfrost: probe of 1800000.gpu failed with error -12

The ENOMEM is coming from "panfrost_mmu_init"
alloc_io_pgtable_ops(ARM_MALI_LPAE, &pfdev->mmu->pgtbl_cfg,
                                         pfdev);

Which is due to a check in the pgtable alloc "cfg->ias !=3D 48"
arm-lpae io-pgtable: arm_mali_lpae_alloc_pgtable cfg->ias 33 cfg->oas 40

DRI stack is totally new for me, could you give me a little clue about
this issue ?

Thanks,
Cl=C3=A9ment

>
> >
> > Cl=C3=A9ment, no need to resend the first patch, it's now on
> > linus master.
> Ok
>
> Thanks,
> Clement
>
> >
> > Could you also add support for the bus clock in panfrost
> > in the same patchset since it's also on master now ?
> >
> > Neil
> >
> > > -Daniel
> > >
> > >> The first patch is from Neil Amstrong and has been already
> > >> merged in linux-amlogic. It is required for this series.
> > >>
> > >> The second patch is from Icenowy Zheng where I changed the
> > >> order has required by Rob Herring.
> > >> See: https://patchwork.kernel.org/patch/10699829/
> > >>
> > >> Thanks,
> > >> Cl=C3=A9ment
> > >>
> > >> Changes in v4:
> > >>  - Add Rob Herring reviewed-by tag
> > >>  - Resent with correct Maintainers
> > >>
> > >> Changes in v3 (Thanks to Maxime Ripard):
> > >>  - Reauthor Icenowy for her patch
> > >>
> > >> Changes in v2 (Thanks to Maxime Ripard):
> > >>  - Drop GPU OPP Table
> > >>  - Add clocks and clock-names in required
> > >>
> > >> Cl=C3=A9ment P=C3=A9ron (6):
> > >>   dt-bindings: gpu: mali-midgard: Add H6 mali gpu compatible
> > >>   arm64: dts: allwinner: Add ARM Mali GPU node for H6
> > >>   arm64: dts: allwinner: Add mali GPU supply for Pine H64
> > >>   arm64: dts: allwinner: Add mali GPU supply for Beelink GS1
> > >>   arm64: dts: allwinner: Add mali GPU supply for OrangePi Boards
> > >>   arm64: dts: allwinner: Add mali GPU supply for OrangePi 3
> > >>
> > >> Icenowy Zheng (1):
> > >>   dt-bindings: gpu: add bus clock for Mali Midgard GPUs
> > >>
> > >> Neil Armstrong (1):
> > >>   dt-bindings: gpu: mali-midgard: Add resets property
> > >>
> > >>  .../bindings/gpu/arm,mali-midgard.txt         | 27 ++++++++++++++++=
+++
> > >>  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  5 ++++
> > >>  .../dts/allwinner/sun50i-h6-orangepi-3.dts    |  5 ++++
> > >>  .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  5 ++++
> > >>  .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  5 ++++
> > >>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 14 ++++++++++
> > >>  6 files changed, 61 insertions(+)
> > >>
> > >> --
> > >> 2.17.1
> > >>
> > >
> >

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/CAJiuCccWa5UTML68JDQq6q8SyNZzVWwQWTOL%3D%2B84Bh4EMHGC3A%40mail=
.gmail.com.
For more options, visit https://groups.google.com/d/optout.
