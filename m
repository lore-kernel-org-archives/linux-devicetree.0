From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] drm: rcar-du: Document the vsps property in the DT bindings
Date: Fri, 31 Mar 2017 11:21:56 +0200
Message-ID: <CAMuHMdWSuz79mdHLuT4jDQsNvecFck21aBNLOrs5JHmMXnyTCQ@mail.gmail.com>
References: <20170327095652.5755-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUiDzGt6bz96D-5yRLF-HiZfpQTTxKP5Y4+j-9HiF1LLQ@mail.gmail.com> <8105647.ANSr0hWnZy@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8105647.ANSr0hWnZy@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Fri, Mar 31, 2017 at 11:19 AM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
> On Monday 27 Mar 2017 13:05:48 Geert Uytterhoeven wrote:
>> On Mon, Mar 27, 2017 at 11:56 AM, Laurent Pinchart wrote:
>> > The property is used by the driver but is missing from the DT bindings.
>> > Document it.
>> >
>> > Reported-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>> > Signed-off-by: Laurent Pinchart
>> > <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
>> > b/Documentation/devicetree/bindings/display/renesas,du.txt index
>> > 1a02f099a0ff..cf34893a1b53 100644
>> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
>> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
>> >
>> > @@ -36,6 +36,11 @@ Required Properties:
>> >        When supplied they must be named "dclkin.x" with "x" being the
>> >        input
>> >        clock numerical index.
>> >
>> > +Optional Properties:
>> > +
>> > +  - vsps: A list of phandles to the VSP nodes that handle the memory
>> > +    interfaces for the DU channels (Gen3 only).
>>
>> ", one per channel"?
>>
>> Required for Gen3, optional for Gen2? (cfr. Sergei's patches).
>
> How about making it mandatory on Gen2 as well ? The VSPs are there, even if
> the driver doesn't use them, it makes sense to describe the connection. Of

Fine for me, as this is hardware description.

> course the driver will treat the property as optional for backward
> compatibility.

OK.

Disclaimer: I didn't follow the discussion about using or not using the vsps
on Gen2 that closely, and don't remember the outcome.

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
