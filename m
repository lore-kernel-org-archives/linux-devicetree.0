From: Oleksij Rempel <linux@rempel-privat.de>
Subject: [PATCH v4 0/2] Add driver and documentation for Alphascale asm9260 pinctrl
Date: Mon,  6 Apr 2015 11:04:01 +0200
Message-ID: <1428311043-12012-1-git-send-email-linux@rempel-privat.de>
References: <1428306169.634.51.camel@x220>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428306169.634.51.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Oleksij Rempel <linux@rempel-privat.de>
List-Id: devicetree@vger.kernel.org

changes:
- v4. As Paul Bolle sugested, fixing License in the header.

Oleksij Rempel (2):
  pinctrl: Add driver for Alphascale asm9260 pinctrl
  pinctrl: asm9260: add pinctrl add device tree bindings documentation

 .../pinctrl/alphascale,asm9260-pinctrl.txt         |  76 +++
 drivers/pinctrl/Kconfig                            |   8 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-asm9260.c                  | 733 +++++++++++++++++++++
 4 files changed, 818 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/alphascale,asm9260-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-asm9260.c

-- 
1.9.1
