From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 0/3] rtc: pcf8563: Fix unhandled interrupt storm
Date: Tue,  4 Jun 2019 12:23:34 +0800
Message-ID: <20190604042337.26129-1-wens@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Vincent Donnefort <vdonnefort@gmail.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

While bringing up my Pine H64, I encountered an interrupt storm from the
pcf8563 RTC. The RTC chip's interrupt line is shared with the PMIC, and
was not properly added to the device tree. Also, the driver was using an
trigger method incompatible with the PMIC, preventing the interrupt line
from being shared. Last, the driver only clears and masks the alarm
interrupt, while leaving the timer interrupt untouched. This is a
problem if previous systems left the timer interrupt enabled, and there
was an interrupt pending.

This patch set fixes all three issues, one per patch.

Please have a look.

Chen-Yu Tsai (3):
  rtc: pcf8563: Fix interrupt trigger method
  rtc: pcf8563: Clear event flags and disable interrupts before
    requesting irq
  arm64: dts: allwinner: h6: Pine H64: Add interrupt line for RTC

 .../arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts |  2 ++
 drivers/rtc/rtc-pcf8563.c                           | 13 ++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.20.1
