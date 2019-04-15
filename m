Return-Path: <SRS0=S1EI=SR=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v3 0/2] Microchip QT1050 support
Date: Mon, 15 Apr 2019 18:56:53 +0200
Message-Id: <20190415165655.13016-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, raphaelpereira@gmail.com, voice.shen@atmel.com, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi,

this v3 contains all the comments made on my v2 [1].
Each patch has it's own changelog so I omit it here.

I've tested it on a custom v5.0 kernel and rebased
it on v5.1-rc5 without any issues.

[1] https://patchwork.kernel.org/cover/10659275/

Marco Felsch (2):
  dt-bindings: input: add Microchip QT1050 bindings
  Input: qt1050 - add Microchip AT42QT1050 support

 .../bindings/input/microchip,qt1050.txt       |  78 +++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/qt1050.c               | 597 ++++++++++++++++++
 4 files changed, 687 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/microchip,qt1050.txt
 create mode 100644 drivers/input/keyboard/qt1050.c

-- 
2.20.1
