From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/9] Add dtget utility to read property values from
	device tree
Date: Tue, 19 Jul 2011 13:34:37 +1000
Message-ID: <20110719033437.GB6399@yookeroo.fritz.box>
References: <1309892577-23828-1-git-send-email-sjg@chromium.org>
	<1309892577-23828-3-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1309892577-23828-3-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 05, 2011 at 12:02:50PM -0700, Simon Glass wrote:
> This simply utility makes it easy for scripts to read values from the device
> tree.

This commit message needs more information.  Command line syntax,
expected use cases, ..

> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  .gitignore     |    1 +
>  Makefile       |    7 ++
>  Makefile.dtget |   13 ++++
>  dtget.c        |  207 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

I'd prefer to see it called fdtget, to match the naming of the library
and its functions.  The utility is, after all, specific to the
flattened tree format.

>  4 files changed, 228 insertions(+), 0 deletions(-)
>  create mode 100644 Makefile.dtget
>  create mode 100644 dtget.c
> 
> diff --git a/.gitignore b/.gitignore
> index ae7a46a..cde4fa5 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -10,3 +10,4 @@ lex.yy.c
>  /ftdump
>  /convert-dtsv0
>  /version_gen.h
> +/dtget
> diff --git a/Makefile b/Makefile
> index 22f79a0..3401a65 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -106,10 +106,12 @@ endef
>  include Makefile.convert-dtsv0
>  include Makefile.dtc
>  include Makefile.ftdump
> +include Makefile.dtget
>  
>  BIN += convert-dtsv0
>  BIN += dtc
>  BIN += ftdump
> +BIN += dtget
>  
>  SCRIPTS = dtdiff
>  
> @@ -120,6 +122,7 @@ ifneq ($(DEPTARGETS),)
>  -include $(DTC_OBJS:%.o=%.d)
>  -include $(CONVERT_OBJS:%.o=%.d)
>  -include $(FTDUMP_OBJS:%.o=%.d)
> +-include $(DTGET_OBJS:%.o=%.d)
>  endif
>  
>  
> @@ -180,6 +183,10 @@ convert-dtsv0: $(CONVERT_OBJS)
>  
>  ftdump:	$(FTDUMP_OBJS)
>  
> +dtget:	$(DTGET_OBJS) $(LIBFDT_archive)
> +	$(VECHO) LD $@
> +	$(LINK.c) -o $@ $^
> +
>  
>  #
>  # Testsuite rules
> diff --git a/Makefile.dtget b/Makefile.dtget
> new file mode 100644
> index 0000000..edda499
> --- /dev/null
> +++ b/Makefile.dtget
> @@ -0,0 +1,13 @@
> +#
> +# This is not a complete Makefile.
> +# Instead, it is designed to be easily embeddable
> +# into other systems of Makefiles.
> +#
> +
> +DTGET_SRCS = \
> +	dtget.c \
> +	util.c
> +
> +DTGET_GEN_SRCS =

You have no generated sources, nor are you likely to in future, so you
don't need this.

> +DTGET_OBJS = $(DTGET_SRCS:%.c=%.o) $(DTGET_GEN_SRCS:%.c=%.o)
> diff --git a/dtget.c b/dtget.c
> new file mode 100644
> index 0000000..0ee577c
> --- /dev/null
> +++ b/dtget.c
> @@ -0,0 +1,207 @@
> +/*
> + * Copyright (c) 2011 The Chromium OS Authors. All rights reserved.
> + * Distributed under the terms of the GNU General Public License v2
> + *
> + * is_printable_string from ftdump.c
> + * Contributed by Pantelis Antoniou <pantelis.antoniou AT gmail.com>
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <getopt.h>
> +#include <ctype.h>
> +
> +#include <libfdt.h>
> +
> +#include "util.h"
> +
> +#define FTDUMP_BUF_SIZE	65536

So, first of all the name of this constant is clearly wrong.  But more
importantly, you shouldn't use a fixed size buffer like this.  ftdump
makes no pretense to be anything more than a debugging hack, so it can
get away with it.  dtget is supposed to be a real utility and should
handle arbitrary sized fdt input.

> +static void report_error(const char *where, int err)
> +{
> +	fprintf(stderr, "Error at '%s': %s\n", where, fdt_strerror(err));
> +}
> +
> +static void show_data(const char *format, int type, const char *data, int len)
> +{
> +	int i, size;
> +	const char *p = data, *s;
> +	int value;
> +	int is_string;
> +
> +	/* no data, don't print */
> +	if (len == 0)
> +		return;
> +
> +	is_string = type == 's' ||
                    ^^^^^^^^^^^
parens here please to make it easier to visually parse out from the
assignment.

> +		(!type && util_is_printable_string(data, len));
> +	if (is_string) {
> +		for (s = data; s - data < len; s += strlen(s) + 1) {
> +			if (s != data)
> +				printf(" ");
> +			printf(format ? format : "%s", (const char *)s);
> +		}
> +		return;
> +	}
> +	if (type == 'i')
> +		size = 4;
> +	else if (type == 'b')
> +		size = 1;
> +	else
> +		size = len % 4 == 0 ? 4 : 1;
                       ^^^^^^^^^^^^
parens for clarity here please.

