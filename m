From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Add support for PL172 memory-controller
Date: Tue, 28 Apr 2015 19:24:37 +0200
Message-ID: <1430241879-30046-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set adds support for setting up static memory devices on
a ARM PrimeCell MultiPort Memory Controller (PL172) from DT. Dynamic
memory (SDRAM) is not supported in this patch set.

DT bindings for PL172 is based on the bindings for the TI AEMIF
memory controller. PL172 can be found on a number of NXP devices
like the LPC18xx family.

Tested on Embedded Artists' LPC4357 Developer's Kit with NOR Flash
(SST39VF320) and 74LCV16374 (gpio-74x164) on MPMC.

Joachim Eastwood (2):
  memory: add ARM PL172 MultiPort Memory Controller driver
  doc: dt: add documentation for pl172 memory bindings

 .../bindings/memory-controllers/arm,pl172.txt      | 125 +++++++++
 drivers/memory/Kconfig                             |   8 +
 drivers/memory/Makefile                            |   1 +
 drivers/memory/pl172.c                             | 302 +++++++++++++++++++++
 4 files changed, 436 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt
 create mode 100644 drivers/memory/pl172.c

-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
