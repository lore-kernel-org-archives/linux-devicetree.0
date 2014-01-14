From: <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v1 0/5] pinctrl: st: Add interrupt controller support.
Date: Tue, 14 Jan 2014 14:51:17 +0000
Message-ID: <1389711077-20949-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

Hi Linus W, 

This series of patches add interrupt controller support to ST pinctrl driver.
ST pin controller GPIO bank can have one of the two possible types of
interrupt-wirings.

First type is via irqmux, single interrupt is used by multiple gpio
banks. This reduces number of interrupts numbers required by pin controller.
All these gpio banks belong to a single pin controller.

Second type has a dedicated interrupt per gpio bank. Interrupt number usage is
very high in this case.

This patch adds support to both these wirings.

Also, ST pin controller hardware only supports level triggered interrupts.
However for drivers like gpio keypad requires edge trigger interrupt support,
so one of the patch adds edge trigger interrupt support in software by using
the existing level trigger support in hardware.

Patch 01: Is a minor typo fix.
Patch 02: Adds level interrupt support to pin controller.
Patch 03: Adds software edge trigger support.
Patch 04,05 : Updates STiH415, STiH416 dts files for interrupt support.

As Patch-01 only has a typo fix I did not move it out of this series.

Comments?

Thanks,
srini

Srinivas Kandagatla (5):
  pinctrl: st: Fix a typo in probe
  pinctrl: st: Add Interrupt support.
  pinctrl: st: Add software edge trigger interrupt support.
  ARM:STi: STiH416: Add interrupt support for pin controller
  ARM:STi: STiH415: Add interrupt support for pin controller

 .../devicetree/bindings/pinctrl/pinctrl-st.txt     |   60 ++++-
 arch/arm/boot/dts/stih415-pinctrl.dtsi             |   75 +++++
 arch/arm/boot/dts/stih416-pinctrl.dtsi             |   81 ++++++
 drivers/pinctrl/pinctrl-st.c                       |  287 +++++++++++++++++++-
 4 files changed, 492 insertions(+), 11 deletions(-)

-- 
1.7.6.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
