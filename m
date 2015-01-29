From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dtc: Use quotes to include header files
Date: Thu, 29 Jan 2015 10:30:02 -0600
Message-ID: <CAL_JsqJ9P8Wco3szNW0gU-mSV=ryDr6ZfZ3y1XETYuVOX6XYNA@mail.gmail.com>
References: <7947240.7yktm8fT2X@wuerfel> <1418696004-12829-1-git-send-email-chris.packham@alliedtelesis.co.nz>
 <20150129155646.BBA8AC413BE@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150129155646.BBA8AC413BE-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 29, 2015 at 9:56 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, 16 Dec 2014 15:13:24 +1300
> , Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
>  wrote:
>> Currently in arch and driver code that needs early access to the
>> flattened device tree it is necessary to add specific CFLAGS so that
>> when scripts/dtc/libfdt/libfdt.h is included the C preprocessor is able
>> to locate the libfdt versions of libfdt_env.h and fdt.h without
>> generating an error.

[...]

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

2 of those already exist. Is it only a matter of adding fdt.h or is
there more to it?

This could also be carried as part of the import script to fix up.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
