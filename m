From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH V4 0/2] pinctrl: Support for IMG Pistachio
Date: Tue, 28 Apr 2015 18:13:00 -0700
Message-ID: <1430269982-24129-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for the system pin and GPIO controller on the IMG
Pistachio SoC.  Pistachio's system pin controller manages 99 pins, 90 of
which are MFIOs which can be muxed between multiple functions or used
as GPIOs.  The GPIO control for the 90 MFIOs is broken up into banks
of 16.  Pistachio also has a second pin controller, the RPU pin controller,
which will be supported by a future patchset through an extension to this
driver.

Tested on an IMG Pistachio BuB.  Based on v4.1-rc1.

Changes from v3:
 - Addressed review comments from Ezequiel.
Changes from v2:
 - Removed module stuff that ends up being compiled out.
Changes from v1:
 - Documented pin + function generic binding.
 - Changed compatible string to "img,pistachio-system-pinctrl".
 - Addressed some review comments.
 - A couple of bug fixes.

Cc: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Andrew Bresticker (2):
  pinctrl: Add Pistachio SoC pin control binding document
  pinctrl: Add Pistachio SoC pin control driver

 .../bindings/pinctrl/img,pistachio-pinctrl.txt     |  217 +++
 drivers/pinctrl/Kconfig                            |    6 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-pistachio.c                | 1502 ++++++++++++++++++++
 4 files changed, 1726 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-pistachio.c

-- 
2.2.0.rc0.207.ga3a616c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
