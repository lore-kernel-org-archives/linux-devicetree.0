From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] userdiff: Add a builtin pattern for dts files
Date: Mon, 19 Aug 2019 13:44:50 -0700
Message-ID: <20190819204451.522D422CEB@mail.kernel.org>
References: <20190816225658.8946-1-sboyd@kernel.org> <98f9cdc2-fa9b-b639-b906-44b17f0efd76@kdbg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <98f9cdc2-fa9b-b639-b906-44b17f0efd76@kdbg.org>
Sender: git-owner@vger.kernel.org
To: Johannes Sixt <j6t@kdbg.org>
Cc: git@vger.kernel.org, Adrian Johnson <ajohnson@redneon.com>, William Duclot <william.duclot@ensimag.grenoble-inp.fr>, Matthieu Moy <matthieu.moy@grenoble-inp.fr>, devicetree@vger.kernel.org, Alban Gruin <alban.gruin@gmail.com>, Junio C Hamano <gitster@pobox.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Johannes Sixt (2019-08-19 11:40:47)
> Am 17.08.19 um 00:56 schrieb Stephen Boyd:
> > The Linux kernel receives many patches to the devicetree files each
> > release. The hunk header for those patches typically show nothing,
> > making it difficult to figure out what node is being modified without
> > applying the patch or opening the file and seeking to the context. Let's
> > add a builtin 'dts' pattern to git so that users can get better diff
> > output on dts files when they use the diff=3Ddts driver.
> >=20
> > The regex has been constructed based on the spec at devicetree.org[1]
> >=20
> > [1] https://github.com/devicetree-org/devicetree-specification/releases=
/latest
> >=20
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> >=20
> > Sending this again after getting feedback and it getting stuck in
> > review[1]. I'm not sure what happened with the meta question from Junio
> > to add a way for various projects to introduce their own patterns, but
> > I'd still prefer to have this in git proper because the kernel uses git
> > extensively and we rely on git formatted patches in our workflow. I
> > recently reviewed a dts change and remembered this never got accepted.
> >=20
> > Changes from v1:
> >  * Updated regex to handle anything after node names instead of
> >    requiring a '{'
> >  * Updated test for boolean relation operators
> >  * Sent out a patch to devicetree spec to document % operator
> >=20
> > [1] Feedback was in 16335abe-5e7e-fd7a-25f4-373f94e176e1@gmail.com
>=20
> Thanks. I've a few suggestions below.
>=20
> > diff --git a/t/t4018/dts-labels b/t/t4018/dts-labels
> > new file mode 100644
> > index 000000000000..27cd4921cfb6
> > --- /dev/null
> > +++ b/t/t4018/dts-labels
> > @@ -0,0 +1,8 @@
> > +/ {
> > +     label_1: node1@ff00 {
> > +             label2: RIGHT {
> > +                     vendor,some-property;
> > +                     ChangeMe =3D <0x45-30>;
>=20
> In these tests, it would be worthwhile to leave another (possibly blank)
> line before the ChangeMe line in order to demonstrate that lines
> beginning with a word, such as the 'vendor,some-property;' line, are
> _not_ picked up when they are not in the hunk context.

Sure. I can add a blank line. Did you want it on all the tests or just
some of them?

> > diff --git a/userdiff.c b/userdiff.c
> > index e74a6d402255..1db5d30aaebe 100644
> > --- a/userdiff.c
> > +++ b/userdiff.c
> > @@ -23,6 +23,15 @@ IPATTERN("ada",
> >        "[a-zA-Z][a-zA-Z0-9_]*"
> >        "|[-+]?[0-9][0-9#_.aAbBcCdDeEfF]*([eE][+-]?[0-9_]+)?"
> >        "|=3D>|\\.\\.|\\*\\*|:=3D|/=3D|>=3D|<=3D|<<|>>|<>"),
> > +PATTERNS("dts",
> > +      /* Node name with optional label and unit address */
> > +      "^[ \t]*((([a-zA-Z_][a-zA-Z0-9_]*:[ \t]*)?[a-zA-Z][a-zA-Z0-9,._+=
-]*(@[a-zA-Z0-9,._+-]+)?"
>=20
> From the examples I see in this patch, it looks like lines ending in a
> ';' are not candidates, everything that begins with 'word' or '&word'
> is. Wouldn't that greatly simplify these patterns?
>=20
>         "!;\n"
>         /* lines beginning with a word optionally preceded by '&' */
>         "^[ \t]*(&?([a-zA-Z_].*)"

Right. I was stuck with my old regex ways where it wasn't considering
lines that didn't end in a semicolon. This looks like it will work.

>=20
> > +      /* Reference */
> > +      "|&[a-zA-Z_][a-zA-Z0-9_]*)[ \t]*[^;]*)$",
>=20
> Note that you don't have to replicate the syntax faithfully in the
> patterns because you can assume that files adhere to the correct syntax.
> You could merge this into the former pattern by just matching "&?" after
> the initial whitespace.

Ok. Thanks for simplifying by providing the regex above. I'll rework and
resend.
