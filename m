From: Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/6] UIO driver for APM X-Gene QMTM
Date: Thu, 9 Oct 2014 14:14:33 +0530
Message-ID: <CAPTm99V-xyXa7WQG2jzDz19gotJ0aQRPk_rb5ukvUpdFyFabfw@mail.gmail.com>
References: <1412051169-9142-1-git-send-email-ankit.jindal@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412051169-9142-1-git-send-email-ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tushar Jagad <tushar.jagad-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Any comments on this patch set.

Thanks,
Ankit

On 30 September 2014 09:56, Ankit Jindal <ankit.jindal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patchset enables user space access to APM X-Gene QMTM
> using UIO framework.
>
> The patchset also introduces new type UIO_MEM_PHYS_CACHE
> for mem regions because APM X-Gene QMTM device supports
> cache coherency with CPU caches.
>
> Changes since v1:
>  - Factor-out formating related change in uio/uio.c as separate patch.
>  - Use devm_xxx() APIs where appilicable.
>  - Some cleanups and buggy loop fixed in qmtm_reset().
>  - Removed open and release functions.
>  - Use phandle for specifying QMTM qpool resource.
>  - Removed "uio" from the compatible string.
>  - Added more information about QMTM in binding documentation.
>
> Ankit Jindal (6):
>   uio: code style cleanup
>   uio: Add new UIO_MEM_PHYS_CACHE type for mem regions
>   Documentation: Update documentation for UIO_MEM_PHYS_CACHE
>   drivers: uio: Add X-Gene QMTM UIO driver
>   Documentation: dt-bindings: Add binding info for X-Gene QMTM UIO
>     driver
>   MAINTAINERS: Add entry for APM X-Gene QMTM UIO driver
>
>  Documentation/DocBook/uio-howto.tmpl               |    5 +-
>  .../devicetree/bindings/uio/uio_xgene_qmtm.txt     |   53 ++++
>  MAINTAINERS                                        |    7 +
>  drivers/uio/Kconfig                                |    8 +
>  drivers/uio/Makefile                               |    1 +
>  drivers/uio/uio.c                                  |   23 +-
>  drivers/uio/uio_xgene_qmtm.c                       |  278 ++++++++++++++++++++
>  include/linux/uio_driver.h                         |    1 +
>  8 files changed, 365 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/uio/uio_xgene_qmtm.txt
>  create mode 100644 drivers/uio/uio_xgene_qmtm.c
>
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
