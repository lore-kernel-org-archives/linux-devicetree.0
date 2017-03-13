From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/4] Altera Partial Reconfiguration IP
Date: Mon, 13 Mar 2017 13:46:20 -0700
Message-ID: <CAAtXAHdDEAQ=NrpN19akacUhdM6MYbw7CbLsZJPU+vsA74_N5Q@mail.gmail.com>
References: <1489174827-6033-1-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489174827-6033-1-git-send-email-matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Matthew,

On Fri, Mar 10, 2017 at 11:40 AM,  <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>
> This set of patches implements a fpga-mgr driver for the Altera Partial
> Reconfiguration IP.  The driver depends on a patch from Alan Tull that
> adds a config complete timeout.  The driver code itself is divided into
> core functions and functions to implement a platform driver. It is
> expected that drivers for other buses like PCIe would also use the core
> functions or possibly instantiate a platform driver.
>
> Alan Tull (1):
>   fpga: add config complete timeout
>
> Matthew Gerlach (3):
>   fpga pr ip: Core driver support for Altera Partial Reconfiguration IP.
>   fpga dt: bindings for Altera Partial Reconfiguration IP.

I think in general dt bindings should go in first in a series. Doesn't
checkpatch
complain about this?

>   fpga pr ip: Platform driver for Altera Partial Reconfiguration IP.
>
>  .../devicetree/bindings/fpga/altera-pr-ip.txt      |  12 ++
>  drivers/fpga/Kconfig                               |  12 ++
>  drivers/fpga/Makefile                              |   2 +
>  drivers/fpga/altera-pr-ip-core-plat.c              |  65 ++++++
>  drivers/fpga/altera-pr-ip-core.c                   | 217 +++++++++++++++++++++
>  drivers/fpga/altera-pr-ip-core.h                   |  29 +++
>  drivers/fpga/fpga-region.c                         |   3 +
>  include/linux/fpga/fpga-mgr.h                      |   3 +
>  8 files changed, 343 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
>  create mode 100644 drivers/fpga/altera-pr-ip-core-plat.c
>  create mode 100644 drivers/fpga/altera-pr-ip-core.c
>  create mode 100644 drivers/fpga/altera-pr-ip-core.h

Cheers,
Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
