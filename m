From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] iio: accel: Add 3 new drivers
Date: Sat,  8 Oct 2016 14:34:22 +0200
Message-ID: <20161008123426.8991-1-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jonathan, et al.,

Here is 1. a patch to add some missing compatibles to
i2c/trivial-devices.txt, 2. Version 3 of 2 new accelerometer drivers
which I've submitted before, addressing all the review comments and;
3. a new driver for MiraMEMS DA280 / DA226 accelerometers (*).

I'm sending this as a patch-set since there is a potential for conflicts
if these are not applied in the right order.

Regards,

Hans

*) I've bought 2 second hand Allwinner A33 tablets and both ended up having
a DA280 and I borrowed another A33 tablet from a friend which turned out to
have a DA226, this driver has been tested on all 3 devices.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
