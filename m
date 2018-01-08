From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [GIT PULL] Immutable branch between MFD, TTY and Watchdog due
 for the v4.16 merge window
Date: Mon, 8 Jan 2018 11:15:19 +0000
Message-ID: <20180108111519.nyrnlxr3lyqds4ua@dell>
References: <20171221065118.29726-1-andrew.smirnov@gmail.com>
 <20180108110918.nj4pzjbcoyhodkrc@dell>
 <20180108111137.hegxowup7hybyc3i@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180108111137.hegxowup7hybyc3i@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, cphealy@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Philippe Ombredanne <pombredanne@nexb.com>
List-Id: devicetree@vger.kernel.org

On Mon, 08 Jan 2018, Lee Jones wrote:

> On Mon, 08 Jan 2018, Lee Jones wrote:
> 
> > Enjoy!
> > 
> > The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:
> > 
> >   Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-tty-watchdog-v4.16
> > 
> > for you to fetch changes up to a8b751eb709ecefe0a81a0112d9c01b2181a3efa:
> > 
> >   dt-bindings: watchdog: Add bindings for RAVE SP watchdog driver (2018-01-08 10:08:37 +0000)
> > 
> > ----------------------------------------------------------------
> > Immutable branch between MFD, TTY and Watchdog due for the v4.16 merge window
> > 
> > ----------------------------------------------------------------
> > Andrew Morton (1):
> >       lib/crc-ccitt: Add CCITT-FALSE CRC16 variant
> 
> Ah bum!  Looks like my scripts has taken Andrew as the author.
> 
> PLEASE DO NOT PULL THIS REQUEST (YET!)

Okay, it's fixed.  Pull away.

Details (repo, tag, etc) are the same.

---------------------------------------------------------

FYI:

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-tty-watchdog-v4.16

for you to fetch changes up to d1903daa662baf170513da3a9090ac56d3dbfbf6:

  dt-bindings: watchdog: Add bindings for RAVE SP watchdog driver (2018-01-08 11:12:33 +0000)

----------------------------------------------------------------
Immutable branch between MFD and TTY and Watchdog due for the v4.16 merge window

----------------------------------------------------------------
Andrey Smirnov (5):
      serdev: Make .remove in struct serdev_device_driver optional
      serdev: Introduce devm_serdev_device_open()
      mfd: Add driver for RAVE Supervisory Processor
      watchdog: Add RAVE SP watchdog driver
      dt-bindings: watchdog: Add bindings for RAVE SP watchdog driver

Andrey Vostrikov (1):
      lib/crc-ccitt: Add CCITT-FALSE CRC16 variant

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
