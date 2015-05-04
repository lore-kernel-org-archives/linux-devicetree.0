From: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] Import of dtc/libfdt upstream into kernel
Date: Mon, 4 May 2015 16:36:06 -0500
Message-ID: <CABGGisxrBCNW2XiHk_BHr1Nro0FFxQpL01_C3yoxhgPH1XfKKg@mail.gmail.com>
References: <1430688676-7919-1-git-send-email-gaurav.minocha.os@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430688676-7919-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 3, 2015 at 4:31 PM, Gaurav Minocha
<gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The following script is used to import dtc upstream
> into kernel. It was missing import of dtc/libfdt, with
> this commit it will include the same.
>
> Following is a temporary fix, should be removed once fixed in
> DTC upstream. Currently in arch and driver code that needs early access
> to the flattened device tree it is necessary to add specific CFLAGS
> so that when scripts/dtc/libfdt/libfdt.h is included the C
> preprocessor is able to locate the libfdt versions of libfdt_env.h
> and fdt.h without generating an error. So, this script replaces
> angular brackets with quotation used to include header files
> fdt.h and libfdt_env.h.
>
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

I've applied the previous version. This looks the same AFAICT. I
reworded the headline and also added a 'git add' after the sed script.

Rob

>  scripts/dtc/update-dtc-source.sh | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
> index feb01ef..cde59e9 100755
> --- a/scripts/dtc/update-dtc-source.sh
> +++ b/scripts/dtc/update-dtc-source.sh
> @@ -34,6 +34,7 @@ DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c
>                 srcpos.h treesource.c util.c util.h version_gen.h Makefile.dtc \
>                 dtc-lexer.l dtc-parser.y"
>  DTC_GENERATED="dtc-lexer.lex.c dtc-parser.tab.c dtc-parser.tab.h"
> +LIBFDT_SOURCE="Makefile.libfdt fdt.c fdt.h fdt_empty_tree.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
>
>  # Build DTC
>  cd $DTC_UPSTREAM_PATH
> @@ -50,5 +51,13 @@ for f in $DTC_GENERATED; do
>         cp ${DTC_UPSTREAM_PATH}/$f ${f}_shipped
>         git add ${f}_shipped
>  done
> +for f in $LIBFDT_SOURCE; do
> +       cp ${DTC_UPSTREAM_PATH}/libfdt/${f} libfdt/${f}
> +       git add libfdt/${f}
> +done
> +
> +# Temporary fix: it should be removed once fixed in DTC upstream
> +sed -i -- 's/#include <libfdt_env.h>/#include "libfdt_env.h"/g' ./libfdt/libfdt.h
> +sed -i -- 's/#include <fdt.h>/#include "fdt.h"/g' ./libfdt/libfdt.h
>
>  git commit -e -v -m "scripts/dtc: Update to upstream version [CHANGEME]"
> --
> 2.1.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
