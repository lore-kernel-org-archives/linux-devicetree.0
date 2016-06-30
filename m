From: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/2] iio: adc: max1363: Add device tree support
Date: Thu, 30 Jun 2016 09:43:04 +0200
Message-ID: <1467272586-28761-1-git-send-email-florian.vaussard@heig-vd.ch>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series introduces the necessary device tree binding to
perform DT boot.

Tested with MAX11644 (DT boot).

Best regards,
Florian

---
Since v2:
- Use a macro to declare compatibles, as suggested by Peter Rosin
  for a similar patch on the mcp4531

Since v1:
- First patch applied by Jonathan
- Added DT maintainer's Ack
- Fixed handling of data pointer in struct of_device_id

Florian Vaussard (2):
  iio: adc: max1363: Add device tree binding documentation
  iio: adc: max1363: Add device tree binding

 .../devicetree/bindings/iio/adc/max1363.txt        | 63 ++++++++++++++++++++++
 drivers/iio/adc/max1363.c                          | 61 ++++++++++++++++++++-
 2 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/max1363.txt

-- 
2.5.5
