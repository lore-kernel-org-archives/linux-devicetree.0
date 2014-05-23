From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: [Patch v7 0/7] Introduce keystone reset driver
Date: Fri, 23 May 2014 18:43:25 +0300
Message-ID: <1400859812-5761-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, santosh.shilimkar-l0cyMroinI0@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, w-kwok2-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These patches introduce keystone reset driver.

The keystone SoC can be rebooted in several ways. By external reset
pin, by soft and by watchdogs. This driver allows software reset and reset
by one of the watchdogs. Also added opportunity to set soft/hard reset type.

Based on linux-next/master

v7..v6
  power: reset: keystone-reset: introduce keystone reset driver
  power: reset: add bindings for keystone reset driver
  ARM: dts: keystone: update reset node to work with reset driver
	- s/wdt_list/wdt-list/g

v6..v5
  clock: keystone-pllctrl: add bindings for keystone pll controller
  mfd: ti-keystone-devctrl: add bindings for device state control
  power: reset: add bindings for keystone reset driver
  ARM: dts: keystone: update reset node to work with reset driver
  	- for nodes s/device-state-control/device-state-control@02620000/g
  	- for nodes s/pll-controller/pll-controller@02310000/g
  mfd: ti-keystone-devctrl: add bindings for device state control
  	- corrected description for reg property

v5..v4
  power: reset: keystone-reset: introduce keystone reset driver
  	- changed to get rsmux and rspll offsets from DT
  clock: keystone-pllctrl: add bindings for keystone pll controller
  	- new patch
  mfd: ti-keystone-devctrl: add bindings for device state control
  	- new patch
  power: reset: add bindings for keystone reset driver
  	- corrected description of "ti,syscon-pll", "ti,syscon-dev" properties
	- corrected examples
  ARM: dts: keystone: update reset node to work with reset driver
  	- added nodes for pll-controller and device-state-controll
	- added offsets to "ti,syscon-pll", "ti,syscon-dev" properties

v4..v3
  Power: reset: keystone-reset: introduce keystone reset driver
  	- changed to use syscon framework
  	- changed to use regmap to access registers
  Power: reset: add bindings for keystone reset driver
  	- deleted properties "reg", "reg-names"
	- added properties "ti,syscon-pll", "ti,syscon-dev"
  ARM: dts: keystone: update reset node to work with reset driver
  	- deleted properties "reg", "reg-names"
	- added properties "ti,syscon-pll", "ti,syscon-dev"

v2..v3
  Power: reset: keystone-reset: introduce keystone reset driver
	- no functional changes, only sanity
  Power: reset: add bindings for keystone reset driver
  	- corrected WDT numeration in examples
	- extended description of wdt_list property

v1..v2
	- re based on v3.15-rc1 without changes

Ivan Khoronzhuk (7):
  power: reset: keystone-reset: introduce keystone reset driver
  clock: keystone-pllctrl: add bindings for keystone pll controller
  mfd: ti-keystone-devctrl: add bindings for device state control
  power: reset: add bindings for keystone reset driver
  ARM: keystone: remove redundant reset stuff
  ARM: dts: keystone: update reset node to work with reset driver
  ARM: keystone: enable reset driver support

 .../bindings/clock/ti-keystone-pllctrl.txt         |  20 +++
 .../bindings/mfd/ti-keystone-devctrl.txt           |  19 +++
 .../bindings/power/reset/keystone-reset.txt        |  67 +++++++++
 arch/arm/boot/dts/keystone.dtsi                    |  14 +-
 arch/arm/configs/keystone_defconfig                |   3 +
 arch/arm/mach-keystone/keystone.c                  |  34 -----
 drivers/power/reset/Kconfig                        |   8 +
 drivers/power/reset/Makefile                       |   1 +
 drivers/power/reset/keystone-reset.c               | 166 +++++++++++++++++++++
 9 files changed, 297 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/keystone-reset.txt
 create mode 100644 drivers/power/reset/keystone-reset.c

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
