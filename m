From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v2 0/3] hwmon: Add reset support to aspeed-pwm-tach
Date: Thu,  2 Nov 2017 14:53:46 +1100
Message-ID: <20171102035349.1902-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Gunter,

This adds reset controller support to the ASPEED pwm/tach driver. The reset
controller and clock driver is currently under review, so to test those patches
must be merged in to fully test these changes[1].

To address your concerns from v1:

This driver was not usable as-is upstream. I believe the developer(s) tested and
deployed it in the OpenBMC kernel tree which has some hacks in mach-aspeed to
release all of the resets. The other way they could have tested it is by
booting an OpenBMC kernel, which releases the resets, and then testing the
upstream kernel without performing a power cycle as the resets are not
reasserted on reboot.

I realise it is not ideal to be changing already merged bindings. I don't plan
on it becoming a habit.

There is no BIOS or other ROM that runs before Linux on a BMC to release
the resets. We do have u-boot, but that does not modify the pwm reset.

I haven't added a Kconfig dependency on the RESET_CONTROLLER as the driver can
build without it, and when the ASPEED clk/reset driver is merged, the platform
will always have that option selected.

I've given this version a day of testing on hardware I have access to.

[1] https://lwn.net/Articles/737697/

Joel Stanley (3):
  hwmon: (aspeed-pwm-tacho) Sort headers
  hwmon: (aspeed-pwm-tacho) Deassert reset in probe
  dt-bindings: hwmon: aspeed-pwm-tacho: Add reset node

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 14 ++++-------
 drivers/hwmon/aspeed-pwm-tacho.c                   | 27 +++++++++++++++++++---
 2 files changed, 29 insertions(+), 12 deletions(-)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
