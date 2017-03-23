From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD and GPIO due for the v4.12
 merge window
Date: Thu, 23 Mar 2017 11:48:43 +0000
Message-ID: <20170323114843.q7zcakeajjnhqr4l@dell>
References: <1489745120-2918-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489745120-2918-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Enjoy,

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-v4.12

for you to fetch changes up to 9f7c7ceefe5e824e8333859bded12257a6d3548a:

  mfd: wm831x: Add device tree binding document (2017-03-23 11:46:00 +0000)

----------------------------------------------------------------
Immutable branch between MFD and GPIO due for the v4.12 merge window

----------------------------------------------------------------
Charles Keepax (3):
      mfd: wm831x: Add basic device tree binding
      gpio: wm831x: Add basic device tree support
      mfd: wm831x: Add device tree binding document

 Documentation/devicetree/bindings/mfd/wm831x.txt | 81 ++++++++++++++++++++++++
 MAINTAINERS                                      |  1 +
 drivers/gpio/gpio-wm831x.c                       |  5 +-
 drivers/mfd/wm831x-core.c                        | 29 ++++++---
 drivers/mfd/wm831x-i2c.c                         | 19 +++++-
 drivers/mfd/wm831x-irq.c                         |  6 +-
 drivers/mfd/wm831x-spi.c                         | 18 +++++-
 include/linux/mfd/wm831x/core.h                  |  9 ++-
 8 files changed, 152 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/wm831x.txt

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
