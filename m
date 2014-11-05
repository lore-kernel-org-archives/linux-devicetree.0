From: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/6] uio: Add new UIO_MEM_PHYS_CACHE type for mem regions
Date: Wed, 5 Nov 2014 18:25:51 +0530
Message-ID: <CAPTm99UUA0Oe40uH73Rj8_hvyMYwuxcKhFvU_KVZxmKpR1jn2Q@mail.gmail.com>
References: <1413871011-4101-1-git-send-email-ankit.jindal@linaro.org>
 <1413871011-4101-3-git-send-email-ankit.jindal@linaro.org>
 <6D33D50E-2DD1-482C-B05E-45B237F3B779@codeaurora.org> <CAPTm99W0J-Q6CwCDVaYe4eyEWrruWuY5pzpHoESyVu9N3cFA=g@mail.gmail.com>
 <4B098F57-E202-412C-B54D-085A46792EDC@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4B098F57-E202-412C-B54D-085A46792EDC-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kumar,

On 31 October 2014 19:09, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
> On Oct 31, 2014, at 4:30 AM, Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> w=
rote:
>
>> Hi Kumar,
>>
>> On 21 October 2014 12:08, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>>>
>>> On Oct 21, 2014, at 7:56 AM, Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>=
 wrote:
>>>
>>>> Currently, three types of mem regions are supported: UIO_MEM_PHYS,
>>>> UIO_MEM_LOGICAL and UIO_MEM_VIRTUAL. Among these UIO_MEM_PHYS help=
s
>>>> UIO driver export physcial memory to user space as non-cacheable
>>>> user memory. Typcially memory-mapped registers of a device are exp=
orted
>>>> to user space as UIO_MEM_PHYS type mem region. The UIO_MEM_PHYS ty=
pe
>>>> is not efficient if dma-capable devices are capable of maintaining=
 coherency
>>>> with CPU caches.
>>>>
>>>> This patch adds new type UIO_MEM_PHYS_CACHE for mem regions to ena=
ble
>>>> cacheable access to physical memory from user space.
>>>>
>>>> Signed-off-by: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> Signed-off-by: Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> ---
>>>> drivers/uio/uio.c          |   11 ++++++++---
>>>> include/linux/uio_driver.h |    1 +
>>>> 2 files changed, 9 insertions(+), 3 deletions(-)
>>>
>>> Rather than adding a new type, why not allow the driver to set the =
pgprot value, this way one has full control and we don=E2=80=99t need t=
o keep adding types for various different cache attributions in the fut=
ure.
>>
>> Do you mean to add a new field pgprot_t in the memtype structure and
>> uio_mmap_physical will set vma->vm_page_prot to this value provided =
by
>> driver ? If this is the case then we will need to change all the
>> current uio based drivers which was the reason I preferred to have a
>> new mem type.
>>
>> Please let me know if I have misunderstood anything.
>
> I=E2=80=99m suggeting in uio_mmap_physical to do something like:
>
> if (idev->info->set_pgprot)
>         idev->info->set_pgprot(vma->vm_page_prot)
> else
>         vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
>
> And add a set_prprot callback to 'struct uio_info=E2=80=99.
>
> Here=E2=80=99s patch from several years ago:
>
> http://patchwork.ozlabs.org/patch/119224/

The suggested solution looks okey but not sure whether there is any
available drivers using different combinations. Also, I looked at the
available pgprot routines, looks like only pgprot_noncached and
pgprot_writecombine are the available ones. So if we are not going to
use these pgprot routines then driver might have architecture
dependent switches, which we should avoid.

Thanks,
Ankit
>
> - k
>
> --
> Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora F=
orum,
> a Linux Foundation Collaborative Project
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
