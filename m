From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] of/fdt: Scan the root node properties earlier
Date: Wed, 5 Sep 2018 06:51:20 -0500
Message-ID: <CAL_JsqJy0kDYCC35GR5TGLYyYU-UjOys_r2sFMQZuFto5HkExg@mail.gmail.com>
References: <20180830190523.31474-1-robh@kernel.org> <20180830190523.31474-2-robh@kernel.org>
 <b86ed9cf-d5fd-09fb-eb82-0143c759f5cf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b86ed9cf-d5fd-09fb-eb82-0143c759f5cf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 4, 2018 at 8:49 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 08/30/18 12:05, Rob Herring wrote:
> > Scan the root node properties (#{size,address}-cells) earlier,
>
>                                                         ^^^^^^^
>                              before mdesc->dt_fixup() is called
>
> > so that
> > the dt_root_addr_cells and dt_root_size_cells variables are initialized
> > and can be used.
>                  by mdesc->dt_fixup()

That's an ARM specific detail. Granted, ARM is the only caller.

> >
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/of/fdt.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> Moving early_init_dt_scan_root() to inside early_init_dt_verify()
> puts something that has nothing to do with verifying the fdt
> into a function whose purpose is the verify.  It hides the side
> effect of initializing the dt_root_addr_cells and dt_root_size_cells
> variables.

It already has the side effect of setting initial_boot_params which
every subsequent function needs.

> I suggest creating a new function early_init_dt_scan_init_pre_dt_fixup(),
> move the chunk of code there instead of to early_init_dt_scan_nodes(),
> and call the new function from setup_machine_fdt(), just before
> calling  mdesc->dt_fixup().  This would be a little bit more code,
> but more clearly showing the intent.

I'm trying to reduce the number of functions arches call and renaming
would need a bunch of arch changes. This change will also let me make
early_init_dt_scan_root private as powerpc is the only user. I need to
dust off a patch for that.

I'd be more inclined to push exynos to remove this altogether. After
all, if they claim their bindings are unstable, they can't really
claim their bootloader is stable/fixed.

Rob
