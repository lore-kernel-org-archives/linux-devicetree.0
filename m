From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v3 2/6] uio: Add new UIO_MEM_PHYS_CACHE type for mem regions
Date: Fri, 31 Oct 2014 08:39:29 -0500
Message-ID: <4B098F57-E202-412C-B54D-085A46792EDC@codeaurora.org>
References: <1413871011-4101-1-git-send-email-ankit.jindal@linaro.org> <1413871011-4101-3-git-send-email-ankit.jindal@linaro.org> <6D33D50E-2DD1-482C-B05E-45B237F3B779@codeaurora.org> <CAPTm99W0J-Q6CwCDVaYe4eyEWrruWuY5pzpHoESyVu9N3cFA=g@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPTm99W0J-Q6CwCDVaYe4eyEWrruWuY5pzpHoESyVu9N3cFA=g@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Oct 31, 2014, at 4:30 AM, Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wro=
te:

> Hi Kumar,
>=20
> On 21 October 2014 12:08, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>>=20
>> On Oct 21, 2014, at 7:56 AM, Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
>>=20
>>> Currently, three types of mem regions are supported: UIO_MEM_PHYS,
>>> UIO_MEM_LOGICAL and UIO_MEM_VIRTUAL. Among these UIO_MEM_PHYS helps
>>> UIO driver export physcial memory to user space as non-cacheable
>>> user memory. Typcially memory-mapped registers of a device are expo=
rted
>>> to user space as UIO_MEM_PHYS type mem region. The UIO_MEM_PHYS typ=
e
>>> is not efficient if dma-capable devices are capable of maintaining =
coherency
>>> with CPU caches.
>>>=20
>>> This patch adds new type UIO_MEM_PHYS_CACHE for mem regions to enab=
le
>>> cacheable access to physical memory from user space.
>>>=20
>>> Signed-off-by: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>> drivers/uio/uio.c          |   11 ++++++++---
>>> include/linux/uio_driver.h |    1 +
>>> 2 files changed, 9 insertions(+), 3 deletions(-)
>>=20
>> Rather than adding a new type, why not allow the driver to set the p=
gprot value, this way one has full control and we don=92t need to keep =
adding types for various different cache attributions in the future.
>=20
> Do you mean to add a new field pgprot_t in the memtype structure and
> uio_mmap_physical will set vma->vm_page_prot to this value provided b=
y
> driver ? If this is the case then we will need to change all the
> current uio based drivers which was the reason I preferred to have a
> new mem type.
>=20
> Please let me know if I have misunderstood anything.

I=92m suggeting in uio_mmap_physical to do something like:

if (idev->info->set_pgprot)
	idev->info->set_pgprot(vma->vm_page_prot)
else
	vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);

And add a set_prprot callback to 'struct uio_info=92.

Here=92s patch from several years ago:

http://patchwork.ozlabs.org/patch/119224/

- k

--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
