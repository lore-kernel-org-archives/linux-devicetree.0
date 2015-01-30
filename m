From: Chris Packham <chrisp-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCH] dtc: Use quotes to include header files
Date: Sat, 31 Jan 2015 05:21:47 +1300 (NZDT)
Message-ID: <alpine.DEB.2.10.1501310514250.16453@chrisp-dl.ws.atlnz.lc>
References: <7947240.7yktm8fT2X@wuerfel> <1418696004-12829-1-git-send-email-chris.packham@alliedtelesis.co.nz> <20150129155646.BBA8AC413BE@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150129155646.BBA8AC413BE-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, jdl-CYoMK+44s/E@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Thu, 29 Jan 2015, Grant Likely wrote:

> On Tue, 16 Dec 2014 15:13:24 +1300
> , Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> wrote:
>> Currently in arch and driver code that needs early access to the
>> flattened device tree it is necessary to add specific CFLAGS so that
>> when scripts/dtc/libfdt/libfdt.h is included the C preprocessor is able
>> to locate the libfdt versions of libfdt_env.h and fdt.h without
>> generating an error.
>>
>> We already provide an alternative linux-specific
>> version of libfdt_env.h and directly include scripts/dtc/libfdt/fdt.h
>> so the inclusion by scripts/dtc/libfdt/libfdt.h is a no-op thanks to the
>> inclusion guards.
>>
>> By using quotes in scripts/dtc/libfdt/libfdt.h it picks up fdt.h and
>> libfdt_env.h from the source directory without needing to add CFLAGS for
>> the sources that happen to include linux/libfdt.h.
>>
>> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
>> ---
>> Hi,
>>
>> This probably should come via git://git.jdl.com/software/dtc.git however
>> this appears to be inaccessible at the moment. Is this still the
>> canonical source for the device tree compiler and libfdt or has it been
>> moved? How much deviation from the canonical source are we prepared to
>> live with in the kernel?
>>
>> This came up on the arm-LKML[1]. Basically in the name of backwards
>> compatibility I need to add a .dt_fixup to add some required nodes to
>> the flattened device tree prior to the tree being un-flattened and
>> processed. This is a trick powerpc makes use of fairly extensively and
>> there are a few other instances of this.
>>
>> For the files that include linux/libfdt.h we currently also have to
>> specify additional CFLAGS to satisfy the CPP.
>>
>>   $ git grep '<linux/libfdt.h>'
>>   arch/mips/cavium-octeon/octeon-platform.c:#include <linux/libfdt.h>
>>   arch/mips/cavium-octeon/setup.c:#include <linux/libfdt.h>
>>   arch/mips/mti-sead3/sead3-setup.c:#include <linux/libfdt.h>
>>   arch/powerpc/kernel/prom.c:#include <linux/libfdt.h>
>>   drivers/firmware/efi/libstub/fdt.c:#include <linux/libfdt.h>
>>   drivers/of/fdt.c:#include <linux/libfdt.h>
>>   drivers/of/fdt_address.c:#include <linux/libfdt.h>
>>
>>   $ git grep -e '-I.*dtc/libfdt'
>>   arch/mips/cavium-octeon/Makefile:CFLAGS_octeon-platform.o = -I$(src)/../../../scripts/dtc/libfdt
>>   arch/mips/cavium-octeon/Makefile:CFLAGS_setup.o = -I$(src)/../../../scripts/dtc/libfdt
>>   arch/mips/mti-sead3/Makefile:CFLAGS_sead3-setup.o = -I$(src)/../../../scripts/dtc/libfdt
>>   arch/powerpc/kernel/Makefile:CFLAGS_prom.o              = -I$(src)/../../../scripts/dtc/libfdt
>>   drivers/firmware/efi/libstub/Makefile:CFLAGS_fdt.o += -I$(srctree)/scripts/dtc/libfdt/
>>   drivers/of/Makefile:CFLAGS_fdt.o = -I$(src)/../../scripts/dtc/libfdt
>>   drivers/of/Makefile:CFLAGS_fdt_address.o = -I$(src)/../../scripts/dtc/libfdt
>>   lib/Makefile:   $(eval CFLAGS_$(file) = -I$(src)/../scripts/dtc/libfdt))
>>
>> Simply by switching to using quotes we can avoid having this extra step.
>>
>> Assuming that this patch is acceptable a follow on clean up would be to
>> remove the instances of CFLAGS_... listed above.
>>
>> Regards,
>> Chris
>> --
>> [1] - http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/310840.html
>>
>>  scripts/dtc/libfdt/libfdt.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/dtc/libfdt/libfdt.h b/scripts/dtc/libfdt/libfdt.h
>> index 73f4975..ea1ddcd 100644
>> --- a/scripts/dtc/libfdt/libfdt.h
>> +++ b/scripts/dtc/libfdt/libfdt.h
>> @@ -51,8 +51,8 @@
>>   *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>>   */
>>
>> -#include <libfdt_env.h>
>> -#include <fdt.h>
>> +#include "libfdt_env.h"
>> +#include "fdt.h"
>
> Until this is resolved with upstream DTC, what about adding dummy
> libfdt.h, libfdt_env.h and fdt.h to include/linux? That would get this
> out of the blocker path for merging this code.
>
> g.
>

I'm traveling right now but I could work up an example patch next week.

>From the other discussions I think there are arguments in favor of keeping 
the angle brackets for the userspace libfdt usage. Any change in the 
kernel either adding dummy files in the system include path or performing 
a subsititution in an import script would probably be permanent.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
