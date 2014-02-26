From: Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFCv3 0/7] Convert twl4030-madc to IIO API and add DT support
Date: Wed, 26 Feb 2014 12:42:55 +0100
Message-ID: <CAAfyv35C_a+OA1WAMVYwJquM7YEJy3Fdu+TgkNU9R30xhX6D3w@mail.gmail.com>
References: <1393193271-16717-1-git-send-email-sre@debian.org>
	<1393374270-20079-1-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393374270-20079-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Dr. H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

On Wed, Feb 26, 2014 at 1:24 AM, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> Hi,
>
> This is RFCv3 for converting twl4030-madc to the IIO API and
> adding DT support. The patchset compiles and has been tested
> on my Nokia N900.
>
> Changes since RFCv2:
>  * Use "--find-renames" for the move from mfd/ to iio/adc/ ;)
>  * Added Acked-by from Lee Jones (MFD subsystem maintainer)
>  * Fixed issue found by Joe Perches
>   - twl4030_madc_request.do_avg should be bool instead of u16
>  * Fixed issues found by Peter Meerwald
>   - some style issues (e.g. /** instead of /*)
>   - typos
>   - usage of u16 read/write
>  * Tested with converted rx51-battery driver on Nokia N900
>
> TODO:
>  * Remove twl4030-madc-hwmon in favour of iio-hwmon
>    This driver is currently only used by board-omap3beagle.c
>    and board-rx51-peripherals.c. The instanciation in the
>    rx51 boardcode is a bug, since actually only twl4030-madc
>    is needed. Thus board-omap3beagle.c needs to be updated to
>    iio-hwmon and board-rx51-peripherals.c to twl4030-madc.
>    Both tasks are pretty trivial and twl4030-madc-hwmon can
>    be removed afterwards :)
>  * Update twl4030-madc-battery to the IIO API. I guess Marek
>    will do this update in the near future, since he is currently
>    writing DT bindings for the driver.
Yes I'm working on DT for twl4030-madc-battery. I'll convert it also to IIO
and post for comments. Thanks for doing that it's really nice work!
>  * I updated twl4030-madc-battery already and will send it
>    in a separate patchset.
>  * Once all of the above steps happened the old API can be
>    removed from the driver, which allows some more cleanups.
>
> -- Sebastian
>
> Sebastian Reichel (7):
>   mfd: twl4030-madc: Use managed resources
>   mfd: twl4030-madc: Add DT support and convert to IIO framework
>   mfd: twl4030-madc: Cleanup driver
>   mfd: twl-core: Add twl_i2c_read/write_u16
>   mfd: twl4030-madc: Use twl_i2c_read/write_u16 for 16 bit registers
>   Documentation: DT: Document twl4030-madc binding
>   mfd: twl4030-madc: Move driver to drivers/iio/adc
>
>  .../devicetree/bindings/iio/adc/twl4030-madc.txt   |  24 ++
>  drivers/iio/adc/Kconfig                            |  10 +
>  drivers/iio/adc/Makefile                           |   1 +
>  drivers/{mfd => iio/adc}/twl4030-madc.c            | 278 +++++++++++++--------
>  drivers/mfd/Kconfig                                |  10 -
>  drivers/mfd/Makefile                               |   1 -
>  include/linux/i2c/twl.h                            |  12 +
>  include/linux/i2c/twl4030-madc.h                   |   2 +-
>  8 files changed, 224 insertions(+), 114 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/twl4030-madc.txt
>  rename drivers/{mfd => iio/adc}/twl4030-madc.c (77%)
>
> --
> 1.8.5.3
>

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
