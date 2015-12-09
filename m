From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] of/address: replace printk() with pr_debug() /
 pr_err()
Date: Wed, 09 Dec 2015 11:28:39 -0800
Message-ID: <1449689319.25389.28.camel@perches.com>
References: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
	 <1449591386.3315.2.camel@perches.com>
	 <1449594231.13275.2.camel@perches.com>
	 <CAL_JsqJ0oftptSxyAcGOnQ3XA9v55B2n=8DiWBcErcLKgfsppg@mail.gmail.com>
	 <1449619439.18646.20.camel@perches.com>
	 <CAHp75VeN3hX4Dus6LLaie5c3xkdgQQc55fCOoAQ15JNib9La=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeN3hX4Dus6LLaie5c3xkdgQQc55fCOoAQ15JNib9La=A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-12-09 at 14:03 +0200, Andy Shevchenko wrote:
> On Wed, Dec 9, 2015 at 2:03 AM, Joe Perches <joe@perches.com> wrote:
> > On Tue, 2015-12-08 at 15:28 -0600, Rob Herring wrote:
> > > On Tue, Dec 8, 2015 at 11:03 AM, Joe Perches <joe@perches.com> wr=
ote:
> > > > On Tue, 2015-12-08 at 08:16 -0800, Joe Perches wrote:
> > > > > On Wed, 2015-12-09 at 01:07 +0900, Masahiro Yamada wrote:
> > > > > > Trivial changes suggested by checkpatch.pl.
> > > > > []
> > > > > > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > > > > []
> > > > > > @@ -23,7 +23,7 @@ static int __of_address_to_resource(struc=
t device_node *dev,
> > > > > > =A0#ifdef DEBUG
> > > > > > =A0static void of_dump_addr(const char *s, const __be32 *ad=
dr, int na)
> > > > > > =A0{
> > > > > > -=A0=A0=A0printk(KERN_DEBUG "%s", s);
> > > > > > +=A0=A0=A0pr_debug("%s", s);
> > > > > > =A0=A0=A0=A0while (na--)
> > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0printk(" %08x", be32_to=
_cpu(*(addr++)));
> > > > > > =A0=A0=A0=A0printk("\n");
> > []
> > > > static void of_dumpaddr(const char *s, const __be32 *addr, int =
na)
> > > > {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0print_hex_dump_debug(s, DUMP_PREFIX_NON=
E, 16, 1,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0addr, na * sizeof(__be32), false);
> > > > }
> > >=20
> > > Except that it doesn't do the endian swapping. Looking closer at =
this,
> > > we should just drop this hunk. So I will take v1.
> >=20
> > Maybe endian conversions should be added to hex_dump_debug like:
> > (probably doesn't apply.=A0=A0Evolution 3.18 is horrible)
>=20
> Overall the idea is not bad I think, though few comments below.
> Besides that, please, update test_hexdump (wrt my update to the test
> suite [1]) to go through BE test cases.
>=20
> [1] http://www.spinics.net/lists/kernel/msg2139337.html

I don't want to have to learn that code as it seems a bit tricky.
Maybe you could do it.

> > diff --git a/lib/hexdump.c b/lib/hexdump.c
> > index 992457b..49113aa 100644
> > --- a/lib/hexdump.c
> > +++ b/lib/hexdump.c
> > @@ -81,6 +81,7 @@ EXPORT_SYMBOL(bin2hex);
> > =A0 * @len: number of bytes in the @buf
> > =A0 * @rowsize: number of bytes to print per line; must be 16 or 32
> > =A0 * @groupsize: number of bytes to print at a time (1, 2, 4, 8; d=
efault =3D 1)
> > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0OR'd with DUMP_TYPE_BE or=
 DUMP_TYPE_LE for endian conversions
> > =A0 * @linebuf: where to put the converted data
> > =A0 * @linebuflen: total size of @linebuf, including space for term=
inating NUL
> > =A0 * @ascii: include ASCII after the hex output
> > @@ -114,19 +115,20 @@ int hex_dump_to_buffer(const void *buf, size_=
t len, int rowsize, int groupsize,
> > =A0=A0=A0=A0=A0=A0=A0=A0int j, lx =3D 0;
> > =A0=A0=A0=A0=A0=A0=A0=A0int ascii_column;
> > =A0=A0=A0=A0=A0=A0=A0=A0int ret;
> > +=A0=A0=A0=A0=A0=A0=A0int actual_groupsize =3D groupsize & ~(DUMP_T=
YPE_LE | DUMP_TYPE_BE);
>=20
> I would rather prefer to have function parameter to be renamed.
>=20
> E.g. gsflags ?
>=20

Well, it's a bit simpler changelog.
---
=A0include/linux/printk.h |=A0=A07 +++++++
=A0lib/hexdump.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0| 39 ++++++++++++++++++++=
+++++++++++--------
=A02 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index 9729565..4be190c 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -424,6 +424,13 @@ enum {
=A0	DUMP_PREFIX_ADDRESS,
=A0	DUMP_PREFIX_OFFSET
=A0};
+
+enum {
+	DUMP_TYPE_CPU =3D 0,
+	DUMP_TYPE_LE =3D BIT(30),
+	DUMP_TYPE_BE =3D BIT(31)
+};
+
=A0extern int hex_dump_to_buffer(const void *buf, size_t len, int rowsi=
ze,
=A0			=A0=A0=A0=A0=A0=A0int groupsize, char *linebuf, size_t linebuflen=
,
=A0			=A0=A0=A0=A0=A0=A0bool ascii);
diff --git a/lib/hexdump.c b/lib/hexdump.c
index 992457b..5b1eda70 100644
--- a/lib/hexdump.c
+++ b/lib/hexdump.c
@@ -80,7 +80,8 @@ EXPORT_SYMBOL(bin2hex);
=A0 * @buf: data blob to dump
=A0 * @len: number of bytes in the @buf
=A0 * @rowsize: number of bytes to print per line; must be 16 or 32
- * @groupsize: number of bytes to print at a time (1, 2, 4, 8; default=
 =3D 1)
+ * @groupflags: number of bytes to print at a time (1, 2, 4, 8; defaul=
t =3D 1)
+ *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0OR with DUMP_TYPE_BE or DU=
MP_TYPE_LE for endian conversions
=A0 * @linebuf: where to put the converted data
=A0 * @linebuflen: total size of @linebuf, including space for terminat=
ing NUL
=A0 * @ascii: include ASCII after the hex output
@@ -105,7 +106,7 @@ EXPORT_SYMBOL(bin2hex);
=A0 * (excluding the terminating NUL) which would have been written to =
the final
=A0 * string if enough space had been available.
=A0 */
-int hex_dump_to_buffer(const void *buf, size_t len, int rowsize, int g=
roupsize,
+int hex_dump_to_buffer(const void *buf, size_t len, int rowsize, int g=
roupflags,
=A0		=A0=A0=A0=A0=A0=A0=A0char *linebuf, size_t linebuflen, bool ascii)
=A0{
=A0	const u8 *ptr =3D buf;
@@ -114,6 +115,7 @@ int hex_dump_to_buffer(const void *buf, size_t len,=
 int rowsize, int groupsize,
=A0	int j, lx =3D 0;
=A0	int ascii_column;
=A0	int ret;
+	int groupsize =3D groupflags & ~(DUMP_TYPE_LE | DUMP_TYPE_BE);
=A0
=A0	if (rowsize !=3D 16 && rowsize !=3D 32)
=A0		rowsize =3D 16;
@@ -138,9 +140,16 @@ int hex_dump_to_buffer(const void *buf, size_t len=
, int rowsize, int groupsize,
=A0		const u64 *ptr8 =3D buf;
=A0
=A0		for (j =3D 0; j < ngroups; j++) {
+			u64 val;
+
+			if (groupflags & DUMP_TYPE_LE)
+				val =3D get_unaligned_le64(ptr8 + j);
+			else if (groupflags & DUMP_TYPE_BE)
+				val =3D get_unaligned_be64(ptr8 + j);
+			else
+				val =3D get_unaligned(ptr8 + j);
=A0			ret =3D snprintf(linebuf + lx, linebuflen - lx,
-				=A0=A0=A0=A0=A0=A0=A0"%s%16.16llx", j ? " " : "",
-				=A0=A0=A0=A0=A0=A0=A0get_unaligned(ptr8 + j));
+				=A0=A0=A0=A0=A0=A0=A0"%s%16.16llx", j ? " " : "", val);
=A0			if (ret >=3D linebuflen - lx)
=A0				goto overflow1;
=A0			lx +=3D ret;
@@ -149,9 +158,16 @@ int hex_dump_to_buffer(const void *buf, size_t len=
, int rowsize, int groupsize,
=A0		const u32 *ptr4 =3D buf;
=A0
=A0		for (j =3D 0; j < ngroups; j++) {
+			u32 val;
+
+			if (groupflags & DUMP_TYPE_LE)
+				val =3D get_unaligned_le32(ptr4 + j);
+			else if (groupflags & DUMP_TYPE_BE)
+				val =3D get_unaligned_be32(ptr4 + j);
+			else
+				val =3D get_unaligned(ptr4 + j);
=A0			ret =3D snprintf(linebuf + lx, linebuflen - lx,
-				=A0=A0=A0=A0=A0=A0=A0"%s%8.8x", j ? " " : "",
-				=A0=A0=A0=A0=A0=A0=A0get_unaligned(ptr4 + j));
+				=A0=A0=A0=A0=A0=A0=A0"%s%8.8x", j ? " " : "", val);
=A0			if (ret >=3D linebuflen - lx)
=A0				goto overflow1;
=A0			lx +=3D ret;
@@ -160,9 +176,16 @@ int hex_dump_to_buffer(const void *buf, size_t len=
, int rowsize, int groupsize,
=A0		const u16 *ptr2 =3D buf;
=A0
=A0		for (j =3D 0; j < ngroups; j++) {
+			u16 val;
+
+			if (groupflags & DUMP_TYPE_LE)
+				val =3D get_unaligned_le16(ptr2 + j);
+			else if (groupflags & DUMP_TYPE_BE)
+				val =3D get_unaligned_be16(ptr2 + j);
+			else
+				val =3D get_unaligned(ptr2 + j);
=A0			ret =3D snprintf(linebuf + lx, linebuflen - lx,
-				=A0=A0=A0=A0=A0=A0=A0"%s%4.4x", j ? " " : "",
-				=A0=A0=A0=A0=A0=A0=A0get_unaligned(ptr2 + j));
+				=A0=A0=A0=A0=A0=A0=A0"%s%4.4x", j ? " " : "", val);
=A0			if (ret >=3D linebuflen - lx)
=A0				goto overflow1;
=A0			lx +=3D ret;
