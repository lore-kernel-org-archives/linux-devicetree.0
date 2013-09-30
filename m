From: Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 0/2] iio: cm36651: Add CM36651 proximity/light sensor
Date: Mon, 30 Sep 2013 21:12:17 +0900
Message-ID: <52496AA1.3010503@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org" <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Peter Meerwald l <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello all,

Thank you for your review. I have revised v3 driver.
Please give your feedback at that time.

This patch is the fourth revision for Capella CM36651 proximity and RGB light sensor driver.
The driver exposes five channels: Red, Green, Blue, Clear and proximity.
It also support detection proximity event.

This driver supports
	- Event: rising and falling proximity events.
	- Reading channel through read_raw callback.
	- writing sensor data integration time each channel through write_raw callback.

v4 changed below:
	- Revised a binding documentation
	- add description to cm36651.txt
	- revise proximity sensor duty_ratio Macros.
	- fix be wrote register value.
	- fix return value at cm36651_read_raw function.
	- remove double space and blank line.
	- remove some APIs.(IIO_EVENT_EXTRACT_*)
	- remove some check code and unnecessary dbg/err message.
	- code cleanup

Subject: [PATCH 0/2] *** SUBJECT HERE ***

*** BLURB HERE ***

Beomho Seo (2):
  iio: cm36651: Add CM36651 proximity/light sensor driver
  DT: Add documentation for cm36651 proximity/light sensor

 .../devicetree/bindings/iio/light/cm36651.txt      |   26 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 drivers/iio/light/Kconfig                          |   11 +
 drivers/iio/light/cm36651.c                        |  704 ++++++++++++++++++++
 4 files changed, 742 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/cm36651.txt
 create mode 100644 drivers/iio/light/cm36651.c

-- 
1.7.9.5

-- 
Best Regards,

Beomho Seo, Assistant Engineer
System S/W Lab., S/W Platform Team, Software Center
Samsung Electronics
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
