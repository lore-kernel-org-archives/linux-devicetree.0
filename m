From: Franck Jullien <franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] x86: bzImage: Allow the appending of a device tree binary
Date: Fri, 21 Oct 2016 23:12:52 +0200
Message-ID: <CAJfOKBydtpvrz93sEfLxtbGrxrb3hDEw21Xgr5-hhrmczOE1uw@mail.gmail.com>
References: <1476512960-22406-1-git-send-email-franck.jullien@gmail.com> <20161021173855.GE17287@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161021173855.GE17287@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jose Abreu <jose.abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-10-21 19:38 GMT+02:00 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>:
> On Sat, Oct 15, 2016 at 08:29:20AM +0200, Franck Jullien wrote:
>> This patch provides the ability to boot using a device tree that is appended
>> to the raw binary bzImage (e.g. cat bzImage <filename>.dtb > bzImage_w_dtb).
>>
>> Based on Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> work on x86
>> builtin dtb support.
>>
>> Signed-off-by: Franck Jullien <franck.jullien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> I understand that the rationale for this is to describe devices
> instantiated dynamically on an FPGA (or to provide a base for overlays
> to be applied when they are later instantiated).
>
> I don't think that this, as it stands, is a good idea.
>
> For one thing, this provides us with no notion of topology (i.e. where
> the FPGA device falls in the interconnect hierarchy), as there's no
> "nexus" defined where the DT bridges onto the existing ACPI topology.
>
> Worse, even if that were present, we have no way of mapping things like
> interrupts across the ACPI/DT boundary, and more complex things like
> IOMMU mastering (where ACPI and DT differ quite substantially).
>
> Generally, I do not think that mixing ACPI and DT is a good idea, as
> there are a number of conceptual differences, and there is no trivial
> mapping between them generally.
>

The problem is that some drivers are only compatible with a DT
configuration model (for example Xilinx Video modules).

Most of the time, FPGA are connected to PCIe. So, we can find them and
map PCI ressources to peripherals they provide.
I agree some work has to be done on this part (see previously
mentioned discussion).

> If you need to work atop of ACPI, I think that you need extensions to
> ACPI, rather than attempting to graft DT atop.
>

As I don't know ACPI details can you elaborate a bit more ?

>> +config X86_APPENDED_DTB
>> +     bool "Use appended device tree blob to bzImage"
>> +     depends on OF
>> +     select OF_EARLY_FLATTREE
>> +     help
>> +       With this option, the boot code will look for a device tree binary
>> +       (DTB) appended to bzImage
>> +       (e.g. cat bzImage <filename>.dtb > bzImage_w_dtb).
>> +
>> +       This is meant as a backward compatibility convenience for those
>> +       systems with a bootloader that can't be upgraded to accommodate
>> +       the documented boot protocol using a device tree.
>> +
>> +       Beware that there is very little in terms of protection against
>> +       this option being confused by leftover garbage in memory that might
>> +       look like a DTB header after a reboot if no actual DTB is appended
>> +       to bzImage.  Do not leave this option active in a production kernel
>> +       if you don't intend to always append a DTB.
>
> I would advise that you reword this, as the existing wording is clearly
> not applicable.
>

You're right. After I send this, I realized it should be reword.

> Thanks,
> Mark.

Thanks for your comments.

Franck.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
