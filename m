From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree fixes for 4.2
Date: Tue, 28 Jul 2015 10:54:58 -0500
Message-ID: <CAL_JsqL3dYgw6xu3zSQ4rb9JTGT0u5sU=UkTC-ZhfzDPp3W-Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull this small set of DT fixes for 4.2.

Rob

The following changes since commit cbfe8fa6cd672011c755c3cd85c9ffd4e2d10a6f:

  Linux 4.2-rc4 (2015-07-26 12:26:21 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-fixes-for-4.2

for you to fetch changes up to 599ad5ac9a59587a46f6540a8e2ab79dff811f7d:

  of: Drop owner assignment from platform and i2c driver (2015-07-27
08:24:39 -0500)

----------------------------------------------------------------
A handful of DT related fixes for 4.2-rc.

----------------------------------------------------------------
Alban Bedel (1):
      DEVICETREE: Misc fix for the AR7100 SPI controller binding

Krzysztof Kozlowski (1):
      of: Drop owner assignment from platform and i2c driver

Rob Herring (1):
      of: add HAS_IOMEM depends to OF_ADDRESS

Tomeu Vizoso (1):
      of: constify drv arg of of_driver_match_device stub

 Documentation/devicetree/bindings/spi/spi-ath79.txt | 6 +++---
 drivers/of/Kconfig                                  | 2 +-
 drivers/of/unittest.c                               | 3 ---
 include/linux/of_device.h                           | 2 +-
 4 files changed, 5 insertions(+), 8 deletions(-)
