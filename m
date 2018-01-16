From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 03/12] drm: rcar-du: Fix legacy DT to create LVDS
 encoder nodes
Date: Tue, 16 Jan 2018 16:31:36 +0100
Message-ID: <CAMuHMdXNX_XQUwenr06TLU72e57fvBMUyHQn1kV29zDuxEPcTA@mail.gmail.com>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112231430.26943-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAL_JsqK9yWE2nLX3AbSx-U6zAyE3fkYnURBY+r6KkJCogU5_sA@mail.gmail.com>
 <1905364.eR590Hd45s@avalon> <CAMuHMdUNcKOod1KCAGSBeMr52PWKqkJo0AWmSNk76t0=Zvu0gA@mail.gmail.com>
 <CAL_JsqJuzXgx-ntbHdYiabi7DUyT8y0Vxj-c5KBmf+Gk+EWtMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJuzXgx-ntbHdYiabi7DUyT8y0Vxj-c5KBmf+Gk+EWtMw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Jan 16, 2018 at 4:08 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Jan 16, 2018 at 2:56 AM, Geert Uytterhoeven
> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> On Mon, Jan 15, 2018 at 7:01 PM, Laurent Pinchart
>> <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
>>> On Monday, 15 January 2018 19:09:53 EET Rob Herring wrote:
>>>> On Fri, Jan 12, 2018 at 5:14 PM, Laurent Pinchart wrote:
>>>> > The internal LVDS encoders now have their own DT bindings. Before
>>>> > switching the driver infrastructure to those new bindings, implement
>>>> > backward-compatibility through live DT patching.
>>>>
>>>> Uhh, we just got rid of TI's patching and now adding this one. I guess
>>>> it's necessary, but I'd like to know how long we need to keep this?
>>>
>>> That's a good question. How long are we supposed to keep DT backward
>>> compatibility for ? I don't think there's a one-size-fits-them-all answer to
>>> this question. Geert, any opinion ? How long do you plan to keep the CPG
>>> (clocks) DT backward compatibility for instance ?
>>
>> Good question indeed...
>>
>> It's not just CPG/MSSR. Over the years we also added or changed APMU (SMP),
>> SYSC (power domains), RST (mode pins), CMT (timers), ..., all of which have
>> some sort of compatibility support in the kernel.
>>
>> Hence to avoid having to remember the kernel versions that dropped backwards
>> compatibility for each of the above components, I was thinking about an
>> R-Car Gen2 DT Flag Day.
>
> There's probably also DT changes that enable new features folks would
> want/need? Or maybe carrying for some number of LTS releases is
> enough.

Sure. If you want new features, you have to upgrade the DTB anyway.
Backwards compatibility is about keeping features without updating DTB.

>> However, that was before I learned about your plans for LVDS (it seems every
>> kernel release we learn about something new, postponing the flag day ;-).
>> And now I'm quite sure we'll have another change in the future (DU per
>> channel device nodes)...
>>
>> About using DT fixups to implement backwards compatibility: I did my share
>> of thinking and experimenting with DT fixups (see e.g. "[PATCH/RFC 0/1]
>> soc: renesas: Add DT fixup code for backwards compatibility"
>> (https://www.spinics.net/lists/linux-renesas-soc/msg04305.html).
>> DT fixups are hard to implement right, and not everything can be done
>> that way.  Hence in the end, none of this was ever used upstream, and
>> everything was handled in C...
>
> In an ideal world, we would have some tool:
>
> dt-diff-to-overlay old.dts new.dts > my-fixup-overlay.dts
>
> And then in the kernel have infrastructure such you just declare match
> tables with overlays to apply:
>
> struct of_device_id dt_match[] = {
>   {
>     .compatible = "vendor,board",
>   },
>   {},
> };
> DT_FIXUP(dt_match, my-fixup-overlay.dtbo);
>
> But maybe I'm dreaming...

Really?

We might as well include the latest DTB in the kernel, and use that if
machine_is_compatible("vendor,board")? ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
