From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm: rcar-du: Document the vsps property in the DT bindings
Date: Wed, 5 Apr 2017 09:54:38 +0200
Message-ID: <CAMuHMdWYq-w9T4chEh4Hg0+9_MCb+bivD3sgHeCoMPe61=czjg@mail.gmail.com>
References: <20170327095652.5755-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUiDzGt6bz96D-5yRLF-HiZfpQTTxKP5Y4+j-9HiF1LLQ@mail.gmail.com>
 <8105647.ANSr0hWnZy@avalon> <CAMuHMdWSuz79mdHLuT4jDQsNvecFck21aBNLOrs5JHmMXnyTCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWSuz79mdHLuT4jDQsNvecFck21aBNLOrs5JHmMXnyTCQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Fri, Mar 31, 2017 at 11:21 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Mar 31, 2017 at 11:19 AM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Monday 27 Mar 2017 13:05:48 Geert Uytterhoeven wrote:
>>> On Mon, Mar 27, 2017 at 11:56 AM, Laurent Pinchart wrote:
>>> > The property is used by the driver but is missing from the DT bindings.
>>> > Document it.
>>> >
>>> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> > Signed-off-by: Laurent Pinchart
>>> > <laurent.pinchart+renesas@ideasonboard.com>
>>> > ---
>>> >  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
>>> >  1 file changed, 5 insertions(+)
>>> >
>>> > diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
>>> > b/Documentation/devicetree/bindings/display/renesas,du.txt index
>>> > 1a02f099a0ff..cf34893a1b53 100644
>>> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
>>> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
>>> >
>>> > @@ -36,6 +36,11 @@ Required Properties:
>>> >        When supplied they must be named "dclkin.x" with "x" being the
>>> >        input
>>> >        clock numerical index.
>>> >
>>> > +Optional Properties:
>>> > +
>>> > +  - vsps: A list of phandles to the VSP nodes that handle the memory
>>> > +    interfaces for the DU channels (Gen3 only).
>>>
>>> ", one per channel"?
>>>
>>> Required for Gen3, optional for Gen2? (cfr. Sergei's patches).
>>
>> How about making it mandatory on Gen2 as well ? The VSPs are there, even if
>> the driver doesn't use them, it makes sense to describe the connection. Of
>
> Fine for me, as this is hardware description.
>
>> course the driver will treat the property as optional for backward
>> compatibility.
>
> OK.

Will you do this as an incremental update?
I noticed the initial version is now in drm-next.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
