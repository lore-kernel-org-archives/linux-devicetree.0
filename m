From: John Muir <john-eXjPKP/gKhgAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] Add Maxim Integrated MAX31760 fan controller driver.
Date: Tue, 11 Apr 2017 14:32:16 -0700
Message-ID: <20170411213218.138718-1-john@jmuir.com>
References: <20170404192034.158901-1-john@jmuir.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170404192034.158901-1-john-eXjPKP/gKhgAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: John Muir <john-eXjPKP/gKhgAvxtiuMwx3w@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Segal <segal-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a device driver for the MAX31760 I2C device with a hwmon interface and
a few open firmware device properties.

v2:
- Fixup device tree binding documentation.
- max32760: Fix OF code and add some comments.

John Muir (2):
  hwmon: Add MAX31760 fan controller driver.
  devicetree: Document the max31760 device binding.

 .../devicetree/bindings/hwmon/max31760.txt         |   72 +
 Documentation/hwmon/max31760                       |   41 +
 drivers/hwmon/Kconfig                              |   10 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/max31760.c                           | 1461 ++++++++++++++++++++
 5 files changed, 1585 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max31760.txt
 create mode 100644 Documentation/hwmon/max31760
 create mode 100644 drivers/hwmon/max31760.c

-- 
2.12.2.715.g7642488e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
