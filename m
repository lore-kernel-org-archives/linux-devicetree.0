From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/7] iio: adc: hi8435: Add Holt HI-8435 threshold
 detector
Date: Sat, 8 Aug 2015 18:28:22 +0100
Message-ID: <55C63C36.3050605@kernel.org>
References: <1438174469-19054-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438174469-19054-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 29/07/15 13:54, Vladimir Barinov wrote:
> Hello,
> 
> This adds the folowing:
> - Holt threshold detector driver for HI-8435 chip
> - Add Holt vendor prefix
> - Document HI-8435 DT bindings
> - Add periodic polling functionality to SYSFS trigger
> - Support triggered events
> - Add ABI documentation for debounce_time
> - Fix typos in sysfs-bus-iio file
> 
> PDF file can be found here:
> http://www.holtic.com/products/3081-hi-8435.aspx
> 
> Vladimir Barinov (7):
> [1/7] iio: adc: hi8435: Holt HI-8435 threshold detector
> [2/7] dt: Add vendor prefix 'holt'
> [3/7] dt: Document Holt HI-8435 bindings
> [4/7] iio: trigger: Add periodic polling to SYSFS trigger
> [5/7] iio: Support triggered events
> [6/7] iio: Add ABI documentation for debounce_time
> [7/7] iio: Fix typos in ABI documentation
Please order your patch set so that it may be bisected.
That is, if we apply each patch in the order presented, there
should never be a point at which we cannot build the code.

The driver in patch 1 uses elements from later in the series.

Jonathan
> 
> ---
> This patchset is against the 'kernel/git/torvalds/linux.git' repo.
> 
>  Documentation/ABI/testing/sysfs-bus-iio               |   16 
>  Documentation/ABI/testing/sysfs-bus-iio-adc-hi8435    |   61 +
>  Documentation/ABI/testing/sysfs-bus-iio-trigger-sysfs |   11 
>  Documentation/devicetree/bindings/iio/adc/hi8435.txt  |   25 
>  Documentation/devicetree/bindings/vendor-prefixes.txt |    1 
>  drivers/iio/Kconfig                                   |    6 
>  drivers/iio/Makefile                                  |    1 
>  drivers/iio/adc/Kconfig                               |   11 
>  drivers/iio/adc/Makefile                              |    1 
>  drivers/iio/adc/hi8435.c                              |  659 ++++++++++++++++++
>  drivers/iio/industrialio-core.c                       |    4 
>  drivers/iio/industrialio-trigger.c                    |   12 
>  drivers/iio/industrialio-triggered-event.c            |   68 +
>  drivers/iio/trigger/iio-trig-sysfs.c                  |   58 +
>  include/linux/iio/iio.h                               |    1 
>  include/linux/iio/triggered_event.h                   |   11 
>  16 files changed, 939 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-hi8435
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/hi8435.txt
>  create mode 100644 drivers/iio/adc/hi8435.c
>  create mode 100644 drivers/iio/industrialio-triggered-event.c
>  create mode 100644 include/linux/iio/triggered_event.h
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
