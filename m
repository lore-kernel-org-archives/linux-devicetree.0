From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] scripts/dtc: add fdt_overlay.c and fdt_addresses.c to
 sync script
Date: Tue, 3 Oct 2017 17:23:28 -0500
Message-ID: <CAL_Jsq+Ruvu11Nu92FtgGcO0PqxCQk5KhiQAgj8JzbzPKNseqQ@mail.gmail.com>
References: <20171003183118.2438-1-robh@kernel.org> <20171003220417.GA13661@bill-the-cat>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171003220417.GA13661@bill-the-cat>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kyle Yan <kyan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 3, 2017 at 5:04 PM, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> On Tue, Oct 03, 2017 at 01:31:17PM -0500, Rob Herring wrote:
>
>> libfdt has gained some new files. We need to include them in the
>> kernel's copy.
>>
>> Reported-by: Kyle Yan <kyan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  scripts/dtc/update-dtc-source.sh | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
>> index b8ebcc6722d2..f3e5c596050a 100755
>> --- a/scripts/dtc/update-dtc-source.sh
>> +++ b/scripts/dtc/update-dtc-source.sh
>> @@ -34,7 +34,9 @@ DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c
>>               srcpos.h treesource.c util.c util.h version_gen.h Makefile.dtc \
>>               dtc-lexer.l dtc-parser.y"
>>  DTC_GENERATED="dtc-lexer.lex.c dtc-parser.tab.c dtc-parser.tab.h"
>> -LIBFDT_SOURCE="Makefile.libfdt fdt.c fdt.h fdt_empty_tree.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
>> +LIBFDT_SOURCE="Makefile.libfdt fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
>> +             fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
>> +             fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
>
> Should there be a patch #3 to update the kernel libfdt to include these
> new files that we're copying in too?  That seems to be the main user
> in-tree of the libfdt C files, aside from the 'libfdt' targets under
> arch/{arm,powerpc}/boot/  Thanks!

Yes, good point. But we can add them when someone wants to use them.
Adding them to the build will bloat the kernel because libfdt doesn't
get built as a static lib (another problem to solve).

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
