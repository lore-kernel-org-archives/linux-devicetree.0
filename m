From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/9] Add dtget utility to read property values from device
	tree
Date: Fri, 29 Jul 2011 00:22:45 +1200
Message-ID: <CAPnjgZ3GgOx-Sja2Lq2WzYy+FYv3oyUF9vzdZ8RPYE-Hsmjf0Q@mail.gmail.com>
References: <1309892577-23828-1-git-send-email-sjg@chromium.org>
	<1309892577-23828-3-git-send-email-sjg@chromium.org>
	<20110719033437.GB6399@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110719033437.GB6399-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On Tue, Jul 19, 2011 at 3:34 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Tue, Jul 05, 2011 at 12:02:50PM -0700, Simon Glass wrote:
>> This simply utility makes it easy for scripts to read values from the de=
vice
>> tree.
>
> This commit message needs more information. =A0Command line syntax,
> expected use cases, ..

OK I will come up with something.

>
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>> =A0.gitignore =A0 =A0 | =A0 =A01 +
>> =A0Makefile =A0 =A0 =A0 | =A0 =A07 ++
>> =A0Makefile.dtget | =A0 13 ++++
>> =A0dtget.c =A0 =A0 =A0 =A0| =A0207 +++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++
>
> I'd prefer to see it called fdtget, to match the naming of the library
> and its functions. =A0The utility is, after all, specific to the
> flattened tree format.

A bit of a mouthful, but ok.

fdtget
fdtput

Also is put better than set? I didn't like set since it implied
setting an existing value whereas we are potentially putting a new
value into the tree.

>
>> =A04 files changed, 228 insertions(+), 0 deletions(-)
>> =A0create mode 100644 Makefile.dtget
>> =A0create mode 100644 dtget.c
>>
>> diff --git a/.gitignore b/.gitignore
>> index ae7a46a..cde4fa5 100644
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -10,3 +10,4 @@ lex.yy.c
>> =A0/ftdump
>> =A0/convert-dtsv0
>> =A0/version_gen.h
>> +/dtget
>> diff --git a/Makefile b/Makefile
>> index 22f79a0..3401a65 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -106,10 +106,12 @@ endef
>> =A0include Makefile.convert-dtsv0
>> =A0include Makefile.dtc
>> =A0include Makefile.ftdump
>> +include Makefile.dtget
>>
>> =A0BIN +=3D convert-dtsv0
>> =A0BIN +=3D dtc
>> =A0BIN +=3D ftdump
>> +BIN +=3D dtget
>>
>> =A0SCRIPTS =3D dtdiff
>>
>> @@ -120,6 +122,7 @@ ifneq ($(DEPTARGETS),)
>> =A0-include $(DTC_OBJS:%.o=3D%.d)
>> =A0-include $(CONVERT_OBJS:%.o=3D%.d)
>> =A0-include $(FTDUMP_OBJS:%.o=3D%.d)
>> +-include $(DTGET_OBJS:%.o=3D%.d)
>> =A0endif
>>
>>
>> @@ -180,6 +183,10 @@ convert-dtsv0: $(CONVERT_OBJS)
>>
>> =A0ftdump: =A0 =A0 =A0$(FTDUMP_OBJS)
>>
>> +dtget: =A0 =A0 =A0 $(DTGET_OBJS) $(LIBFDT_archive)
>> + =A0 =A0 $(VECHO) LD $@
>> + =A0 =A0 $(LINK.c) -o $@ $^
>> +
>>
>> =A0#
>> =A0# Testsuite rules
>> diff --git a/Makefile.dtget b/Makefile.dtget
>> new file mode 100644
>> index 0000000..edda499
>> --- /dev/null
>> +++ b/Makefile.dtget
>> @@ -0,0 +1,13 @@
>> +#
>> +# This is not a complete Makefile.
>> +# Instead, it is designed to be easily embeddable
>> +# into other systems of Makefiles.
>> +#
>> +
>> +DTGET_SRCS =3D \
>> + =A0 =A0 dtget.c \
>> + =A0 =A0 util.c
>> +
>> +DTGET_GEN_SRCS =3D
>
> You have no generated sources, nor are you likely to in future, so you
> don't need this.

