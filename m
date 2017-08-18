From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/5]  iio: srf08: add support for similar devices and
 triggered buffers
Date: Fri, 18 Aug 2017 08:19:49 +0100
Message-ID: <20170818081949.419da8a5@archlinux>
References: <20170817220829.GA4687@arbeit>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170817220829.GA4687@arbeit>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org, jelle-oJJ1AqDjjO4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 18 Aug 2017 00:08:29 +0200
Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org> wrote:

For some reason my laptop hadn't picked up this posting until just now.
Too many random wifi hotspots I guess.

Anyhow given the rebase was trivial I'll stick with V3 for everything.
Wolfram can pickup patch 1 whenever he likes.

Jonathan

> This patch series adds support for:
> - triggered buffer
> - ultrasonic devices srf02 and srf10
> 
> Changes in v4:
> - rebase to recent git repository with trivial-devices.txt now under
>   devicetree/bindings
> 
> Changes in v3:
> - introduce struct chip_info for device specific features
> - remove locking error in srf08_trigger_handler()
> 
> Changes in v2:
> - removed unnecessary patch "[PATCH 6/7] iio: srf08: add buffered to device mode"
> - incorporated patch "[PATCH 7/7] iio: srf08: change text in Kconfig" where suitable
> - changed order of patches to improve logical flow of changes
> - improved distinction of sensor types
> 
> Andreas Klinger (5):
>   iio: srf08: add device tree binding for srf02 and srf10
>   iio: srf08: add device tree table
>   iio: srf08: add triggered buffer support
>   iio: srf08: add sensor type srf10
>   iio: srf08: add support for srf02 in i2c mode
> 
>  .../devicetree/bindings/trivial-devices.txt        |   2 +
>  drivers/iio/proximity/Kconfig                      |   8 +-
>  drivers/iio/proximity/srf08.c                      | 227 ++++++++++++++++++---
>  3 files changed, 203 insertions(+), 34 deletions(-)
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
