From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: [PATCH v7 0/6] Add board support for TS-4800
Date: Mon, 30 Nov 2015 10:59:45 -0500
Message-ID: <1448899191-13891-1-git-send-email-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Damien Riegel <damien.riegel@savoirfairelinux.com>, Shawn Guo <shawnguo@kernel.org>, Wim Van Sebroeck <wim@iguana.be>, Rob Herring <robh+dt@kernel.org>, kernel@savoirfairelinux.com, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

This patch serie adds support for TS-4800 board. This board,                                                                              
manufactured by Technologic Systems, is based on an IMX515.

The first stage bootloader, called TS-BOOTROM, enables the watchdog,
so a watchdog driver is required to prevent board from rebooting.

The current device tree is minimal but it allows to get a shell on the
board.

Changes in v7:
 - syscon: change bus-width DT property to reg-io-width
 - watchdog: add dependency on HAS_IOMEM (spotted by a 0-day build) 

Changes in v6:
 - vendor prefix: reorder to sort alphabetically (wrong order since v3)
 - split commit adding device tree into two patches: one for the doc, one for
   the bindings

Changes in v5:
 - watchdog: changed iteration stop condition in set_timeout to be less
   error prone

Changes in v4:
 - syscon: rewrite DT property reading to be clearer
 - watchdog: made fixes suggested by Guenter (now uses
   watchdog_init_timeout, u32 instead of u16, fixed error checking in
   probe, cleaned set_timeout)

Changes in v3:
 - Rebased on v4.3
 - Changed vendor prefix from "ts" to "technologic"
 - Added a DT option to generic syscon driver to allow regmap configuration
 - Dropped custom mfd driver, use generic syscon driver instead.

Changes in v2:
 - Added a mfd driver to handle syscon registers
 - The watchdog driver now uses the regmap (created by the mfd driver)
   to access the feed register
 - Remove watchdog's dependency on SOC_IMX51

Damien Riegel (6):
  of: add vendor prefix for Technologic Systems
  mfd: syscon: add a DT property to set value width
  watchdog: ts4800: add driver for TS-4800 watchdog
  ARM: imx_v6_v7_defconfig: add TS-4800 watchdog
  of: documentation: add bindings documentation for TS-4800
  ARM: dts: TS-4800: add basic device tree

 .../devicetree/bindings/arm/technologic.txt        |   6 +
 Documentation/devicetree/bindings/mfd/syscon.txt   |   4 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 .../devicetree/bindings/watchdog/ts4800-wdt.txt    |  25 +++
 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/imx51-ts4800.dts                 | 190 ++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig               |   1 +
 drivers/mfd/syscon.c                               |  13 ++
 drivers/watchdog/Kconfig                           |  10 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/ts4800_wdt.c                      | 215 +++++++++++++++++++++
 11 files changed, 468 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/technologic.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
 create mode 100644 arch/arm/boot/dts/imx51-ts4800.dts
 create mode 100644 drivers/watchdog/ts4800_wdt.c

-- 
2.5.0
