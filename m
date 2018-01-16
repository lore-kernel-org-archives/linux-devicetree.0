From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/12] drm: rcar-du: Fix legacy DT to create LVDS
 encoder nodes
Date: Tue, 16 Jan 2018 09:08:14 -0600
Message-ID: <CAL_JsqJuzXgx-ntbHdYiabi7DUyT8y0Vxj-c5KBmf+Gk+EWtMw@mail.gmail.com>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112231430.26943-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAL_JsqK9yWE2nLX3AbSx-U6zAyE3fkYnURBY+r6KkJCogU5_sA@mail.gmail.com>
 <1905364.eR590Hd45s@avalon> <CAMuHMdUNcKOod1KCAGSBeMr52PWKqkJo0AWmSNk76t0=Zvu0gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUNcKOod1KCAGSBeMr52PWKqkJo0AWmSNk76t0=Zvu0gA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Frank Rowand <frowand.list@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 16, 2018 at 2:56 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Laurent,
>
> On Mon, Jan 15, 2018 at 7:01 PM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Monday, 15 January 2018 19:09:53 EET Rob Herring wrote:
>>> On Fri, Jan 12, 2018 at 5:14 PM, Laurent Pinchart wrote:
>>> > The internal LVDS encoders now have their own DT bindings. Before
>>> > switching the driver infrastructure to those new bindings, implement
>>> > backward-compatibility through live DT patching.
>>>
>>> Uhh, we just got rid of TI's patching and now adding this one. I guess
>>> it's necessary, but I'd like to know how long we need to keep this?
>>
>> That's a good question. How long are we supposed to keep DT backward
>> compatibility for ? I don't think there's a one-size-fits-them-all answer to
>> this question. Geert, any opinion ? How long do you plan to keep the CPG
>> (clocks) DT backward compatibility for instance ?
>
> Good question indeed...
>
> It's not just CPG/MSSR. Over the years we also added or changed APMU (SMP),
> SYSC (power domains), RST (mode pins), CMT (timers), ..., all of which have
> some sort of compatibility support in the kernel.
>
> Hence to avoid having to remember the kernel versions that dropped backwards
> compatibility for each of the above components, I was thinking about an
> R-Car Gen2 DT Flag Day.

There's probably also DT changes that enable new features folks would
want/need? Or maybe carrying for some number of LTS releases is
enough.

> However, that was before I learned about your plans for LVDS (it seems every
> kernel release we learn about something new, postponing the flag day ;-).
> And now I'm quite sure we'll have another change in the future (DU per
> channel device nodes)...
>
> About using DT fixups to implement backwards compatibility: I did my share
> of thinking and experimenting with DT fixups (see e.g. "[PATCH/RFC 0/1]
> soc: renesas: Add DT fixup code for backwards compatibility"
> (https://www.spinics.net/lists/linux-renesas-soc/msg04305.html).
> DT fixups are hard to implement right, and not everything can be done
> that way.  Hence in the end, none of this was ever used upstream, and
> everything was handled in C...

In an ideal world, we would have some tool:

dt-diff-to-overlay old.dts new.dts > my-fixup-overlay.dts

And then in the kernel have infrastructure such you just declare match
tables with overlays to apply:

struct of_device_id dt_match[] = {
  {
    .compatible = "vendor,board",
  },
  {},
};
DT_FIXUP(dt_match, my-fixup-overlay.dtbo);

But maybe I'm dreaming...

> So I'm wondering if it would be easier if you would implement backwards
> compatibility in C, using different compatible values for the new bindings?
> I.e. switch from "renesas,du-r8a77*" to "renesas,r8a77*-du" +
> "renesas,r8a77*-lvds"?
> That way it also becomes very clear that there are old and new bindings,
> and that there is backwards compatibility code for the old binding.
>
> I know you're aware (the rest of the audience may not be) that the LVDS
> part is not the only separate hardware block current unified in the single
> DU node: each DU channel has its own hardware block.  Perhaps you can also
> bite the bullet and have a single device node per DT channel, allowing
> Runtime PM for DU channels?
> Of course you have to tie channels together using a "companion" (cfr. USB)
> or "renesas,bonding" (cfr. DRIF) property (unfortunately I learned about
> the former only after the latter was already established).
>
> Finally, implementing backwards compatibility support by DT fixup using
> overlays may complicate backporting to LTSI kernels, due to the dependency
> on DT overlays, which were reworked lately.
>
>>> > --- a/drivers/gpu/drm/rcar-du/Kconfig
>>> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
>>> > @@ -22,6 +22,8 @@ config DRM_RCAR_LVDS
>>> >         bool "R-Car DU LVDS Encoder Support"
>>> >         depends on DRM_RCAR_DU
>>> >         select DRM_PANEL
>>> > +       select OF_FLATTREE
>>> > +       select OF_OVERLAY
>>>
>>> OF_OVERLAY should probably select OF_FLATTREE. I guess in theory, we
>>> could have an overlay from a non-FDT source...
>
> Currently the select is needed for of_fdt_unflatten_tree() only, which is
> not used by the core OF_OVERLAY code. So you could build an overlay in
> memory yourself, and pass that, without using of_fdt_unflatten_tree().
> But that is going to change if I read Frank's reponse well?

Yes, it's currently a 4 or so step process that we plan to make a single call.

Rob
