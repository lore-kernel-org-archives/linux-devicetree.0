From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v4 0/9] Initial Allwinner H6 support
Date: Fri, 16 Mar 2018 22:02:06 +0800
Message-ID: <20180316140215.28663-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBPE5V7KQKGQEUQ5ZQMY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds initial support for the Allwinner H6 SoC.

It's quite different from earlier Allwinner SoCs. For example, the
memory map is refactored, and the CCU is rearranged. It's also the first
Allwinner SoC with PCI Express interface (although the implementation
of the PCI Express controller is broken), and the second one with USB
3.0 (the first one is A80).

This patchset adds the most basical support for it, including the main pin
controller, the main CCU and the basical device tree.

Icenowy Zheng (9):
  pinctrl: sunxi: refactor irq related register function to have desc
  pinctrl: sunxi: introduce IRQ bank conversion function
  pinctrl: sunxi: change irq_bank_base to irq_bank_map
  pinctrl: sunxi: add support for the Allwinner H6 main pin controller
  clk: sunxi-ng: Support fixed post-dividers on NKMP style clocks
  dt-bindings: add device tree binding for Allwinner H6 main CCU
  clk: sunxi-ng: add support for the Allwinner H6 CCU
  arm64: allwinner: h6: add the basical Allwinner H6 DTSI file
  arm64: allwinner: h6: add support for Pine H64 board

 .../devicetree/bindings/clock/sunxi-ccu.txt        |    4 +
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    1 +
 arch/arm64/boot/dts/allwinner/Makefile             |    1 +
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts      |   29 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |  177 +++
 drivers/clk/sunxi-ng/Kconfig                       |    5 +
 drivers/clk/sunxi-ng/Makefile                      |    1 +
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c               | 1207 ++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-h6.h               |   56 +
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |   20 +-
 drivers/clk/sunxi-ng/ccu_nkmp.h                    |    2 +
 drivers/pinctrl/sunxi/Kconfig                      |    4 +
 drivers/pinctrl/sunxi/Makefile                     |    1 +
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c          |  614 ++++++++++
 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c          |    4 +-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c          |    4 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   22 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |   40 +-
 include/dt-bindings/clock/sun50i-h6-ccu.h          |  124 ++
 include/dt-bindings/reset/sun50i-h6-ccu.h          |   73 ++
 20 files changed, 2359 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h6.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h6.h
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c
 create mode 100644 include/dt-bindings/clock/sun50i-h6-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-h6-ccu.h

-- 
2.15.1
