From: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] iio: temperature: add mcp98xx driver support
Date: Sat, 18 Jul 2015 20:04:11 -0700
Message-ID: <1437275053-16211-1-git-send-email-mranostay@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This changeset adds driver support for the Microchip mcp98xx series of
temperature sensors.

This includes temperature reading, and rising/falling threshold events.

Matt Ranostay (2):
  iio: temperature: DT binding doc for mcp98xx
  iio: temperature: add support for mcp98xx sensors

 .../bindings/iio/temperature/mcp98xx.txt           |  22 +
 drivers/iio/temperature/Kconfig                    |  10 +
 drivers/iio/temperature/Makefile                   |   1 +
 drivers/iio/temperature/mcp98xx.c                  | 588 +++++++++++++++++++++
 4 files changed, 621 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/mcp98xx.txt
 create mode 100644 drivers/iio/temperature/mcp98xx.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
