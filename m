From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v5 0/3] Introduce clocksource driver for Keystone platform
Date: Wed, 5 Feb 2014 15:47:37 +0200
Message-ID: <1391608060-10760-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a broadcast timer64 based clockevent driver for keystone arch.
This driver uses timer in 64-bit general purpose mode as clock event
device.

Documentation:
    http://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf

Based on
git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
keystone/master

v4..v5:
	used __iowmb() insted of wmb()

v3..v4:
	rebased on latest of linux-keystone.git keystone/master

v2..v3:
- clocksource: timer-keystone: introduce clocksource driver for
	changed "u64" type to "unsigned long" for hz_period as more appropriate
	hz_period rounded up by DIV_ROUND_UP(rate, HZ)
	corrected comments

v1..v2:
- clocksource: timer-keystone: introduce clocksource driver for
	renamed timer on "timer-keystone"
	in keystone_timer_interrupt() evet pointer is passed via "dev_id"
	used __relaxed variants of writel/readl and added explicit barriers
	added "keystone_timer_disable()" for using in keystone_set_mode()
	keystone_timer_config() is not used for disabling the timer any more
	in case of an unsupported mode the keystone_timer_config() returns -1.
	used request_irq() instead of setup_irq()
	assigned irq for event_device in event_dev->irq
	calculated timer.hz_period for CLOCK_EVT_MODE_PERIODIC at init
	deleted spare call of keystone_timer_config() in keystone_timer_init()

Ivan Khoronzhuk (3):
  clocksource: timer-keystone: introduce clocksource driver for Keystone
  clocksource: keystone: add bindings for keystone timer
  arm: dts: keystone: add keystone timer entry

 .../bindings/timer/ti,keystone-timer.txt           |  29 +++
 arch/arm/boot/dts/keystone-clocks.dtsi             |  10 +
 arch/arm/boot/dts/keystone.dtsi                    |   7 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-keystone.c               | 233 +++++++++++++++++++++
 5 files changed, 280 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/ti,keystone-timer.txt
 create mode 100644 drivers/clocksource/timer-keystone.c

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
