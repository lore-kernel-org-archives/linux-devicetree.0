From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] pci, thunder: Add PCIe host controller devicetree bindings
Date: Thu, 25 Sep 2014 14:10:33 -0600
Message-ID: <CAErSpo5rhL7pLha-yWt7sZUBmAnwA6FkacL+sWXBKkSzsuC7Sg@mail.gmail.com>
References: <1411573068-12952-1-git-send-email-rric@kernel.org>
 <8057985.kyfsioKAVy@wuerfel> <CAErSpo4oFLKbtddzVoXBN-1dXZn5C4pmzY_QiFMwV+RWtmtjiQ@mail.gmail.com>
 <201409252126.38945.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201409252126.38945.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sunil Kovvuri <sunil.kovvuri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Sunil Goutham <sgoutham-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 25, 2014 at 1:26 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 25 September 2014, Bjorn Helgaas wrote:
>> On Thu, Sep 25, 2014 at 1:31 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> > On Thursday 25 September 2014 00:37:00 Sunil Kovvuri wrote:
>> >> On Thu, Sep 25, 2014 at 12:04 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> >> > On Wednesday 24 September 2014 23:34:04 Sunil Kovvuri wrote:
>>
>> >> >> All on-board PCI devices connected to this PCI controller have fixed resources
>> >> >> and doesn't have to be allocated/reassigned. Some of these devices are
>> >> >> SRIOV based.
>> >> >
>> >> > I think you need to mark the ones that are nonrelocatable with flag
>> >> > 0x80000000, otherwise the PCI core might decide to reassign them.
>> >>
>> >> Is this flag part of DT pci node properties ?
>> >> I am using IORESOURCE_PCI_FIXED flag. Its there in other patches of
>> >> the same series.
>> >
>> > Ah, right. I checked the source code again and it seems that we don't handle
>> > this right at the moment. I think a range that has the nonrelocatable
>> > flag set should be used for IORESOURCE_PCI_FIXED mappings without any
>> > host specific code, but that needs to be implemented in common code.
>>
>> What connection do you envision between nonrelocatable ranges and
>> IORESOURCE_PCI_FIXED?  I don't know what a nonrelocatable range is,
>> but for IORESOURCE_PCI_FIXED, all I intend is that the PCI core should
>> not try to assign a different address, e.g., because the BAR is
>> read-only or because it's a legacy IDE/VGA/etc. range for which there
>> is no BAR at all.
>
> I think that is exactly the definition of the nonrelocatable flag
> in http://www.openfirmware.org/1275/bindings/pci/pci2_1.pdf
>
> The example given in section 11.1.2 is for a VGA device that has some
> relocatable BARs and some nonrelocatable BARs.

OK.  You said "a range that has the nonrelocatable flag set should be
used for IORESOURCE_PCI_FIXED mappings."  I thought you meant that the
range was a bridge window, and somehow PCI_FIXED BARs should be put in
that window.

But maybe you meant that nonrelocatable ranges should have the
IORESOURCE_PCI_FIXED bit set in their struct resources.  That would
mean we couldn't move the window, but we could put relocatable BARs
inside the window.

What needs to be implemented?  Just the code that would set
IORESOURCE_PCI_FIXED for nonrelocatable ranges?

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
