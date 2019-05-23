From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v5 0/4] Allwinner H6 watchdog support
Date: Thu, 23 May 2019 17:10:46 +0200
Message-ID: <20190523151050.27302-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

Allwinner H6 SoC has two watchdogs.

As we are not sure that both A64 and H6 are stricly identical, I have
introduced the H6 bindings.

After investigation it seems that on some boards the first watchdog doesn't
make it properly reboot. Please see details in the commit log.

I think it's proper to add it with a comment anyway.

The r_watchdog is still available and usable on all the H6 boards.

Thanks,
Clément

Changes since v4:
 - Delete specific bindings for r-wdt

Changes since v3:
 - Remove A64 compatible
 - Introduce specific bindings for r-wdt

Changes since v2:
 - Reintroduce H6 bindings
 - Add watchdog Maintainters / ML
 - Add Martin Ayotte test results

Changes since v1:
 - Use A64 compatible instead of H6
 - Remove dt-bindings patch
 - Change watchdog status to disabled
 - Add r_watchdog node patch
 - Add enable sunxi watchdog patch

Clément Péron (4):
  dt-bindings: watchdog: add Allwinner H6 watchdog
  arm64: dts: allwinner: h6: add watchdog node
  arm64: dts: allwinner: h6: add r_watchog node
  arm64: defconfig: enable sunxi watchdog

 .../devicetree/bindings/watchdog/sunxi-wdt.txt   |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi     | 16 ++++++++++++++++
 arch/arm64/configs/defconfig                     |  1 +
 3 files changed, 18 insertions(+)

-- 
2.20.1