ok

>
>> +DTGET_OBJS =3D $(DTGET_SRCS:%.c=3D%.o) $(DTGET_GEN_SRCS:%.c=3D%.o)
>> diff --git a/dtget.c b/dtget.c
>> new file mode 100644
>> index 0000000..0ee577c
>> --- /dev/null
>> +++ b/dtget.c
>> @@ -0,0 +1,207 @@
>> +/*
>> + * Copyright (c) 2011 The Chromium OS Authors. All rights reserved.
>> + * Distributed under the terms of the GNU General Public License v2
>> + *
>> + * is_printable_string from ftdump.c
>> + * Contributed by Pantelis Antoniou <pantelis.antoniou AT gmail.com>
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <getopt.h>
>> +#include <ctype.h>
>> +
>> +#include <libfdt.h>
>> +
>> +#include "util.h"
>> +
>> +#define FTDUMP_BUF_SIZE =A0 =A0 =A065536
>
> So, first of all the name of this constant is clearly wrong. =A0But more
> importantly, you shouldn't use a fixed size buffer like this. =A0ftdump
> makes no pretense to be anything more than a debugging hack, so it can
> get away with it. =A0dtget is supposed to be a real utility and should
> handle arbitrary sized fdt input.

Thanks for the promotion :-) Yes that's easy enough to do and I
suppose in theory an fdt could be larger than 64KB.

>
>> +static void report_error(const char *where, int err)
>> +{
>> + =A0 =A0 fprintf(stderr, "Error at '%s': %s\n", where, fdt_strerror(err=
));
>> +}
>> +
>> +static void show_data(const char *format, int type, const char *data, i=
nt len)
>> +{
>> + =A0 =A0 int i, size;
>> + =A0 =A0 const char *p =3D data, *s;
>> + =A0 =A0 int value;
>> + =A0 =A0 int is_string;
>> +
>> + =A0 =A0 /* no data, don't print */
>> + =A0 =A0 if (len =3D=3D 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
>> +
>> + =A0 =A0 is_string =3D type =3D=3D 's' ||
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0^^^^^^^^^^^
> parens here please to make it easier to visually parse out from the
> assignment.
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 (!type && util_is_printable_string(data, len));
>> + =A0 =A0 if (is_string) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 for (s =3D data; s - data < len; s +=3D strlen=
(s) + 1) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (s !=3D data)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf(" ");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf(format ? format : "%s",=
 (const char *)s);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
>> + =A0 =A0 }
>> + =A0 =A0 if (type =3D=3D 'i')
>> + =A0 =A0 =A0 =A0 =A0 =A0 size =3D 4;
>> + =A0 =A0 else if (type =3D=3D 'b')
>> + =A0 =A0 =A0 =A0 =A0 =A0 size =3D 1;
>> + =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 size =3D len % 4 =3D=3D 0 ? 4 : 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^^^^^^^^^^^^
> parens for clarity here please.
>
>> + =A0 =A0 for (i =3D 0; i < len; i +=3D size, p +=3D size) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (i)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printf(" ");
>> + =A0 =A0 =A0 =A0 =A0 =A0 value =3D size =3D=3D 4 ? fdt32_to_cpu(*(const=
 uint32_t *)p) :
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *(const unsigned char *)p;
>> + =A0 =A0 =A0 =A0 =A0 =A0 printf(format ? format : "%d", value);
>> + =A0 =A0 }
>> +}
>> +
>> +static int show_data_for_key(const void *blob, const char *format, int =
type,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char *key)
>> +{
>> + =A0 =A0 char *ptr, *prop;
>> + =A0 =A0 int node, guess_node =3D 0;
>> + =A0 =A0 const void *value;
>> + =A0 =A0 int len;
>> +
>> + =A0 =A0 /* First extract the property from the end */
>> + =A0 =A0 ptr =3D strrchr(key, '/');
>> + =A0 =A0 if (!ptr) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "No node found in key '%s'\n",=
 key);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 5;
>> + =A0 =A0 }
>
> This is wrong. =A0properties do not have paths - they exist in a
> separate namespace to nodes. =A0The node path and property name should
> be supplied as separate parameters. =A0As well as being actually right,
> it will greatly simplify this function's convoluted logic.

