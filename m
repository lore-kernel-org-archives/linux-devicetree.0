From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 2/3] hwmon: xgene: Add hwmon driver
Date: Thu, 08 Sep 2016 10:14:42 +0200
Message-ID: <2992356.ULGoZEEDZp@wuerfel>
References: <1469134557-26869-1-git-send-email-hotran@apm.com> <13081573.BbD3TmEU5Y@wuerfel> <20160907223705.GA31582@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160907223705.GA31582-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Hoan Tran <hotran-qTEPVZfXA3Y@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>, lho-qTEPVZfXA3Y@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, September 7, 2016 3:37:05 PM CEST Guenter Roeck wrote:
> On Wed, Sep 07, 2016 at 11:41:44PM +0200, Arnd Bergmann wrote:
> > On Thursday, July 21, 2016 1:55:56 PM CEST Hoan Tran wrote:
> > > +               ctx->comm_base_addr = cppc_ss->base_address;
> > > +               if (ctx->comm_base_addr) {
> > > +                       ctx->pcc_comm_addr =
> > > +                                       acpi_os_ioremap(ctx->comm_base_addr,
> > > +                                                       cppc_ss->length);
> > > 
> > 
> > This causes the arm64 allmodconfig build to fail now, according to
> > kernelci:
> > 
> >       1  ERROR: "memblock_is_memory" [drivers/hwmon/xgene-hwmon.ko] undefined!
> > 
> > Should this perhaps call ioremap() or memremap() instead?
> > 
> Hmmm ... almost sounds to me like blaming the messenger. e7cd190385d1 ("arm64:
> mark reserved memblock regions explicitly in iomem") starts using a function
> in acpi_os_ioremap() which is not exported. On top of that, memblock_is_memory()
> is declared as __init_memblock, which makes me really uncomfortable.
> If acpi_os_ioremap() must not be used by modules, and possibly only during
> early (?) initialization, maybe its declaration should state those limitations ?

Ah, I didn't notice that. I guess both patches were correct individually and
got added to linux-next around the same time but caused allmodconfig to blow up
when used together.

Adding everyone who was involved in the memblock patch to Cc here, maybe one
of them has an idea what the correct fix is. There are only two other drivers
using acpi_os_ioremap() and one of them is x86-specific, so it's still likely
that drivers are not actually supposed to use this symbol. Making
acpi_os_ioremap() an exported function in arm64 would also work.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
