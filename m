Return-Path: <SRS0=pxxc=NJ=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 0/2] Microchip QT1050 support
Date: Mon, 29 Oct 2018 14:38:24 +0100
Message-Id: <20181029133826.30326-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, raphaelpereira@gmail.com, voice.shen@atmel.com, linux-input@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi,

this is my v2 containing the comments made on my v1 [1].

I split the dt-bindings according to commit [2].

[1] https://www.spinics.net/lists/devicetree/msg250279.html
[2] https://www.spinics.net/lists/devicetree/msg253946.html

Marco Felsch (2):
  dt-bindings: input: add Microchip QT1050 bindings
  Input: qt1050 - add Microchip AT42QT1050 support

 .../bindings/input/microchip,qt1050.txt       |  74 +++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/qt1050.c               | 620 ++++++++++++++++++
 4 files changed, 706 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/microchip,qt1050.txt
 create mode 100644 drivers/input/keyboard/qt1050.c

-- 
2.19.1