Well yes, but I feel that it makes it harder to use also. My thinking
with this was to try to make it easy to extract information. In my
view:

/lcd/width

is better than

/lcd width

But this is the kind of discussion / feedback I was hoping to get as I
am new to device trees. My thoughts:

1. / is not generally used in property names so there is no conflict
2. Neither is there any ambiguity
3. The 'complex' logic is there to make life easy for the poor
hard-pressed user.
4. Creating the concept of a sort-of unified name space for a device
tree property is probably not a bad idea.

>
>
>> + =A0 =A0 if (ptr =3D=3D key) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 guess_node =3D fdt_path_offset(blob, key);
>> + =A0 =A0 =A0 =A0 =A0 =A0 node =3D fdt_path_offset(blob, "/");
>> + =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 *ptr =3D '\0';
>> + =A0 =A0 =A0 =A0 =A0 =A0 node =3D fdt_path_offset(blob, key);
>> + =A0 =A0 =A0 =A0 =A0 =A0 *ptr =3D '/';
>> + =A0 =A0 }
>> + =A0 =A0 if (node < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 report_error(key, node);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 7;
>
> Open-coded arbitrary error codes? =A0Wtf?

Just following along with the code I found - it felt like less that 10
and more than 5 :-)

>
>> + =A0 =A0 }
>> + =A0 =A0 prop =3D ptr + 1;
>> + =A0 =A0 value =3D fdt_getprop(blob, node, prop, &len);
>> + =A0 =A0 if (!value) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 report_error(prop, len);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (guess_node)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "(Node %s exis=
ts but you didn't "
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "specify a pro=
perty to print)\n", key);
>
> Uh.. no. =A0If the fdt_path_offset() which assigned guess_node failed,
> guess_node would be negative and therefore true. =A0guess_node will only
> be zero if fdt_path_offset() returned zero, which should only happen
> if key =3D=3D "/". =A0Remember zero is a valid node offset referring to t=
he
> root node.

OK - it seemed to work fine in my testing but I will take a closer look.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 8;
>> + =A0 =A0 }
>> + =A0 =A0 show_data(format, type, value, len);
>> + =A0 =A0 printf("\n");
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static int do_dtget(const char *filename, const char *format, int type,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char **key, int key_count)
>> +{
>> + =A0 =A0 FILE *fp;
>> + =A0 =A0 char *buf;
>> + =A0 =A0 size_t size;
>> + =A0 =A0 int i, ret;
>> +
>> + =A0 =A0 if (strcmp(filename, "-") =3D=3D 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 fp =3D stdin;
>> + =A0 =A0 } else {
>> + =A0 =A0 =A0 =A0 =A0 =A0 fp =3D fopen(filename, "rb");
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (fp =3D=3D NULL) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "unable to ope=
n %s\n", filename);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 10;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>> + =A0 =A0 buf =3D malloc(FTDUMP_BUF_SIZE);
>> + =A0 =A0 if (!buf) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "Couldn't allocate %d byte buf=
fer\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 FTDUMP_BUF_SIZE);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 10;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 size =3D fread(buf, 1, FTDUMP_BUF_SIZE, fp);
>> + =A0 =A0 if (!feof(fp)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "file too large (maximum is %d=
 bytes)\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 FTDUMP_BUF_SIZE);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 10;
