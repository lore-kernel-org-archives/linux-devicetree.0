From: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/6] uio: Add new UIO_MEM_PHYS_CACHE type for mem regions
Date: Mon, 8 Dec 2014 18:13:28 +0530
Message-ID: <CAPTm99WWk6XZnEjwjiDoxxGZdR6WccFXZBAjOfpWNq1dWrBfjw@mail.gmail.com>
References: <1416220572-13381-1-git-send-email-ankit.jindal@linaro.org>
 <1416220572-13381-3-git-send-email-ankit.jindal@linaro.org> <20141127000147.GC5313@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141127000147.GC5313-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Anup Patel <anup-aa5cPYPs4nSSZfiimGR9Ow@public.gmane.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27 November 2014 at 05:31, Greg Kroah-Hartman
<gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> On Mon, Nov 17, 2014 at 04:06:08PM +0530, Ankit Jindal wrote:
>> Currently, three types of mem regions are supported: UIO_MEM_PHYS,
>> UIO_MEM_LOGICAL and UIO_MEM_VIRTUAL. Among these UIO_MEM_PHYS helps
>> UIO driver export physcial memory to user space as non-cacheable
>> user memory. Typcially memory-mapped registers of a device are exported
>> to user space as UIO_MEM_PHYS type mem region. The UIO_MEM_PHYS type
>> is not efficient if dma-capable devices are capable of maintaining coherency
>> with CPU caches.
>
> Not efficient in what way?
Sorry, I will rephrase this.
>
>> This patch adds new type UIO_MEM_PHYS_CACHE for mem regions to enable
>> cacheable access to physical memory from user space.
>>
>> Signed-off-by: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  drivers/uio/uio.c          |   11 ++++++++---
>>  include/linux/uio_driver.h |    1 +
>>  2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
>> index 97e6444..120a84b 100644
>> --- a/drivers/uio/uio.c
>> +++ b/drivers/uio/uio.c
>> @@ -644,7 +644,7 @@ static const struct vm_operations_struct uio_physical_vm_ops = {
>>  #endif
>>  };
>>
>> -static int uio_mmap_physical(struct vm_area_struct *vma)
>> +static int uio_mmap_physical(struct vm_area_struct *vma, bool cacheable)
>
> I despise "bool" flags in a function, as they don't give any idea of
> what is going on when you see the function being called.  Please create
> a new function that does this properly, with a correct name, if it's
> needed.
Sure, will take care of this in next revision.
>
> thanks,
>
> greg k-h
Thanks,
Ankit
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
