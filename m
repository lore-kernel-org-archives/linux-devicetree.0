From: Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/3] Add W83773G hwmon sensor driver and doc
Date: Thu,  9 Nov 2017 15:08:58 +0800
Message-ID: <1510211341-17415-1-git-send-email-mine260309@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Jiri Kosina <trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Nuvoton W83773G is a hardware monitoring chip, which integrates two remote
and one local temperature sensors.
---
v2:
 - The driver is re-written as v1's comment, so the author is changed to me.
 - Added the device to trivial-devices.txt
v3:
 - Update the driver to use new API devm_hwmon_device_register_with_info()

Lei YU (3):
  DT: i2c: W83773G is a trivial device
  drivers: hwmon: Add W83773G driver
  hwmon: (w83773g) Add documentation

 .../devicetree/bindings/trivial-devices.txt        |   1 +
 Documentation/hwmon/w83773g                        |  33 ++
 drivers/hwmon/Kconfig                              |  10 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/w83773g.c                            | 348 +++++++++++++++++++++
 5 files changed, 393 insertions(+)
 create mode 100644 Documentation/hwmon/w83773g
 create mode 100644 drivers/hwmon/w83773g.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
