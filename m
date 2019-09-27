From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] checkpatch: Warn if DT bindings are not in schema format
Date: Fri, 27 Sep 2019 07:29:28 -0700
Message-ID: <7672dd2f651bfdcdb1615ab739e36a381b2535b1.camel@perches.com>
References: <20190913211349.28245-1-robh@kernel.org>
         <713b2e5bbab16ddf850245ae1d92be66d9730e02.camel@perches.com>
         <CAL_JsqLtEM9+LK=3YDLnoZbC1v09R9-qfFNEH-gTWj94FAjnyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLtEM9+LK=3YDLnoZbC1v09R9-qfFNEH-gTWj94FAjnyg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@canonical.com>
List-Id: devicetree@vger.kernel.org

On Fri, 2019-09-27 at 09:02 -0500, Rob Herring wrote:
> On Fri, Sep 13, 2019 at 4:48 PM Joe Perches <joe@perches.com> wrote:
> > On Fri, 2019-09-13 at 16:13 -0500, Rob Herring wrote:
> > > DT bindings are moving to using a json-schema based schema format
> > > instead of freeform text. Add a checkpatch.pl check to encourage using
> > > the schema for new bindings. It's not yet a requirement, but is
> > > progressively being required by some maintainers.
> > []
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > []
> > > @@ -2822,6 +2822,14 @@ sub process {
> > >                            "added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
> > >               }
> > > 
> > > +# Check for adding new DT bindings not in schema format
> > > +             if (!$in_commit_log &&
> > > +                 ($line =~ /^new file mode\s*\d+\s*$/) &&
> > > +                 ($realfile =~ m@^Documentation/devicetree/bindings/.*\.txt$@)) {
> > > +                     WARN("DT_SCHEMA_BINDING_PATCH",
> > > +                          "DT bindings should be in DT schema format. See: Documentation/devicetree/writing-schema.rst\n");
> > > +             }
> > > +
> > 
> > As this already seems to be git dependent, perhaps
> 
> It's quite rare to see a non git generated diff these days.
> 
> > it's easier to read with a single line test like:
> > 
> >                 if ($line =~ m{^\s*create mode\s*\d+\s*Documentation/devicetree/bindings/.*\.txt$}) {
> >                         etc...
> >                 }
> 
> I frequently do 'git show $commit | scripts/checkpatch.pl' and this
> doesn't work with that. I really should have a '--pretty=email' in
> there, but I just ignore the commit msg warnings. In any case, that
> still doesn't help because there's no diffstat. There's probably some
> way to turn that on or just use git-format-patch, but really we want
> this to work with any git diff.

I don't understand your argument against what I proposed at all.

and btw:

$ git format-patch -1 --stdout <commit> | ./scripts/checkpatch.pl
