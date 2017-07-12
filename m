From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] gpio: rcar: add gen[123] fallback compatibility strings
Date: Wed, 12 Jul 2017 08:35:59 +0200
Message-ID: <CAMuHMdXw9pJPAtLAKFpUBnQ618fT11r2ocE+mDdOyHx9ckeF4w@mail.gmail.com>
References: <1499776710-25450-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdWH_av4fiGXAtS7Xz91jW86-ntkXPdZz8Wci4dSVUmJOw@mail.gmail.com> <20170712054909.GA18990@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170712054909.GA18990@verge.net.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

CC DT

On Wed, Jul 12, 2017 at 7:49 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Jul 11, 2017 at 07:59:31PM +0200, Geert Uytterhoeven wrote:
>> On Tue, Jul 11, 2017 at 2:38 PM, Simon Horman
>> <horms+renesas@verge.net.au> wrote:
>> > Add fallback compatibility string for R-Car Gen 1, 2 and 3.
>> >
>> > In the case of Renesas R-Car hardware we know that there are generations of
>> > SoCs, f.e. Gen 1 and 2. But beyond that its not clear what the relationship
>> > between IP blocks might be. For example, I believe that r8a7790 is older
>> > than r8a7791 but that doesn't imply that the latter is a descendant of the
>> > former or vice versa.
>> >
>> > We can, however, by examining the documentation and behaviour of the
>> > hardware at run-time observe that the current driver implementation appears
>> > to be compatible with the IP blocks on SoCs within a given generation.
>> >
>> > For the above reasons and convenience when enabling new SoCs a
>> > per-generation fallback compatibility string scheme being adopted for
>> > drivers for Renesas SoCs.
>> >
>> > Also deprecate renesas,gpio-rcar as its name is more generic than its
>> > implementation.
>> >
>> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> > ---
>> > Based on linux-gpio/for-next
>> > ---
>> >  .../devicetree/bindings/gpio/renesas,gpio-rcar.txt        | 15 +++++++++++----
>> >  drivers/gpio/gpio-rcar.c                                  | 10 ++++++++++
>> >  2 files changed, 21 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
>> > index 6826a371fb69..48634b01f1bf 100644
>> > --- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
>> > +++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
>> > @@ -2,7 +2,7 @@
>> >
>> >  Required Properties:
>> >
>> > -  - compatible: should contain one of the following.
>> > +  - compatible: should contain one or more of the following:
>> >      - "renesas,gpio-r8a7743": for R8A7743 (RZ/G1M) compatible GPIO controller.
>> >      - "renesas,gpio-r8a7778": for R8A7778 (R-Mobile M1) compatible GPIO controller.
>> >      - "renesas,gpio-r8a7779": for R8A7779 (R-Car H1) compatible GPIO controller.
>> > @@ -13,7 +13,14 @@ Required Properties:
>> >      - "renesas,gpio-r8a7794": for R8A7794 (R-Car E2) compatible GPIO controller.
>> >      - "renesas,gpio-r8a7795": for R8A7795 (R-Car H3) compatible GPIO controller.
>> >      - "renesas,gpio-r8a7796": for R8A7796 (R-Car M3-W) compatible GPIO controller.
>> > -    - "renesas,gpio-rcar": for generic R-Car GPIO controller.
>> > +    - "renesas,rcar-gen1-gpio": for a generic R-Car Gen1 GPIO controller.
>> > +    - "renesas,rcar-gen2-gpio": for a generic R-Car Gen2 or RZ/G1 GPIO controller.
>> > +    - "renesas,rcar-gen3-gpio": for a generic R-Car Gen3 GPIO controller.
>> > +    - "renesas,gpio-rcar": deprecated.
>> > +
>> > +    When compatible with the generic version nodes must list the
>> > +    SoC-specific version corresponding to the platform first followed by
>> > +    the generic version.
>>
>> Besides for consistency, does it make sense to deprecate "renesas,gpio-rcar"
>> (which means R-Car Gen1) and introduce "renesas,rcar-gen1-gpio"?
>> It's not like new R-Car Gen1 SoCs will pop up anytime soon (do we want Linux
>> support for R-Car E1?).
>
> From my PoV the only advantage of that portion of the change is improving
> consistency. Perhaps it would be better to substitute it with something
> like this:
>
>         - "renesas,gpio-rcar": for a generic R-Car Gen1 GPIO controller.

That sounds good to me. But other people may disagree.
Oh, no CC to the devicetree folks. Fixed.
Patch at https://patchwork.kernel.org/patch/9834611/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
