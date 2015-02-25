From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/7] clk: Common clock support for IMG Pistachio
Date: Tue, 24 Feb 2015 19:56:00 -0800
Message-ID: <1424836567-7252-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds common clock support for the IMG Pistachio SoC.
Pistachio has two clock controllers (core and peripheral) and two
general control blocks (peripheral and top) which also contain
several clock gates.  Like the recently submitted pinctrl driver [1],
this driver is written so that it's hopefully easy to add support
for future IMG SoCs.

Tested on an IMG Pistachio BuB.  Based on 4.0-rc1 + my series adding
Pistachio platform support [2], which introduces the MACH_PISTACHIO
Kconfig symbol.  A branch with this series and the dependent patches
is available at [3].  I'd like this to go through the MIPS tree with
Mike's or Stephen's ACK if possible.

Cc: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

[1] https://lkml.org/lkml/2015/2/23/705
[2] https://lkml.org/lkml/2015/2/23/694
[3] https://github.com/abrestic/linux/tree/pistachio-clk-v1

Andrew Bresticker (7):
  clk: Add binding document for Pistachio clock controllers
  clk: Add basic infrastructure for Pistachio clocks
  clk: pistachio: Add PLL driver
  clk: pistachio: Register core clocks
  clk: pistachio: Register peripheral clocks
  clk: pistachio: Register system interface gate clocks
  clk: pistachio: Register external clock gates

 .../devicetree/bindings/clock/pistachio-clock.txt  | 123 +++++++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/pistachio/Makefile                     |   3 +
 drivers/clk/pistachio/clk-pistachio.c              | 329 +++++++++++++++++
 drivers/clk/pistachio/clk-pll.c                    | 401 +++++++++++++++++++++
 drivers/clk/pistachio/clk.c                        | 140 +++++++
 drivers/clk/pistachio/clk.h                        | 174 +++++++++
 include/dt-bindings/clock/pistachio-clk.h          | 183 ++++++++++
 8 files changed, 1354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/pistachio-clock.txt
 create mode 100644 drivers/clk/pistachio/Makefile
 create mode 100644 drivers/clk/pistachio/clk-pistachio.c
 create mode 100644 drivers/clk/pistachio/clk-pll.c
 create mode 100644 drivers/clk/pistachio/clk.c
 create mode 100644 drivers/clk/pistachio/clk.h
 create mode 100644 include/dt-bindings/clock/pistachio-clk.h

-- 
2.2.0.rc0.207.ga3a616c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
