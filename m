From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] userdiff: Add a builtin pattern for dts files
Date: Thu, 17 Jan 2019 16:13:41 -0600
Message-ID: <CAL_JsqLKQDfK=_M=od2_G6Y4mbdkMn3hLvL+BuSZBEOZKB--pQ@mail.gmail.com>
References: <20190111215127.57356-1-sboyd@kernel.org> <16335abe-5e7e-fd7a-25f4-373f94e176e1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <16335abe-5e7e-fd7a-25f4-373f94e176e1@gmail.com>
Sender: git-owner@vger.kernel.org
To: Alban Gruin <alban.gruin@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, git@vger.kernel.org, Adrian Johnson <ajohnson@redneon.com>, William Duclot <william.duclot@ensimag.grenoble-inp.fr>, Johannes Sixt <j6t@kdbg.org>, Matthieu Moy <matthieu.moy@grenoble-inp.fr>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 13, 2019 at 3:26 PM Alban Gruin <alban.gruin@gmail.com> wrote:
>
> Hi Stephen,
>
> thank you for your patch.  I left a few comments below.
>
> Le 11/01/2019 =C3=A0 22:51, Stephen Boyd a =C3=A9crit :
> > The Linux kernel receives many patches to the devicetree files each
> > release. The hunk header for those patches typically show nothing,
> > making it difficult to figure out what node is being modified without
> > applying the patch or opening the file and seeking to the context. Let'=
s
> > add a builtin 'dts' pattern to git so that users can get better diff
> > output on dts files when they use the diff=3Ddts driver.
> >
> > The regex has been constructed based on the spec at devicetree.org[1]
> >
> > [1] https://github.com/devicetree-org/devicetree-specification/releases=
/latest
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> > ---
> >  Documentation/gitattributes.txt |  2 ++
> >  t/t4018-diff-funcname.sh        |  1 +
> >  t/t4018/dts-labels              |  8 +++++++
> >  t/t4018/dts-node-unitless       |  8 +++++++
> >  t/t4018/dts-nodes               |  8 +++++++
> >  t/t4018/dts-reference           |  8 +++++++
> >  t/t4034-diff-words.sh           |  1 +
> >  t/t4034/dts/expect              | 37 +++++++++++++++++++++++++++++++++
> >  t/t4034/dts/post                | 32 ++++++++++++++++++++++++++++
> >  t/t4034/dts/pre                 | 32 ++++++++++++++++++++++++++++
> >  userdiff.c                      |  9 ++++++++
> >  11 files changed, 146 insertions(+)
> >  create mode 100644 t/t4018/dts-labels
> >  create mode 100644 t/t4018/dts-node-unitless
> >  create mode 100644 t/t4018/dts-nodes
> >  create mode 100644 t/t4018/dts-reference
> >  create mode 100644 t/t4034/dts/expect
> >  create mode 100644 t/t4034/dts/post
> >  create mode 100644 t/t4034/dts/pre
> >
> > -%<-
> > diff --git a/userdiff.c b/userdiff.c
> > index 97007abe5b16..2bc964e11089 100644
> > --- a/userdiff.c
> > +++ b/userdiff.c
> > @@ -23,6 +23,15 @@ IPATTERN("ada",
> >        "[a-zA-Z][a-zA-Z0-9_]*"
> >        "|[-+]?[0-9][0-9#_.aAbBcCdDeEfF]*([eE][+-]?[0-9_]+)?"
> >        "|=3D>|\\.\\.|\\*\\*|:=3D|/=3D|>=3D|<=3D|<<|>>|<>"),
> > +PATTERNS("dts",
> > +      /* Node name (with optional label and unit address) */
> > +      "^[ \t]*((([a-zA-Z_][a-zA-Z0-9_]*: )?[a-zA-Z][a-zA-Z0-9,._+-]*(@=
[a-zA-Z0-9,._+-]+)?"
>
> From the spec, label and node names =E2=80=9Cshall be [between] 1 to 31
> characters in length=E2=80=9D.  It=E2=80=99s not enforced here, and I gue=
ss it=E2=80=99s not
> really git=E2=80=99s job to check for this kind of rule.  Others may disa=
gree
> with me, though.

The spec does say 31 characters, but that's never been enforced. So,
of course, there are occurrences in the wild (though maybe they were
just property names, not node names). In any case, we plan to change
the spec to increase the size. To what, I don't know.

Rob
