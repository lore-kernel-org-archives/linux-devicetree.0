From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v1] Mediatek SCPSYS power domain support
Date: Tue, 10 Mar 2015 16:40:59 +0100
Message-ID: <1426002063-25713-1-git-send-email-s.hauer@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for the MediaTek SCPSYS unit.

The SCPSYS unit handles several power management related tasks such
as thermal measurement, DVFS, interrupt filter and low level sleep
control.

The initial support only contains the generic power domain handling.
This is needed to turn on power to the different power domains.

The driver is quite straight forward now. Due to the lack of a better
place I have put it to drivers/soc/mediatek. As the SCPSYS unit has
several other tasks that also do not fit into some specific subsystem
this probably is a good place for this driver.

Please review, any input welcome.

Sascha

changes since RFC:

- add a commit log to driver patch
- drop manipulating infracfg registers for now, can be added (properly)
  later
- Add warning messages when errors occur
- add NULL pointer check for kmalloc
- Enable all power domains when PM is disabled to allow consumers to work

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
