From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2] hwmon: xgene: access mailbox as RAM
Date: Fri, 9 Sep 2016 14:56:53 -0700
Message-ID: <20160909215653.GA2362@roeck-us.net>
References: <1469134557-26869-1-git-send-email-hotran@apm.com>
 <CAFHUOYzm4VH1fc3D0fLVv3bCU=2SHx7tZM4nFnCvWeuY+QfEFw@mail.gmail.com>
 <2852054.37zytD0HIa@wuerfel>
 <3475893.910N1IvcYZ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3475893.910N1IvcYZ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Hoan Tran <hotran-qTEPVZfXA3Y@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 09, 2016 at 10:10:45PM +0200, Arnd Bergmann wrote:
> The newly added hwmon driver fails to build in an allmodconfig
> kernel:
> 
>       ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!
> 
> According to comments in the code, the mailbox is a shared memory region,
> not a set of MMIO registers, so we should use memremap() for mapping it
> instead of ioremap or acpi_os_ioremap, and pointer dereferences instead
> of readl/writel.
> 
> The driver already uses plain kernel pointers, so it's a bit unusual
> to work with functions that operate on __iomem pointers, and this
> fixes that part too.
> 
> I'm using READ_ONCE/WRITE_ONCE here to keep the existing behavior
> regarding the ordering of the accesses from the CPU, but note that
> there are no barriers (also unchanged from before).
> 
> I'm also keeping the endianess behavior, though I'm unsure whether
> the message data was supposed to be in LE32 format in the first
> place, it's possible this was meant to be interpreted as a byte
> stream instead.
> 
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Applied after 's/endianess/endianness/' to make checkpatch happy.

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
