From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH] arm64: add support for rng-seed
Date: Wed, 8 May 2019 23:05:47 +0800
Message-ID: <CAJMQK-jjzYwX3NZAKJ-8ypjcN75o-ZX4iOVD=84JecEd4qV1bA@mail.gmail.com>
References: <20190507045433.542-1-hsinyi@chromium.org> <CAL_Jsq+rGeFKAPVmPvv_Z+G=BppKUK-tEUphBajZVxFtbRBJvQ@mail.gmail.com>
 <CAJMQK-iVhScf0ybZ85kqP0B5_QPoYZ9PZt35jHRUh8FNHKvu7w@mail.gmail.com> <CAL_JsqJZ+mOnrLWt0Cpo_Ybr_ohxwWom1qiyV8_EFocULde7=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJZ+mOnrLWt0Cpo_Ybr_ohxwWom1qiyV8_EFocULde7=Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, Architecture Mailman List <boot-architecture@lists.linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 8, 2019 at 10:04 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, May 7, 2019 at 11:08 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > On Wed, May 8, 2019 at 3:47 AM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > +boot-architecture list as there was some discussion about this IIRC.
> > >
> > > On Mon, May 6, 2019 at 11:54 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > > >
> > > > Introducing a chosen node, rng-seed, which is an 64 bytes entropy
> > > > that can be passed to kernel called very early to increase device
> > > > randomness. Bootloader should provide this entropy and the value is
> > > > read from /chosen/rng-seed in DT.
> > > >
> > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > >
> > > > ---
> > > >  Documentation/devicetree/bindings/chosen.txt | 14 +++++++++
> > >
> > > Actually, this file has been converted to json-schema and lives
> > > here[1]. I need to remove this one (or leave it with a reference to
> > > the new one).
> > >
> > > >  arch/arm64/kernel/setup.c                    |  2 ++
> > > >  drivers/of/fdt.c                             | 33 ++++++++++++++++++++
> > > >  include/linux/of_fdt.h                       |  1 +
> > > >  4 files changed, 50 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> > > > index 45e79172a646..bfd360691650 100644
> > > > --- a/Documentation/devicetree/bindings/chosen.txt
> > > > +++ b/Documentation/devicetree/bindings/chosen.txt
> > > > @@ -28,6 +28,20 @@ mode) when EFI_RNG_PROTOCOL is supported, it will be overwritten by
> > > >  the Linux EFI stub (which will populate the property itself, using
> > > >  EFI_RNG_PROTOCOL).
> > > >
> > > > +rng-seed
> > > > +-----------
> > > > +
> > > > +This property served as an entropy to add device randomness. It is parsed
> > > > +as a 64 byte value, e.g.
> > >
> > > Why only 64-bytes?
> > We can also not specify size and read what bootloader can provide.
> > >
> > > > +
> > > > +/ {
> > > > +       chosen {
> > > > +               rng-seed = <0x31951b3c 0xc9fab3a5 0xffdf1660 ...>
> > > > +       };
> > > > +};
> > > > +
> > > > +This random value should be provided by bootloader.
> > > > +
> > > >  stdout-path
> > > >  -----------
> > > >
> > > > diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> > > > index 413d566405d1..ade4261516dd 100644
> > > > --- a/arch/arm64/kernel/setup.c
> > > > +++ b/arch/arm64/kernel/setup.c
> > > > @@ -292,6 +292,8 @@ void __init setup_arch(char **cmdline_p)
> > > >         early_fixmap_init();
> > > >         early_ioremap_init();
> > > >
> > > > +       early_init_dt_rng_seed(__fdt_pointer);
> > > > +
> > >
> > > I'm trying to reduce or eliminate all these early_init_dt_* calls.
> > >
> > > Why is this arch specific and why can't this be done after
> > > unflattening? It doesn't look like add_device_randomness() needs
> > > anything early.
> > Currently unflattening is called after setup_machine_fdt(), which
> > called fixmap_remap_fdt() //__fixmap_remap_fdt(dt_phys, &size,
> > PAGE_KERNEL_RO), and we can't modify DT after that since it's read
> > only. But we need to clear (eg. write 0 to it) the rng-seed after
> > reading from DT.
>
> Why do you need to clear it? That wasn't necessary for kaslr-seed.
I think it's for security purpose. If we know the random seed, it's
more likely we can predict randomness.
Currently on arm64, kaslr-seed will be wiped out (in
arch/arm64/kernel/kaslr.c#get_kaslr_seed(), it's set to 0) so we can't
read from sysfs (eg. /sys/firmware/devicetree/.../kaslr-seed)
I'm not sure on other arch if it will be wiped out.
>
> Why not change the mapping to RW? It would be nice if this worked on
> more than one arch.
>
> Rob
