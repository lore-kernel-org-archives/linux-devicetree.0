From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] of/address: replace printk() with pr_debug() /
 pr_err()
Date: Wed, 09 Dec 2015 12:09:28 -0800
Message-ID: <1449691768.25389.51.camel@perches.com>
References: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
	 <1449591386.3315.2.camel@perches.com>
	 <1449594231.13275.2.camel@perches.com>
	 <CAL_JsqJ0oftptSxyAcGOnQ3XA9v55B2n=8DiWBcErcLKgfsppg@mail.gmail.com>
	 <1449619439.18646.20.camel@perches.com>
	 <CAHp75VeN3hX4Dus6LLaie5c3xkdgQQc55fCOoAQ15JNib9La=A@mail.gmail.com>
	 <1449689319.25389.28.camel@perches.com>
	 <CAHp75VdHrG_uk9K7B=q8+ZnjNehJ2AY=-RsMGByxn62Uh_-sRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdHrG_uk9K7B=q8+ZnjNehJ2AY=-RsMGByxn62Uh_-sRA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-12-09 at 22:02 +0200, Andy Shevchenko wrote:
> On Wed, Dec 9, 2015 at 9:28 PM, Joe Perches <joe@perches.com> wrote:
[]
> > > > diff --git a/lib/hexdump.c b/lib/hexdump.c
> > > > index 992457b..49113aa 100644
> > > > --- a/lib/hexdump.c
> > > > +++ b/lib/hexdump.c
> > > > @@ -81,6 +81,7 @@ EXPORT_SYMBOL(bin2hex);
> > > > =A0 * @len: number of bytes in the @buf
> > > > =A0 * @rowsize: number of bytes to print per line; must be 16 o=
r 32
> > > > =A0 * @groupsize: number of bytes to print at a time (1, 2, 4, =
8; default =3D 1)
> > > > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0OR'd with DUMP_TYPE_B=
E or DUMP_TYPE_LE for endian conversions
> > > > =A0 * @linebuf: where to put the converted data
> > > > =A0 * @linebuflen: total size of @linebuf, including space for =
terminating NUL
> > > > =A0 * @ascii: include ASCII after the hex output
> > > > @@ -114,19 +115,20 @@ int hex_dump_to_buffer(const void *buf, s=
ize_t len, int rowsize, int groupsize,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0int j, lx =3D 0;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0int ascii_column;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0int ret;
> > > > +=A0=A0=A0=A0=A0=A0=A0int actual_groupsize =3D groupsize & ~(DU=
MP_TYPE_LE | DUMP_TYPE_BE);
> > >=20
> > > I would rather prefer to have function parameter to be renamed.
> > >=20
> > > E.g. gsflags ?
> > >=20
> >=20
> > Well, it's a bit simpler changelog.
>=20
> Generally I'm fine with this version, though take into account above =
and below.
>=20
> > ---
> > =A0include/linux/printk.h |=A0=A07 +++++++
> > =A0lib/hexdump.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0| 39 ++++++++++++++++=
+++++++++++++++--------
> > =A02 files changed, 38 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/include/linux/printk.h b/include/linux/printk.h
> > index 9729565..4be190c 100644
> > --- a/include/linux/printk.h
> > +++ b/include/linux/printk.h
> > @@ -424,6 +424,13 @@ enum {
> > =A0=A0=A0=A0=A0=A0=A0=A0DUMP_PREFIX_ADDRESS,
> > =A0=A0=A0=A0=A0=A0=A0=A0DUMP_PREFIX_OFFSET
> > =A0};
> > +
> > +enum {
> > +=A0=A0=A0=A0=A0=A0=A0DUMP_TYPE_CPU =3D 0,
>=20
> And still open this, do we need it? I think you may just mention in
> the documentation that default behaviour is CPU like.

The only documentation I'm aware of is the kernel-doc

> > +=A0=A0=A0=A0=A0=A0=A0DUMP_TYPE_LE =3D BIT(30),
> > +=A0=A0=A0=A0=A0=A0=A0DUMP_TYPE_BE =3D BIT(31)
> > +};
> > +
> > =A0extern int hex_dump_to_buffer(const void *buf, size_t len, int r=
owsize,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0int groupsize, char *linebuf, size_t linebuflen,
>=20
> Here as well to change.

Right, thanks.

> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0bool ascii);
> > diff --git a/lib/hexdump.c b/lib/hexdump.c
> > index 992457b..5b1eda70 100644
> > --- a/lib/hexdump.c
> > +++ b/lib/hexdump.c
> > @@ -80,7 +80,8 @@ EXPORT_SYMBOL(bin2hex);
> > =A0 * @buf: data blob to dump
> > =A0 * @len: number of bytes in the @buf
> > =A0 * @rowsize: number of bytes to print per line; must be 16 or 32
> > - * @groupsize: number of bytes to print at a time (1, 2, 4, 8; def=
ault =3D 1)
> > + * @groupflags: number of bytes to print at a time (1, 2, 4, 8; de=
fault =3D 1)
> > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0OR with DUMP_TYPE_BE o=
r DUMP_TYPE_LE for endian conversions
>=20
> Maybe specify "bitwise OR with.." ?
