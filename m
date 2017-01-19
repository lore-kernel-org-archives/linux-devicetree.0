From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v2 1/5] UDC: Split the driver into amd (pci) and Synopsys
 core driver
Date: Thu, 19 Jan 2017 11:28:33 -0800
Message-ID: <db1037e7-33f2-95ce-2f7a-60fe98d75e0c@gmail.com>
References: <1484640308-25976-1-git-send-email-raviteja.garimella@broadcom.com>
 <1484640308-25976-2-git-send-email-raviteja.garimella@broadcom.com>
 <e1453122-164a-e1a8-6aa6-fb25eb33101f@gmail.com>
 <CAEHZuqO2x8FYW6AWbS5KshMt9UG7R4gWTfG_VaT+rNcAZ5d4Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEHZuqO2x8FYW6AWbS5KshMt9UG7R4gWTfG_VaT+rNcAZ5d4Lg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/19/2017 02:44 AM, Raviteja Garimella wrote:
> Hi,
> 
> On Thu, Jan 19, 2017 at 12:15 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 01/17/2017 12:05 AM, Raviteja Garimella wrote:
>>> This patch splits the amd5536udc driver into two -- one that does
>>> pci device registration and the other file that does the rest of
>>> the driver tasks like the gadget/ep ops etc for Synopsys UDC.
>>>
>>> This way of splitting helps in exporting core driver symbols which
>>> can be used by any other platform/pci driver that is written for
>>> the same Synopsys USB device controller.
>>>
>>> The current patch also includes a change in the Kconfig and Makefile.
>>> A new config option USB_SNP_CORE will be selected automatically when
>>> any one of the platform or pci driver for the same UDC is selected.
>>>
>>> Signed-off-by: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
>> Although the changes you have done make sense and it is most certainly a
>> good idea to split udc core from bus specific glue logic, it is really
>> hard to review the changes per-se because of the file rename, could that
>> happen at a later time?
> 
> If you start looking at this specific patch from the header file (amd5536udc.h),
> the additions in there comprise of:
> - 9 function declarations
> - some module parameter variable declarations that's moved out from the older
>   common file amd5536udc.c
> - 2 #includes that are needed by all files.

Well, I don't really question the changes themselves, rather how this is
presented as a patch series to reviewers.

What I would do, to help introduce both the rename, and the splitting of
core vs. bus-glue specific changes is:

- have an initial patch which extracts the core functionality of the
driver and the PCI bus glue logic into adm5536udc_pci.c and left
adm5536udc.c intact (that would be a small delta to review)

- have a second patch that performs the file rename from adm5536udc.c
into snps_udc_core.c and updates adm5536udc_pci.c eventually as a result
of that, then again, a reviewer can ignore the rename part (don't format
to generate your patches with git format-patch -M in that case) and just
focus on the conversion part for adm5536udc_pci.c

> 
> So, basically what's done for this split is that:
> 1. the static keyword is removed from those 9 functions in the new file
>     snps_udc_core.c and are exported.
> 2. The module parameters declarations (since they are used in both core
>     and pci file) are moved to the header file now.

These should really be part of the commit messages for each commit doing
the changes, this is meant to help a reviewer understand what you are
doing, and to some degree, will help him/her make an educated decision
as to what part of the code the focus should be put on.

Thanks
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
