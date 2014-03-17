From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 3/3] arm64: Add architecture support for PCI
Date: Mon, 17 Mar 2014 11:05:38 -0500
Message-ID: <CAL_Jsq+9X-9VahsP79mtHN0RC64vRA_2R3ucjX0LefO6q2YN3Q@mail.gmail.com>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
	<1394811258-1500-4-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394811258-1500-4-git-send-email-Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 14, 2014 at 10:34 AM, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> Use the generic host bridge functions to provide support for
> PCI Express on arm64. There is no support for ISA memory.
>
> Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> Tested-by: Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>
> ---
>  arch/arm64/Kconfig            |  19 +++-
>  arch/arm64/include/asm/Kbuild |   1 +
>  arch/arm64/include/asm/io.h   |   3 +-
>  arch/arm64/include/asm/pci.h  |  51 ++++++++++
>  arch/arm64/kernel/Makefile    |   1 +
>  arch/arm64/kernel/pci.c       | 173 ++++++++++++++++++++++++++++++++
>  6 files changed, 246 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/include/asm/pci.h
>  create mode 100644 arch/arm64/kernel/pci.c

[snip]

> +#endif
> +
> +extern unsigned long pci_ioremap_io(const struct resource *res, phys_addr_t phys_addr);

Can we at least align the function definition across architectures if
not the implementation.


> +int pci_register_io_range(phys_addr_t address, resource_size_t size)
> +{
> +       struct ioresource *res;
> +       resource_size_t allocated_size = 0;
> +
> +       /* find if the range has not been already allocated */
> +       list_for_each_entry(res, &io_list, list) {
> +               if (address >= res->start &&
> +                       address + size <= res->start + size)
> +                       return 0;
> +               allocated_size += res->size;
> +       }
> +
> +       /* range not already registered, check for space */
> +       if (allocated_size + size > IO_SPACE_LIMIT)

I believe this needs to be "allocated_size + size - 1".

> +               return -E2BIG;
> +
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
