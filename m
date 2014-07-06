From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 0/9] Support for creating generic PCI host bridges from DT
Date: Sun, 6 Jul 2014 10:23:43 -0500
Message-ID: <CAL_JsqK_CfagmiFOpOXVYGry22nGnCZL0ZXeJhYxb9zp=P2fsQ@mail.gmail.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404240214-9804-1-git-send-email-Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Suravee Suthikulanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Device Tree ML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 1, 2014 at 1:43 PM, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> This is my resurected attempt at adding support for generic PCI host
> bridge controllers that make use of device tree information to
> configure themselves. I've tagged it as v8 although the patches
> have now been reshuffled in order to ease adoption so referring to
> the older versions might be a bit of a hoop jumping exercise.
>
> Changes from v7:
>   - Reordered the patches so that fixes and non-controversial patches
>     from v7 can be accepted more easily. If agreed I can split the
>     series again into patches that can be upstreamed easily and ones
>     that still need discussion.
>   - Moved the of_create_host_bridge() function to drivers/of/of_pci.c
>     to better reflect its target use.
>   - Added the function to remap the bus I/O resources that used to be
>     provided in my arm64 patch series and (re)named it pci_remap_iospace()
>   - Removed error code checking from parsing and mapping of IRQ from DT
>     in recognition that some PCI devices will not have legacy IRQ mappings.
>
> v7 thread here with all the historic information: https://lkml.org/lkml/2014/3/14/279

Can you publish a branch for this series please.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
