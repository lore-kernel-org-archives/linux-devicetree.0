From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] of: treat PCI config space as IORESOURCE_MEM type
Date: Thu, 29 May 2014 19:29:31 -0600
Message-ID: <CAErSpo7qEhJyUAu58R8g6+AEhRGo_+Vv0EMgkK+3ZQOU9+jmhg@mail.gmail.com>
References: <1401379426-9701-1-git-send-email-galak@codeaurora.org>
 <CAL_JsqLPFDwtd-QYDqCwx1JVj1Aa8=nof-e0P6R9CZra+fXHfw@mail.gmail.com>
 <47B1E3D0-4336-4529-80B0-172F4ACA5C97@codeaurora.org> <20140530005602.GE1677@bart.dudau.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140530005602.GE1677-hOhETlTuV5niMG9XS5x8Mg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 29, 2014 at 6:56 PM, Liviu Dudau <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org> wrote:
> On Thu, May 29, 2014 at 03:51:28PM -0500, Kumar Gala wrote:
>>
>> On May 29, 2014, at 3:44 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> > On Thu, May 29, 2014 at 11:03 AM, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> >> If we have a PCI config space specified in something like a ranges
>> >> property we should treat it as memory type resource.
>> >
>> > Config space should not be in ranges[1]. We have some cases that are,
>> > but we don't want new ones.
>>
>> For the cases we have I agree, however an ECAM based cfg seems completely legit.
>>
>> >> Signed-off-by: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> >> ---
>> >> drivers/of/address.c | 3 +++
>> >> 1 file changed, 3 insertions(+)
>> >>
>> >> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> >> index cb4242a..4e7ee59 100644
>> >> --- a/drivers/of/address.c
>> >> +++ b/drivers/of/address.c
>> >> @@ -122,6 +122,9 @@ static unsigned int of_bus_pci_get_flags(const __be32 *addr)
>> >>        u32 w = be32_to_cpup(addr);
>> >>
>> >>        switch((w >> 24) & 0x03) {
>> >> +       case 0x00: /* cfg space */
>> >> +               flags |= IORESOURCE_MEM;
>> >> +               break;
>> >
>> > How would you then distinguish actual memory ranges?
>>
>> One assumes you are still looking at pci_space as part of of_pci_range
>
> That doesn't happen when you start scanning the bus. The existing code will
> use the IORESOURCE_MEM for allocating memory space for devices, which is
> not what you want. Did you test your patch on any PCI system? I'm pretty
> sure that with my patch series that tries to make a generic framework for
> host controllers this will fail.
>
> We really need a IORESOURCE_CFG flag for this space.

Maybe, but I'm not convinced yet.  The existing IORESOURCE_TYPE_BITS
types are for things that are mutually exclusive address spaces.  I
think this discussion is about ECAM, where the CPU side is definitely
in the same address space (IORESOURCE_MEM) as RAM, APICs, host bridge
apertures, device MMIO, etc.  The ECAM area must appear in the
iomem_resource tree so we avoid it when allocating other areas.

>> > [1] http://www.spinics.net/lists/linux-pci/msg30585.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
