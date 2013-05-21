From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [RFC/PATCH v2 0/2] R-Car GPIO DT bindings
Date: Tue, 21 May 2013 13:40:04 +0200
Message-ID: <1369136406-23800-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm@opensource.se>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: devicetree@vger.kernel.org

Hello,

Here's the second version of the gpio-rcar driver DT bindings. I've tested the
patches on the Marzen board (r8a7779).

Once again I'd appreciate feedback on the DT bindings. I'm particularly
wondering whether getting the number of lines through the gpio-ranges property
instead of using a dedicated #gpio-lines property as in v1 is a good idea.

Changes since v1:

- Initialize the gpiochip dev field at probe time.
- Add the gpio-ranges property.
- Remove the #gpio-lines property. The number of lines is now passed through
  the gpio-ranges property.

Laurent Pinchart (2):
  gpio-rcar: Make the platform data gpio_base field signed
  gpio-rcar: Add DT support

 .../devicetree/bindings/gpio/renesas,gpio-rcar.txt | 52 +++++++++++++++++
 drivers/gpio/gpio-rcar.c                           | 66 ++++++++++++++++++----
 include/linux/platform_data/gpio-rcar.h            |  2 +-
 3 files changed, 109 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt

-- 
Regards,

Laurent Pinchart