>> + =A0 =A0 }
>> + =A0 =A0 if (ferror(fp)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "file read error\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 10;
>> + =A0 =A0 }
>> + =A0 =A0 for (i =3D 0; i < key_count; i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D show_data_for_key(buf, format, type, k=
ey[i]);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> + =A0 =A0 }
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static void usage(const char *msg)
>> +{
>> + =A0 =A0 if (msg)
>> + =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "Error: %s\n\n", msg);
>> + =A0 =A0 fprintf(stderr, "dtget - read values from device tree\n\n");
>> + =A0 =A0 fprintf(stderr, "Usage: dtget <options> <dt file> <key>...\n");
>> + =A0 =A0 fprintf(stderr, "Options:\n");
>> + =A0 =A0 fprintf(stderr, "\t-f, --format <fmt>\tPrintf format string to=
 use "
>> + =A0 =A0 =A0 =A0 =A0 =A0 "for value\n");
>> + =A0 =A0 fprintf(stderr, "\t-t, --type <typechar>\tForce type to be str=
ing "
>> + =A0 =A0 =A0 =A0 =A0 =A0 "(s), int(i) or byte(b)\n");
>> + =A0 =A0 fprintf(stderr, "\t-h, --help\t\tPrint this help\n\n");
>> + =A0 =A0 fprintf(stderr, "\t<key> is <node>/<property>, for example "
>> + =A0 =A0 =A0 =A0 =A0 =A0 "/lcd/width for the width\n");
>
> DO NOT use this node/property format.
>
> Also bare /lcd is a fairly improbably path for a node.

We have it.

>
>> + =A0 =A0 fprintf(stderr, "\tproperty in the LCD node\n");
>> + =A0 =A0 exit(2);
>> +}
>> +
>> +int main(int argc, char *argv[])
>> +{
>> + =A0 =A0 int c;
>> + =A0 =A0 int ret;
>> + =A0 =A0 char *format =3D NULL;
>> + =A0 =A0 int type =3D 0;
>> + =A0 =A0 char *filename =3D NULL;
>> + =A0 =A0 static struct option long_options[] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 {"format", 1, 0, 'f'},
>> + =A0 =A0 =A0 =A0 =A0 =A0 {"help", 1, 0, 'h'},
>> + =A0 =A0 =A0 =A0 =A0 =A0 {"type", 1, 0, 't'},
>> + =A0 =A0 =A0 =A0 =A0 =A0 {0, 0, 0, 0}
>> + =A0 =A0 };
>> +
>> + =A0 =A0 for (;;) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 c =3D getopt_long(argc, argv, "f:ht:", long_op=
tions, NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (c =3D=3D -1)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>
> Hrm. =A0using getopt_long() introduces a new dependency on GNU libc
> which I'm not thrilled about.

How should I implement long options? Or would you rather I just didn't?

>
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 switch (c) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 case 'h':
>> + =A0 =A0 =A0 =A0 =A0 =A0 case '?':
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 usage("");
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 case 'f':
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 format =3D optarg;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 case 't':
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 type =3D *optarg;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>
> Hrm. =A0I really dislike your mechanism for choosing the output format.
> It's ad-hoc, doesn't really match any existing conventions and without
> forcing the format, potentially ambiguous. =A0Translating \0s into
> spaces in stringlist propertys is particularly nasty. =A0Decimal by
> default is also rarely the right choice. =A0Oh, and the fact that you
> could SEGV the utility by giving it a bad format string, since that's
> never validated, is really sloppy.

Yes this is the comment I was expecting. It works for our use case but
I agree it is probably too flexible/open for a general utility.

I don't follow you wrt the transaction of \0 into space.

Perhaps just a -f option with:

x - hex
s - string
i - int
u - unsigned int

?

I suppose people can then format the value into a string themselves.

>
> I'd need to know more about likely use cases to suggest a better way
> of handling the formatting though.
>

Well most of the time we just want a string, hex value or integer
(base 10) value. I think it is reasonable to simplify things.

Regards,
Simon

>> + =A0 =A0 if (optind < argc)
>> + =A0 =A0 =A0 =A0 =A0 =A0 filename =3D argv[optind++];
>> + =A0 =A0 if (!filename)
>> + =A0 =A0 =A0 =A0 =A0 =A0 usage("Missing filename");
>> + =A0 =A0 if (optind =3D=3D argc)
>> + =A0 =A0 =A0 =A0 =A0 =A0 usage("Missing key(s)");
>> +
>> + =A0 =A0 ret =3D do_dtget(filename, format, type, argv + optind, argc -=
 optind);
>> + =A0 =A0 return ret;
>> +}
>
> --
> David Gibson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| I'll have my music =
baroque, and my code
> david AT gibson.dropbear.id.au =A0| minimalist, thank you. =A0NOT _the_ _=
other_
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| _way_ _a=
round_!
> http://www.ozlabs.org/~dgibson
>
