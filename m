From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] reset driver for NXP LPC18xx family
Date: Tue,  5 May 2015 00:52:34 +0200
Message-ID: <1430779956-12490-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel.dalessandro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set adds a reset driver for NXP LPC18xx/43xx devices.

Changes in v2:
* clean up header includes
* prefix M0 reset defines with LPC43XX
* fix comment about M0 reset lines
* reorganize reset call chains
* add reset number table to dt doc

There are no dependencies in this patch set. The DTS changes will
be sent separately to arm-soc once this patch set goes upstream.

Base support for the NXP LPC18xx family can be found here:
http://marc.info/?l=linux-arm-kernel&m=143016894704253&w=2

Joachim Eastwood (2):
  reset: add driver for lpc18xx rgu
  doc: dt: add documentation for lpc1850-rgu reset driver

 .../devicetree/bindings/reset/nxp,lpc1850-rgu.txt  |  84 +++++++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-lpc18xx.c                      | 258 +++++++++++++++++++++
 3 files changed, 343 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt
 create mode 100644 drivers/reset/reset-lpc18xx.c

-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
