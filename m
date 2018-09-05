From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] of/fdt: Scan the root node properties earlier
Date: Wed, 5 Sep 2018 16:31:37 -0500
Message-ID: <CAL_Jsq+yfaTzvMefUwzjapvyEYqwFndR5r7KAMPvApDKm=jGFw@mail.gmail.com>
References: <20180830190523.31474-1-robh@kernel.org> <20180830190523.31474-2-robh@kernel.org>
 <b86ed9cf-d5fd-09fb-eb82-0143c759f5cf@gmail.com> <CAL_JsqJy0kDYCC35GR5TGLYyYU-UjOys_r2sFMQZuFto5HkExg@mail.gmail.com>
 <5da7b4ab-acd3-977a-6ac2-275911d7c436@gmail.com> <CAL_JsqKRsXN-MKdP1ts=QexwuwkXO5tbFkORf4xDyYt04FUuUA@mail.gmail.com>
 <00433395-ec1e-8a2c-cb88-5db659967643@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <00433395-ec1e-8a2c-cb88-5db659967643@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 5, 2018 at 4:10 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 09/05/18 13:06, Rob Herring wrote:
> > On Wed, Sep 5, 2018 at 1:19 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >>
> >> On 09/05/18 04:51, Rob Herring wrote:
> >>> On Tue, Sep 4, 2018 at 8:49 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >>>>
> >>>> On 08/30/18 12:05, Rob Herring wrote:
> >>>>> Scan the root node properties (#{size,address}-cells) earlier,
> >>>>
> >>>>                                                         ^^^^^^^
> >>>>                              before mdesc->dt_fixup() is called
> >>>>
> >>>>> so that
> >>>>> the dt_root_addr_cells and dt_root_size_cells variables are initialized
> >>>>> and can be used.
> >>>>                  by mdesc->dt_fixup()
> >>>
> >>> That's an ARM specific detail. Granted, ARM is the only caller.
> >>
> >> The dt_root_addr_cells and dt_root_size_cells variables are being
> >> initialized earlier in this patch series so that of_fdt_limit_memory()
> >> can use them.  The only caller of of_fdt_limit_memory() is
> >> exynos_dt_fixup(), which is an mdesc->dt_fixup() function.
> >>
> >>
> >>>
> >>>>>
> >>>>> Cc: Frank Rowand <frowand.list@gmail.com>
> >>>>> Signed-off-by: Rob Herring <robh@kernel.org>
> >>>>> ---
> >>>>>  drivers/of/fdt.c | 7 ++++---
> >>>>>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>>
> >>>> Moving early_init_dt_scan_root() to inside early_init_dt_verify()
> >>>> puts something that has nothing to do with verifying the fdt
> >>>> into a function whose purpose is the verify.  It hides the side
> >>>> effect of initializing the dt_root_addr_cells and dt_root_size_cells
> >>>> variables.
> >>>
> >>> It already has the side effect of setting initial_boot_params which
> >>> every subsequent function needs.
> >>
> >> And that side effect should probably also be moved.
> >
> > So 2 functions? One to set the blob and one to verify it. Then we can
>
> No, I would not add yet another function.  All of these side effects are
> an argument in favor of a single setup_machine_fdt(), as I suggested below.
> Then all of these side effects could be in setup_machine_fdt() instead
> of hiding them in sub-functions that are called by all of the different
> architectures.
>
>
> > just let arches decide if they want to do any verification or not.
> >
> > Perhaps it should be called fdt_init(blob) and then it is vague enough
> > I can do whatever I want.
> >
> >>>> I suggest creating a new function early_init_dt_scan_init_pre_dt_fixup(),
> >>>> move the chunk of code there instead of to early_init_dt_scan_nodes(),
> >>>> and call the new function from setup_machine_fdt(), just before
> >>>> calling  mdesc->dt_fixup().  This would be a little bit more code,
> >>>> but more clearly showing the intent.
> >>>
> >>> I'm trying to reduce the number of functions arches call
> >>
> >> I like that goal.
> >>
> >>
> >>> and renaming
> >>> would need a bunch of arch changes. This change will also let me make
> >>> early_init_dt_scan_root private as powerpc is the only user. I need to
> >>> dust off a patch for that.
> >>>
> >>> I'd be more inclined to push exynos to remove this altogether. After
> >>
> >> Not a bad idea.
> >>
> >>> all, if they claim their bindings are unstable, they can't really
> >>> claim their bootloader is stable/fixed.
> >>
> >> It seems that this series is showing us that maybe the three architecture
> >> specific (arc, arm, arm64) versions of setup_machine_fdt() should be
> >> consolidated so that we have consistent behavior for FDT.
> >>
> >> If we had a single setup_machine_fdt() then some of he hidden side
> >> effects of functions called by setup_machine_fdt() could instead
> >> be hoisted into setup_machine_fdt().
> >
> > Those functions are all quite a bit different. ARM matches the machine
> > desc while arm64 doesn't have any such thing. How the DTB gets mapped
> > into virtual space also varies.
>
> I argue that they _should be_ made to be more alike than different.  You
> have only pointed out two differences.  Of those, the mapping could be
> cleanly handled by an mdesc-> callback.  (I would have to look at the
> match to see if that could be handled easily, but I would expect so.)

The machine desc is in no way common and only used on a few arches
(and not even common across those arches). So there's no way the core
DT code can just call a mdesc callback without addressing making that
common first. And callbacks are just another way to call arch specific
functions which are another thing I'm trying to remove.

> On the other hand, in a previous reply you considered removing
> of_fdt_limit_memory(), which is only used for an exynos fixup.  If
> you do that, then patch 1 disappears, and we can continue to
> sweep under the rug the side effects that you reminded me of
> with patch 1.

I'm inclined to just drop the patch. Seemed like a simple clean-up and
I'm not interested in doing more right now (did you look at the stack
of stuff in dt/testing branch). Maybe someone else will care (spoiler:
they won't).

Rob
