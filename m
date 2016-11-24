From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 0/3] sx150x update - bugfix, cleanup, last 4 chips
Date: Thu, 24 Nov 2016 21:45:17 +0100
Message-ID: <1480020320-28354-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

Yet another sx150x update, only the first is critical.

Cheers,
Peter

Peter Rosin (3):
  pinctrl: sx150x: use correct registers for reg_sense (sx1502 and
    sx1508)
  pinctrl: sx150x: sort chips by part number
  pinctrl: sx150x: add support for sx1501, sx1504, sx1505 and sx1507

 .../devicetree/bindings/pinctrl/pinctrl-sx150x.txt |  14 +-
 drivers/pinctrl/pinctrl-sx150x.c                   | 206 +++++++++++++++------
 2 files changed, 161 insertions(+), 59 deletions(-)

-- 
2.1.4
