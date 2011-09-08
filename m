From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH v2 3/6] Add fdtget utility to read property values from
	device tree
Date: Thu, 8 Sep 2011 15:25:47 +1000
Message-ID: <20110908052547.GR30278@yookeroo.fritz.box>
References: <1315425260-2711-1-git-send-email-sjg@chromium.org>
	<1315425260-2711-4-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1315425260-2711-4-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

On Wed, Sep 07, 2011 at 12:54:17PM -0700, Simon Glass wrote:
> This simply utility makes it easy for scripts to read values from the device
> tree. It is written in C and uses the same libfdt as the rest of the dtc
> package.
> 
> What is it for:
> - Reading fdt values from scripts
> - Extracting fdt information within build systems
> - Looking at particular values without having to dump the entire tree
> 
> To use it, specify the fdt binary file on command line followed by a list of
> node, property pairs. The utility then looks up each node, finds the property
> and displays the value.
> 
> Each value is printed on a new line.
> 
> fdtget tries to guess the type of each property based on its contents. This
> is not always reliable, so you can use the -t option to force fdtget to decode
> the value as a string, or byte, etc.
> 
> To read from stdin, use - as the file.
> 
> Usage:
> 	fdtget <options> <dt file> [<node> <property>]...
> Options:
> 	-t [<type>][<format>]	Type of data
> 	-h		Print this help
> 
> 	<type>		One character (s=string, i=int, u=unsigned, b=byte)
> 	<format>	Optional format character (x=hex)

It is not terribly clear how these are combined.

Is there any way to make these more closely resemble printf() style
format specifiers?

> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes in v2:
> - Separate arguments for node and property
> - Merge two related commits into this one
> - Use structure for storing display options
> - Remove use of getopt_long()
> 
>  .gitignore      |    1 +
>  Makefile        |    4 +
>  Makefile.fdtget |   12 +++
>  fdtget.c        |  200 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 217 insertions(+), 0 deletions(-)
>  create mode 100644 Makefile.fdtget
>  create mode 100644 fdtget.c
> 
> diff --git a/.gitignore b/.gitignore
> index ae7a46a..9f27f34 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -10,3 +10,4 @@ lex.yy.c
>  /ftdump
>  /convert-dtsv0
>  /version_gen.h
> +/fdtget
> diff --git a/Makefile b/Makefile
> index 0baada5..3d460d7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -106,10 +106,12 @@ endef
>  include Makefile.convert-dtsv0
>  include Makefile.dtc
>  include Makefile.ftdump
> +include Makefile.fdtget
>  
>  BIN += convert-dtsv0
>  BIN += dtc
>  BIN += ftdump
> +BIN += fdtget
>  
>  SCRIPTS = dtdiff
>  
> @@ -120,6 +122,7 @@ ifneq ($(DEPTARGETS),)
>  -include $(DTC_OBJS:%.o=%.d)
>  -include $(CONVERT_OBJS:%.o=%.d)
>  -include $(FTDUMP_OBJS:%.o=%.d)
> +-include $(FDTGET_OBJS:%.o=%.d)
>  endif
>  
>  
> @@ -180,6 +183,7 @@ convert-dtsv0: $(CONVERT_OBJS)
>  
>  ftdump:	$(FTDUMP_OBJS) $(LIBFDT_archive)
>  
> +fdtget:	$(FDTGET_OBJS) $(LIBFDT_archive)
>  
>  #
>  # Testsuite rules
> diff --git a/Makefile.fdtget b/Makefile.fdtget
> new file mode 100644
> index 0000000..c1ab041
> --- /dev/null
> +++ b/Makefile.fdtget
> @@ -0,0 +1,12 @@
> +#
> +# This is not a complete Makefile.
> +# Instead, it is designed to be easily embeddable
> +# into other systems of Makefiles.
> +#
> +
> +FDTGET_SRCS = \
> +	fdtget.c \
> +	util.c \
> +	utilfdt.c
> +
> +FDTGET_OBJS = $(FDTGET_SRCS:%.c=%.o)
> diff --git a/fdtget.c b/fdtget.c
> new file mode 100644
> index 0000000..4a94e99
> --- /dev/null
> +++ b/fdtget.c
> @@ -0,0 +1,200 @@
> +/*
> + * Copyright (c) 2011 The Chromium OS Authors. All rights reserved.
> + * Distributed under the terms of the GNU General Public License v2
> + *
> + * is_printable_string from ftdump.c
> + * Contributed by Pantelis Antoniou <pantelis.antoniou AT gmail.com>
> + */
> +
> +#include <ctype.h>
> +#include <getopt.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include <libfdt.h>
> +
> +#include "util.h"
> +#include "utilfdt.h"
> +
> +/* Holds information which controls our output and options */
> +struct display_info {
> +	int type;		/* data type (s/i/u/b or 0 for default) */
> +	int format;		/* data format (x or 0 for default) */
> +};
> +
> +static void report_error(const char *where, int err)
> +{
> +	fprintf(stderr, "Error at '%s': %s\n", where, fdt_strerror(err));
> +}
> +
> +/**
> + * Displays data of a given length according to selected options
> + *
> + * If a specific data type is provided in disp, then this is used. Otherwise
> + * we try to guess the data type / size from the contents.
> + *
> + * @param disp		Display information / options
> + * @param data		Data to display
> + * @param len		Maximum length of buffer
> + */
> +static void show_data(struct display_info *disp, const char *data, int len)
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
> +	is_string = (disp->type) == 's' ||
> +		(!disp->type && util_is_printable_string(data, len));
> +	if (is_string) {
> +		for (s = data; s - data < len; s += strlen(s) + 1) {
> +			if (s != data)
> +				printf(" ");
> +			printf("%s", (const char *)s);
> +		}
> +		return;
> +	}
> +	if (disp->type == 'i' || disp->type == 'u')
> +		size = 4;
> +	else if (disp->type == 'b')
> +		size = 1;
> +	else
> +		size = (len % 4) == 0 ? 4 : 1;
> +	for (i = 0; i < len; i += size, p += size) {
> +		if (i)
> +			printf(" ");
> +		value = size == 4 ? fdt32_to_cpu(*(const uint32_t *)p) :
> +			*(const unsigned char *)p;
> +		printf(disp->format == 'x' ? "%x" : "%d", value);
> +	}
> +}
> +
> +/**
> + * Show the data for a given node (and perhaps property) according to the
> + * display option provided.

"and perhaps property"?  AFAICT this will SEGV if property is NULL.

> + * @param blob		FDT blob
> + * @param disp		Display information / options
> + * @param node		Node to display
> + * @param property	Name of property to display, or NULL if none
> + * @return 0 if ok, -ve on error
> + */
> +static int show_data_for_item(const void *blob, struct display_info *disp,
> +		int node, const char *property)
> +{
> +	const void *value = NULL;
> +	int len, err = 0;
> +
> +	value = fdt_getprop(blob, node, property, &len);
> +	if (value) {
> +		show_data(disp, value, len);
> +		printf("\n");
> +	} else {
> +		report_error(property, len);
> +		err = -1;
> +	}
> +	return err;
> +}
> +
> +/**
> + * Run the main fdtget operation, given a filename and valid arguments
> + *
> + * @param disp		Display information / options
> + * @param filename	Filename of blob file
> + * @param arg		List of arguments to process
> + * @param arg_count	Number of arguments
> + * @param return 0 if ok, -ve on error
> + */
> +static int do_fdtget(struct display_info *disp, const char *filename,
> +		     char **arg, int arg_count)
> +{
> +	char *blob;
> +	int i, node;
> +
> +	blob = util_read_fdt(filename);
> +	if (!blob)
> +		return -1;
> +
> +	for (i = 0; i + 2 <= arg_count; i += 2) {
> +		node = fdt_path_offset(blob, arg[0]);
> +		if (node < 0) {
> +			report_error(arg[0], node);
> +			return -1;
> +		}
> +
> +		if (show_data_for_item(blob, disp, node, arg[1]))
> +			return -1;
> +	}
> +	return 0;
> +}
> +
> +static const char *usage_msg =
> +	"fdtget - read values from device tree\n"
> +	"\n"
> +	"Each value is printed on a new line.\n\n"
> +	"Usage:\n"
> +	"	fdtget <options> <dt file> [<node> <property>]...\n"
> +	"Options:\n"
> +	"\t-t [<type>][<format>]\tType of data\n"
> +	"\t-h\t\tPrint this help\n\n"
> +	"\t<type>\t\tOne character (s=string, i=int, u=unsigned, b=byte)\n"
> +	"\t<format>\tOptional format character (x=hex)\n";
> +
> +static void usage(const char *msg)
> +{
> +	if (msg)
> +		fprintf(stderr, "Error: %s\n\n", msg);
> +
> +	fprintf(stderr, "%s", usage_msg);
> +	exit(2);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	char *filename = NULL;
> +	struct display_info disp;
> +
> +	memset(&disp, '\0', sizeof(disp));
> +	for (;;) {
> +		int c = getopt(argc, argv, "ht:");
> +		if (c == -1)
> +			break;
> +
> +		switch (c) {
> +		case 'h':
> +		case '?':
> +			usage("");
> +
> +		case 't':
> +			if (utilfdt_decode_type(optarg, &disp.type,
> +					&disp.format))
> +				usage("Invalid type string");
> +			break;
> +		}
> +	}
> +
> +	if (optind < argc)
> +		filename = argv[optind++];
> +	if (!filename)
> +		usage("Missing filename");
> +
> +	argv += optind;
> +	argc -= optind;
> +
> +	/* Allow no arguments, and silently succeed */
> +	if (!argc)
> +		return 0;
> +
> +	/* Check for node, property arguments */
> +	if (argc % 2)
> +		usage("Must have an even number of arguments");
> +
> +	if (do_fdtget(&disp, filename, argv, argc))
> +		return 1;
> +	return 0;
> +}

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
