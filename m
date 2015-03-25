From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch] dt: OF_UNITTEST make dependency broken
Date: Tue, 24 Mar 2015 23:44:23 -0500
Message-ID: <CAL_JsqJB15xGBPv71tVHvS4YiHKS1o5XqUgbwkuz6uodnD=ETA@mail.gmail.com>
References: <550338CA.50003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550338CA.50003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 13, 2015 at 2:21 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>
> If CONFIG_OF_UNITTEST=y then a kernel image make will always cause .version to
> be incremented, even if there are not source changes.  This is caused by
> a lack of dependency tracking and checking for
> drivers/of/unittest-data/testcases.dtb.o.
>
>
> Signed-off-by: Frank Rowand <frank.rowand-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Applied. Thanks.

Rob

>
> ---
>
>
>  drivers/of/Makefile                 |    5 +++--
>  drivers/of/unittest-data/.gitignore |    2 ++
>  drivers/of/unittest-data/Makefile   |    7 +++++++
>  3 files changed, 12 insertions(+), 2 deletions(-)
>
> Index: b/drivers/of/Makefile
> ===================================================================
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -6,8 +6,7 @@ obj-$(CONFIG_OF_PROMTREE) += pdt.o
>  obj-$(CONFIG_OF_ADDRESS)  += address.o
>  obj-$(CONFIG_OF_IRQ)    += irq.o
>  obj-$(CONFIG_OF_NET)   += of_net.o
> -obj-$(CONFIG_OF_UNITTEST) += of_unittest.o
> -of_unittest-objs := unittest.o unittest-data/testcases.dtb.o
> +obj-$(CONFIG_OF_UNITTEST) += unittest.o
>  obj-$(CONFIG_OF_MDIO)  += of_mdio.o
>  obj-$(CONFIG_OF_PCI)   += of_pci.o
>  obj-$(CONFIG_OF_PCI_IRQ)  += of_pci_irq.o
> @@ -16,5 +15,7 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_rese
>  obj-$(CONFIG_OF_RESOLVE)  += resolver.o
>  obj-$(CONFIG_OF_OVERLAY) += overlay.o
>
> +obj-$(CONFIG_OF_UNITTEST) += unittest-data/
> +
>  CFLAGS_fdt.o = -I$(src)/../../scripts/dtc/libfdt
>  CFLAGS_fdt_address.o = -I$(src)/../../scripts/dtc/libfdt
> Index: b/drivers/of/unittest-data/Makefile
> ===================================================================
> --- /dev/null
> +++ b/drivers/of/unittest-data/Makefile
> @@ -0,0 +1,7 @@
> +obj-y += testcases.dtb.o
> +
> +targets += testcases.dtb testcases.dtb.S
> +
> +.SECONDARY: \
> +       $(obj)/testcases.dtb.S \
> +       $(obj)/testcases.dtb
> Index: b/drivers/of/unittest-data/.gitignore
> ===================================================================
> --- /dev/null
> +++ b/drivers/of/unittest-data/.gitignore
> @@ -0,0 +1,2 @@
> +testcases.dtb
> +testcases.dtb.S
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
