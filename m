From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] checkpatch: Warn if DT bindings are not in schema format
Date: Mon, 16 Sep 2019 13:21:16 -0500
Message-ID: <CAL_Jsq+vZp_C7c4fxwA138D-b=aRmGn=CqCwTQ-biwwahq8K6Q@mail.gmail.com>
References: <20190913211349.28245-1-robh@kernel.org> <713b2e5bbab16ddf850245ae1d92be66d9730e02.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <713b2e5bbab16ddf850245ae1d92be66d9730e02.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@canonical.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 13, 2019 at 4:48 PM Joe Perches <joe@perches.com> wrote:
>
> On Fri, 2019-09-13 at 16:13 -0500, Rob Herring wrote:
> > DT bindings are moving to using a json-schema based schema format
> > instead of freeform text. Add a checkpatch.pl check to encourage using
> > the schema for new bindings. It's not yet a requirement, but is
> > progressively being required by some maintainers.
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -2822,6 +2822,14 @@ sub process {
> >                            "added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
> >               }
> >
> > +# Check for adding new DT bindings not in schema format
> > +             if (!$in_commit_log &&
> > +                 ($line =~ /^new file mode\s*\d+\s*$/) &&
> > +                 ($realfile =~ m@^Documentation/devicetree/bindings/.*\.txt$@)) {
> > +                     WARN("DT_SCHEMA_BINDING_PATCH",
> > +                          "DT bindings should be in DT schema format. See: Documentation/devicetree/writing-schema.rst\n");
> > +             }
> > +
>
> As this already seems to be git dependent, perhaps
> it's easier to read with a single line test like:
>
>                 if ($line =~ m{^\s*create mode\s*\d+\s*Documentation/devicetree/bindings/.*\.txt$}) {
>                         etc...
>                 }

Okay. I wasn't too concerned about non-git diffs as I rarely see those anymore.

>
> There are ~3500 existing .txt files:
>
> $ git ls-files -- 'Documentation/devicetree/bindings/*.txt' | wc -l
> 3476
>
> Are these going to be converted somehow?

Patches welcome! We're working on it.

>
> What about files like these? (not .txt)
>
> Documentation/devicetree/bindings/timer/st,stih407-lpc
> Documentation/devicetree/bindings/nds32/andestech-boards
> Documentation/devicetree/bindings/media/nokia,n900-ir
> Documentation/devicetree/bindings/interrupt-controller/ti,omap4-wugen-mpu
> Documentation/devicetree/bindings/arm/cpu-enable-method/nuvoton,npcm750-smp
> Documentation/devicetree/bindings/arm/cpu-enable-method/marvell,berlin-smp
> Documentation/devicetree/bindings/arm/cpu-enable-method/al,alpine-smp
> Documentation/devicetree/bindings/arm/arm-boards

What about them? This check is only for new files and no one runs
checkpatch.pl on binding txt files. If someone submits something
without an extension, then I'll catch that in review. I'm not too
worried about 8 out of 3500 cases.

Rob
