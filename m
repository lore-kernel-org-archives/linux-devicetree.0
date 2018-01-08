From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [GIT PULL] Immutable branch between MFD, TTY and Watchdog due for
 the v4.16 merge window
Date: Mon, 8 Jan 2018 11:09:18 +0000
Message-ID: <20180108110918.nj4pzjbcoyhodkrc@dell>
References: <20171221065118.29726-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171221065118.29726-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enjoy!

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-tty-watchdog-v4.16

for you to fetch changes up to a8b751eb709ecefe0a81a0112d9c01b2181a3efa:

  dt-bindings: watchdog: Add bindings for RAVE SP watchdog driver (2018-01-08 10:08:37 +0000)

----------------------------------------------------------------
Immutable branch between MFD, TTY and Watchdog due for the v4.16 merge window

----------------------------------------------------------------
Andrew Morton (1):
      lib/crc-ccitt: Add CCITT-FALSE CRC16 variant

Andrey Smirnov (5):
      serdev: Make .remove in struct serdev_device_driver optional
      serdev: Introduce devm_serdev_device_open()
      mfd: Add driver for RAVE Supervisory Processor
      watchdog: Add RAVE SP watchdog driver
      dt-bindings: watchdog: Add bindings for RAVE SP watchdog driver

 .../bindings/watchdog/zii,rave-sp-wdt.txt          |  39 ++
 Documentation/driver-model/devres.txt              |   3 +
 drivers/mfd/Kconfig                                |   8 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/rave-sp.c                              | 710 +++++++++++++++++++++
 drivers/tty/serdev/core.c                          |  31 +-
 drivers/watchdog/Kconfig                           |   7 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/rave-sp-wdt.c                     | 337 ++++++++++
 include/linux/crc-ccitt.h                          |   7 +
 include/linux/mfd/rave-sp.h                        |  60 ++
 include/linux/serdev.h                             |   1 +
 lib/crc-ccitt.c                                    |  58 +-
 13 files changed, 1261 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt
 create mode 100644 drivers/mfd/rave-sp.c
 create mode 100644 drivers/watchdog/rave-sp-wdt.c
 create mode 100644 include/linux/mfd/rave-sp.h

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
