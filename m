From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] userdiff: Fix some corner cases in dts regex
Date: Tue, 08 Oct 2019 07:43:05 -0700
Message-ID: <20191008144306.B2B0820659@mail.kernel.org>
References: <20191004213029.145027-1-sboyd@kernel.org> <c3a054d9-2646-e440-40c5-b0aecf21e690@kdbg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <c3a054d9-2646-e440-40c5-b0aecf21e690@kdbg.org>
Sender: git-owner@vger.kernel.org
To: Johannes Sixt <j6t@kdbg.org>
Cc: git@vger.kernel.org, Adrian Johnson <ajohnson@redneon.com>, William Duclot <william.duclot@ensimag.grenoble-inp.fr>, Matthieu Moy <matthieu.moy@grenoble-inp.fr>, Junio C Hamano <gitster@pobox.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Johannes Sixt (2019-10-05 07:09:11)
> Am 04.10.19 um 23:30 schrieb Stephen Boyd:
> > While reviewing some dts diffs recently I noticed that the hunk header
> > logic was failing to find the containing node. This is because the regex
> > doesn't consider properties that may span multiple lines, i.e.
> >=20
> >       property =3D <something>,
> >                  <something_else>;
>=20
> What if the property spans more than two lines?
>=20
>         property =3D <something>,
>                    more,
>                    <something_else>;
>=20
> Can the second line "more," begin with a word, or are the angle brackets
> mandatory?

Angle brackets aren't mandatory, but it is very odd to have a property
with mixed numbers and strings because parsing becomes difficult.

>=20
> I understand that the continuation lines can begin with a word when the
> property is an expression that is distributed over a number of lines.
> Such continuation lines could be picked up as hunk headers.
>=20
> But I don't want to complicate things: The hunk header patterns do not
> have to be perfect; it is sufficient when they are helpful in a good
> majority of cases that occur in practice.
>=20
> > and it got hung up on comments inside nodes that look like the root node
> > because they start with '/*'. Add tests for these cases and update the
> > regex to find them. Maybe detecting the root node is too complicated but
> > forcing it to be a backslash with any amount of whitespace up to an open
> > bracket seemed OK. I tried to detect that a comment is in-between the
> > two parts but I wasn't happy so I just dropped it.
> >=20
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> >  t/t4018/dts-nodes-multiline-prop | 12 ++++++++++++
> >  t/t4018/dts-root                 |  2 +-
> >  t/t4018/dts-root-comment         |  8 ++++++++
> >  userdiff.c                       |  3 ++-
> >  4 files changed, 23 insertions(+), 2 deletions(-)
> >  create mode 100644 t/t4018/dts-nodes-multiline-prop
> >  create mode 100644 t/t4018/dts-root-comment
> >=20
> > diff --git a/t/t4018/dts-nodes-multiline-prop b/t/t4018/dts-nodes-multi=
line-prop
> > new file mode 100644
> > index 000000000000..f7b655935429
> > --- /dev/null
> > +++ b/t/t4018/dts-nodes-multiline-prop
> > @@ -0,0 +1,12 @@
> > +/ {
> > +     label_1: node1@ff00 {
> > +             RIGHT@deadf00,4000 {
> > +                     multilineprop =3D <3>,
> > +                                     <4>;
>=20
> You could insert more lines to demonstrate that "<x>," on a line by
> itself is not picked up.

Maybe I should add another test?

>=20
> > +
> > +
> > +> +                  ChangeMe =3D <0xffeedd00>;
>=20
> Sufficient distance to the incorrect candidates above. Good.
>=20
> > +             };
> > +     };
> > +};
> > diff --git a/t/t4018/dts-root b/t/t4018/dts-root
> > index 2ef9e6ffaa2c..4353b8220c91 100644
> > --- a/t/t4018/dts-root
> > +++ b/t/t4018/dts-root
> > @@ -1,4 +1,4 @@
> > -/RIGHT { /* Technically just supposed to be a slash */
> > +/ { RIGHT /* Technically just supposed to be a slash and brace */
>=20
> Do I understand correctly that the updated form, "/ {", is the common
> way to spell a root node, but "/" or "/word" are not?

Correct. A root node is '/' and the '{' opens the node. There is the
possibility of something like '/delete-node nodename;' or
'/delete-property property;', where the latter exists inside some node.
The regex would need to avoid all of those.

>=20
> >       #size-cells =3D <1>;
> > =20
> >       ChangeMe =3D <0xffeedd00>;
> > diff --git a/t/t4018/dts-root-comment b/t/t4018/dts-root-comment
> > new file mode 100644
> > index 000000000000..333a625c7007
> > --- /dev/null
> > +++ b/t/t4018/dts-root-comment
> > @@ -0,0 +1,8 @@
> > +/ { RIGHT /* Technically just supposed to be a slash and brace */
>=20
> Devil's advocate here: insert ';' or '=3D' in the comment, and the line
> would not be picked up. Does that hurt in practice?

I don't think it hurts in practice so I'd like to ignore it.

>=20
> > +     #size-cells =3D <1>;
> > +
> > +     /* This comment should be ignored */
> > +
> > +     some-property =3D <40+2>;
> > +     ChangeMe =3D <0xffeedd00>;
> > +};
> > diff --git a/userdiff.c b/userdiff.c
> > index 86e3244e15dd..651b56caec56 100644
> > --- a/userdiff.c
> > +++ b/userdiff.c
> > @@ -25,8 +25,9 @@ IPATTERN("ada",
> >        "|=3D>|\\.\\.|\\*\\*|:=3D|/=3D|>=3D|<=3D|<<|>>|<>"),
> >  PATTERNS("dts",
> >        "!;\n"
> > +      "!.*=3D.*\n"
>=20
> This behaves the same way as just
>=20
>         "!=3D\n"
>=20
> no?
>=20

Not exactly. Properties don't always get assigned. There are boolean
properties that can be tested for by the presence of some string with an
ending semi-colon, like 'this-is-true;'. If we just check for not equal
to a line with a semicolon and newline then we'll see boolean
properties. Should I add that as another test?
