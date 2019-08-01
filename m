Return-Path: <SRS0=pysA=V5=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190731123741.13947-1-geert+renesas@glider.be> <342e5e38-f980-c849-c061-8dad42bc0850@gmail.com>
In-Reply-To: <342e5e38-f980-c849-c061-8dad42bc0850@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2019 14:13:50 +0200
Message-ID: <CAMuHMdWPvD_pSyJGp=kC0XmAChCK8R2X+exmpHT5eywJ5kQetA@mail.gmail.com>
Subject: Re: [PATCH] scripts/dtc: dtx_diff - add color output support
Content-Type: text/plain; charset="UTF-8"
To: Frank Rowand <frowand.list@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Frank,

On Wed, Jul 31, 2019 at 10:30 PM Frank Rowand <frowand.list@gmail.com> wrote:
> On 7/31/19 5:37 AM, Geert Uytterhoeven wrote:
> > Add new -c/--color options, to enhance the diff output with color, and
> > improve the user's experience.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  scripts/dtc/dtx_diff | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
> > index e9ad7834a22d9459..4e2c8617f69a333e 100755
> > --- a/scripts/dtc/dtx_diff
> > +++ b/scripts/dtc/dtx_diff
> > @@ -20,6 +20,8 @@ Usage:
> >
> >
> >        --annotate    synonym for -T
> > +      --color       synonym for -c
> > +       -c           enable colored output
> >         -f           print full dts in diff (--unified=99999)
> >         -h           synonym for --help
> >         -help        synonym for --help

> I like the idea, but...
>
> I have various linux distro releases across my many systems, but only one is
> new enough to have the diff command that supports --color.

Seems to have been added in diffutils release 3.4 (2016-08-08).
I almost can't believe it was that recent, but then I remembered using a
wrapper before (colordiff; other wrappers may exist).

> Can you enhance this patch to test whether --color is supported?  Maybe
> something like (untested):
>
>         -c | --color )
>                 if `diff --color <(echo a) <(echo a) 2>/dev/null` ; then
>                         diff_color="--color=always"
>                 fi
>                 shift
>                 ;;
>
> Then add some text to the usage for -c and --color saying that they will
> be silently ignored if diff does not support --color.
>
> I first wrote up a suggested version that printed an error message and
> exited, but I think silently ignoring is more robust, even though it
> may be more confusing to someone who is wondering why --color does not
> work.

Given this is an optional feature, to be enabled explicitly by the user,
I'm not so fond of going through hoops to auto-detect the availability.

So what about just documenting this in the help text instead?

-      -c           enable colored output
+      -c           enable colored output (requires diff with --color support)

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
