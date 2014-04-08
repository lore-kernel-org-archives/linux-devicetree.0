From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 4/6] pci: Introduce a domain number for pci_host_bridge.
Date: Tue, 8 Apr 2014 10:28:39 -0600
Message-ID: <CAErSpo4anYBmaRbJEFE9kAXSmnvfqud=w1QA=mSSsTUamM4kSw@mail.gmail.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811272-1547-5-git-send-email-Liviu.Dudau@arm.com> <20140405000007.GD15806@google.com>
 <20140407084623.GG17163@e106497-lin.cambridge.arm.com> <1396862058.3671.40.camel@pasglop>
 <20140407100715.GI17163@e106497-lin.cambridge.arm.com> <CAErSpo7h+Yew2hBztzkOzcHU5r4OQebxFbcZGkNUwJwfTFsbfg@mail.gmail.com>
 <20140408102043.GV17163@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140408102043.GV17163-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 8, 2014 at 4:20 AM, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> On Mon, Apr 07, 2014 at 11:44:51PM +0100, Bjorn Helgaas wrote:

>> Let me try to explain my concern about the
>> pci_create_root_bus_in_domain() interface.  We currently have these
>> interfaces:
>>
>>   pci_scan_root_bus()
>>   pci_scan_bus()
>>   pci_scan_bus_parented()
>>   pci_create_root_bus()
>> ...

>> One alternative is to add an _in_domain() variant of each of these
>> interfaces, but that doesn't seem very convenient either.  My idea of
>> passing in a structure would also require adding variants, so there's
>> not really an advantage there, but I am thinking of the next
>> unification effort, e.g., for NUMA node info.  I don't really want to
>> have to change all the _in_domain() interfaces to also take yet
>> another parameter for the node number.
>
> OK, what about this: all the functions that you have mentioned take a
> void *sysdata parameter. Should we convert this opaque pointer into a
> specific structure that holds the domain_nr and (in future) the NUMA
> node info?

I doubt if we can make sysdata itself generic because I suspect we
need a way to have *some* arch-specific data.  But maybe the arch
could supply a structure containing a struct device *, domain, struct
pci_ops *, list of resources, aperture info, etc.  I wonder if struct
pci_host_bridge would be a reasonable place to put this stuff, e.g.,
something like this:

  struct pci_host_bridge {
    int domain;
    int node;
    struct device *dev;
    struct pci_ops *ops;
    struct list_head resources;
    void *sysdata;
    struct pci_bus *bus;  /* filled in by core, not by arch */
    ... /* other existing contents managed by core */
  };

  struct pci_bus *pci_scan_host_bridge(struct pci_host_bridge *bridge);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
