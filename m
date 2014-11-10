From: Ankit Jindal <ankit.jindal@linaro.org>
Subject: Re: [PATCH v3 2/6] uio: Add new UIO_MEM_PHYS_CACHE type for mem regions
Date: Mon, 10 Nov 2014 17:23:10 +0530
Message-ID: <CAPTm99Xa3zB=rqA3Trusy-6Fd30xmUGXgR_BTu_KrzVA-XJuVg@mail.gmail.com>
References: <1413871011-4101-1-git-send-email-ankit.jindal@linaro.org>
 <1413871011-4101-3-git-send-email-ankit.jindal@linaro.org>
 <6D33D50E-2DD1-482C-B05E-45B237F3B779@codeaurora.org> <CAPTm99W0J-Q6CwCDVaYe4eyEWrruWuY5pzpHoESyVu9N3cFA=g@mail.gmail.com>
 <4B098F57-E202-412C-B54D-085A46792EDC@codeaurora.org> <CAPTm99UUA0Oe40uH73Rj8_hvyMYwuxcKhFvU_KVZxmKpR1jn2Q@mail.gmail.com>
 <F22784D5-5BB7-4053-91FD-554A7E1B3901@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <F22784D5-5BB7-4053-91FD-554A7E1B3901@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "patches@apm.com" <patches@apm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Tushar Jagad <tushar.jagad@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Varka Bhadram <varkabhadram@gmail.com>
List-Id: devicetree@vger.kernel.org

On 5 November 2014 20:39, Kumar Gala <galak@codeaurora.org> wrote:
>
> On Nov 5, 2014, at 6:55 AM, Ankit Jindal <ankit.jindal@linaro.org> wr=
ote:
>
>> Hi Kumar,
>>
>> On 31 October 2014 19:09, Kumar Gala <galak@codeaurora.org> wrote:
>>>
>>> On Oct 31, 2014, at 4:30 AM, Ankit Jindal <ankit.jindal@linaro.org>=
 wrote:
>>>
>>>> Hi Kumar,
>>>>
>>>> On 21 October 2014 12:08, Kumar Gala <galak@codeaurora.org> wrote:
>>>>>
>>>>> On Oct 21, 2014, at 7:56 AM, Ankit Jindal <ankit.jindal@linaro.or=
g> wrote:
>>>>>
>>>>>> Currently, three types of mem regions are supported: UIO_MEM_PHY=
S,
>>>>>> UIO_MEM_LOGICAL and UIO_MEM_VIRTUAL. Among these UIO_MEM_PHYS he=
lps
>>>>>> UIO driver export physcial memory to user space as non-cacheable
>>>>>> user memory. Typcially memory-mapped registers of a device are e=
xported
>>>>>> to user space as UIO_MEM_PHYS type mem region. The UIO_MEM_PHYS =
type
>>>>>> is not efficient if dma-capable devices are capable of maintaini=
ng coherency
>>>>>> with CPU caches.
>>>>>>
>>>>>> This patch adds new type UIO_MEM_PHYS_CACHE for mem regions to e=
nable
>>>>>> cacheable access to physical memory from user space.
>>>>>>
>>>>>> Signed-off-by: Ankit Jindal <ankit.jindal@linaro.org>
>>>>>> Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
>>>>>> ---
>>>>>> drivers/uio/uio.c          |   11 ++++++++---
>>>>>> include/linux/uio_driver.h |    1 +
>>>>>> 2 files changed, 9 insertions(+), 3 deletions(-)
>>>>>
>>>>> Rather than adding a new type, why not allow the driver to set th=
e pgprot value, this way one has full control and we don=E2=80=99t need=
 to keep adding types for various different cache attributions in the f=
uture.
>>>>
>>>> Do you mean to add a new field pgprot_t in the memtype structure a=
nd
>>>> uio_mmap_physical will set vma->vm_page_prot to this value provide=
d by
>>>> driver ? If this is the case then we will need to change all the
>>>> current uio based drivers which was the reason I preferred to have=
 a
>>>> new mem type.
>>>>
>>>> Please let me know if I have misunderstood anything.
>>>
>>> I=E2=80=99m suggeting in uio_mmap_physical to do something like:
>>>
>>> if (idev->info->set_pgprot)
>>>        idev->info->set_pgprot(vma->vm_page_prot)
>>> else
>>>        vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
>>>
>>> And add a set_prprot callback to 'struct uio_info=E2=80=99.
>>>
>>> Here=E2=80=99s patch from several years ago:
>>>
>>> http://patchwork.ozlabs.org/patch/119224/
>>
>> The suggested solution looks okey but not sure whether there is any
>> available drivers using different combinations. Also, I looked at th=
e
>> available pgprot routines, looks like only pgprot_noncached and
>> pgprot_writecombine are the available ones. So if we are not going t=
o
>> use these pgprot routines then driver might have architecture
>> dependent switches, which we should avoid.
>
> There are cases that are arch/driver specific that do not fall into p=
gprot_noncached or pgprot_writecombine.  So I don=E2=80=99t see why we =
should limit them.  For example the Freescale networking guys need cach=
eable-noncoherent for some of their UIO work.
>
> We can deal with arch specific issues during review of the UIO driver=
 themselves.

Ok. But, in our case we do not want to set any special attribute,
instead just want to avoid setting non-cacheable attribute. So if we
go by the approach as in your patch, then I need to register a dummy
routine which does nothing.

I think another approach could be to have new mem type as in this
patch and add something like this to this patch:

if (cacheable) {
        /* check if driver want to set any special cacheable attribute
combination */
        if (idev->info->set_pgprot)
                idev->info->set_pgprot(vma->vm_page_prot)
} else {
        vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
}

Please let me know your view.
> - k
>
> --
> Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora F=
orum,
> a Linux Foundation Collaborative Project
>
Thanks,
Ankit
