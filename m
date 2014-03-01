From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv4 0/7] Convert twl4030-madc to IIO API and add DT support
Date: Sat, 01 Mar 2014 11:52:52 +0000
Message-ID: <5311CA14.6080009@kernel.org>
References: <1393374270-20079-1-git-send-email-sre@debian.org> <1393444990-28140-1-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393444990-28140-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/02/14 20:03, Sebastian Reichel wrote:
> Hi,
>
> This is RFCv4 for converting twl4030-madc to the IIO API and
> adding DT support. The patchset compiles and has been tested
> on my Nokia N900.
>
> Changes since RFCv3 [0]:
>   * Added Acked-by from Lee Jones (MFD subsystem maintainer)
>     to twl_i2c_read/write_u16 patches
>   * Fixed style issues found by Lee Jones
>     This readded the temp variable Jonathan Cameron wanted to
>     be removed, but makes the code cleaner - especially once
>     the brackets for math for clarity are added.
>   * Tested with converted rx51-battery driver on Nokia N900,
>     which can be found at [1].
>
> [0] https://lkml.org/lkml/2014/2/25/627
> [1] https://lkml.org/lkml/2014/2/25/639

Hi All,

Obviously there are a few outstanding bits and pieces to be addressed.

To get this lined up for a merge...

Lee, do you want to take this through mfd or shall I take it through
IIO?  I don't mind either way.  It stands pretty separate in IIO so
shouldn't cause any merge issues beyond minor fuzz.

Jonathan
>
> -- Sebastian
>
> Sebastian Reichel (7):
>    mfd: twl4030-madc: Use managed resources
>    mfd: twl4030-madc: Add DT support and convert to IIO framework
>    mfd: twl4030-madc: Cleanup driver
>    mfd: twl-core: Add twl_i2c_read/write_u16
>    mfd: twl4030-madc: Use twl_i2c_read/write_u16 for 16 bit registers
>    Documentation: DT: Document twl4030-madc binding
>    mfd: twl4030-madc: Move driver to drivers/iio/adc
>
>   .../devicetree/bindings/iio/adc/twl4030-madc.txt   |  24 ++
>   drivers/iio/adc/Kconfig                            |  10 +
>   drivers/iio/adc/Makefile                           |   1 +
>   drivers/{mfd => iio/adc}/twl4030-madc.c            | 281 +++++++++++++--------
>   drivers/mfd/Kconfig                                |  10 -
>   drivers/mfd/Makefile                               |   1 -
>   include/linux/i2c/twl.h                            |  12 +
>   include/linux/i2c/twl4030-madc.h                   |   2 +-
>   8 files changed, 227 insertions(+), 114 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/iio/adc/twl4030-madc.txt
>   rename drivers/{mfd => iio/adc}/twl4030-madc.c (77%)
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
