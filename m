From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] checkpatch: Warn if DT bindings are not in schema format
Date: Fri, 27 Sep 2019 09:02:29 -0500
Message-ID: <CAL_JsqLtEM9+LK=3YDLnoZbC1v09R9-qfFNEH-gTWj94FAjnyg@mail.gmail.com>
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

It's quite rare to see a non git generated diff these days.

> it's easier to read with a single line test like:
>
>                 if ($line =~ m{^\s*create mode\s*\d+\s*Documentation/devicetree/bindings/.*\.txt$}) {
>                         etc...
>                 }

I frequently do 'git show $commit | scripts/checkpatch.pl' and this
doesn't work with that. I really should have a '--pretty=email' in
there, but I just ignore the commit msg warnings. In any case, that
still doesn't help because there's no diffstat. There's probably some
way to turn that on or just use git-format-patch, but really we want
this to work with any git diff.

Rob