> +	for (i = 0; i < len; i += size, p += size) {
> +		if (i)
> +			printf(" ");
> +		value = size == 4 ? fdt32_to_cpu(*(const uint32_t *)p) :
> +			*(const unsigned char *)p;
> +		printf(format ? format : "%d", value);
> +	}
> +}
> +
> +static int show_data_for_key(const void *blob, const char *format, int type,
> +			     char *key)
> +{
> +	char *ptr, *prop;
> +	int node, guess_node = 0;
> +	const void *value;
> +	int len;
> +
> +	/* First extract the property from the end */
> +	ptr = strrchr(key, '/');
> +	if (!ptr) {
> +		fprintf(stderr, "No node found in key '%s'\n", key);
> +		return 5;
> +	}

This is wrong.  properties do not have paths - they exist in a
separate namespace to nodes.  The node path and property name should
be supplied as separate parameters.  As well as being actually right,
it will greatly simplify this function's convoluted logic.


> +	if (ptr == key) {
> +		guess_node = fdt_path_offset(blob, key);
> +		node = fdt_path_offset(blob, "/");
> +	} else {
> +		*ptr = '\0';
> +		node = fdt_path_offset(blob, key);
> +		*ptr = '/';
> +	}
> +	if (node < 0) {
> +		report_error(key, node);
> +		return 7;

Open-coded arbitrary error codes?  Wtf?

> +	}
> +	prop = ptr + 1;
> +	value = fdt_getprop(blob, node, prop, &len);
> +	if (!value) {
> +		report_error(prop, len);
> +		if (guess_node)
> +			fprintf(stderr, "(Node %s exists but you didn't "
> +				"specify a property to print)\n", key);

Uh.. no.  If the fdt_path_offset() which assigned guess_node failed,
guess_node would be negative and therefore true.  guess_node will only
be zero if fdt_path_offset() returned zero, which should only happen
if key == "/".  Remember zero is a valid node offset referring to the
root node.

> +		return 8;
> +	}
> +	show_data(format, type, value, len);
> +	printf("\n");
> +	return 0;
> +}
> +
> +static int do_dtget(const char *filename, const char *format, int type,
> +		    char **key, int key_count)
> +{
> +	FILE *fp;
> +	char *buf;
> +	size_t size;
> +	int i, ret;
> +
> +	if (strcmp(filename, "-") == 0) {
> +		fp = stdin;
> +	} else {
> +		fp = fopen(filename, "rb");
> +		if (fp == NULL) {
> +			fprintf(stderr, "unable to open %s\n", filename);
> +			return 10;
> +		}
> +	}
> +
> +	buf = malloc(FTDUMP_BUF_SIZE);
> +	if (!buf) {
> +		fprintf(stderr, "Couldn't allocate %d byte buffer\n",
> +			FTDUMP_BUF_SIZE);
> +		return 10;
> +	}
> +
> +	size = fread(buf, 1, FTDUMP_BUF_SIZE, fp);
> +	if (!feof(fp)) {
> +		fprintf(stderr, "file too large (maximum is %d bytes)\n",
> +			FTDUMP_BUF_SIZE);
> +		return 10;
> +	}
> +	if (ferror(fp)) {
> +		fprintf(stderr, "file read error\n");
> +		return 10;
> +	}
> +	for (i = 0; i < key_count; i++) {
> +		ret = show_data_for_key(buf, format, type, key[i]);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static void usage(const char *msg)
> +{
> +	if (msg)
> +		fprintf(stderr, "Error: %s\n\n", msg);
> +	fprintf(stderr, "dtget - read values from device tree\n\n");
> +	fprintf(stderr, "Usage: dtget <options> <dt file> <key>...\n");
> +	fprintf(stderr, "Options:\n");
> +	fprintf(stderr, "\t-f, --format <fmt>\tPrintf format string to use "
> +		"for value\n");
> +	fprintf(stderr, "\t-t, --type <typechar>\tForce type to be string "
> +		"(s), int(i) or byte(b)\n");
> +	fprintf(stderr, "\t-h, --help\t\tPrint this help\n\n");
> +	fprintf(stderr, "\t<key> is <node>/<property>, for example "
> +		"/lcd/width for the width\n");

DO NOT use this node/property format.

Also bare /lcd is a fairly improbably path for a node.

> +	fprintf(stderr, "\tproperty in the LCD node\n");
> +	exit(2);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	int c;
> +	int ret;
> +	char *format = NULL;
> +	int type = 0;
> +	char *filename = NULL;
> +	static struct option long_options[] = {
> +		{"format", 1, 0, 'f'},
> +		{"help", 1, 0, 'h'},
> +		{"type", 1, 0, 't'},
> +		{0, 0, 0, 0}
> +	};
> +
> +	for (;;) {
> +		c = getopt_long(argc, argv, "f:ht:", long_options, NULL);
> +		if (c == -1)
> +			break;

Hrm.  using getopt_long() introduces a new dependency on GNU libc
which I'm not thrilled about.

> +
> +		switch (c) {
> +		case 'h':
> +		case '?':
> +			usage("");
> +
> +		case 'f':
> +			format = optarg;
> +			break;
> +
> +		case 't':
> +			type = *optarg;
> +			break;
> +		}
> +	}

Hrm.  I really dislike your mechanism for choosing the output format.
It's ad-hoc, doesn't really match any existing conventions and without
forcing the format, potentially ambiguous.  Translating \0s into
spaces in stringlist propertys is particularly nasty.  Decimal by
default is also rarely the right choice.  Oh, and the fact that you
could SEGV the utility by giving it a bad format string, since that's
never validated, is really sloppy.

I'd need to know more about likely use cases to suggest a better way
of handling the formatting though.

> +	if (optind < argc)
> +		filename = argv[optind++];
> +	if (!filename)
> +		usage("Missing filename");
> +	if (optind == argc)
> +		usage("Missing key(s)");
> +
> +	ret = do_dtget(filename, format, type, argv + optind, argc - optind);
> +	return ret;
> +}

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
