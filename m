From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] hwmon: (lm70) Couple patches
Date: Sat, 21 Jan 2017 11:20:08 -0800
Message-ID: <20170121192010.30681-1-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:HARDWARE MONITORING" <linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:DOCUMENTATION" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Guenter,

Here are a couple of patches against lm70. I plan on submitting
support for configurable thresholds on TI TMP122/124 once I have
resolved the lack SPI_3WIRE on the controller that connects to
this chip on my board.

Thanks!

Florian Fainelli (2):
  hwmon: (lm70) Utilize dev_warn instead of pr_warn
  hwmon: (lm70) Add support for TI TMP122/124

 Documentation/devicetree/bindings/hwmon/lm70.txt |  1 +
 Documentation/hwmon/lm70                         |  8 ++++++--
 drivers/hwmon/lm70.c                             | 12 ++++++++++--
 3 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
