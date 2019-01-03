Return-Path: <SRS0=TXGq=PL=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/5] Input: edt-ft5x06 - Add support for Evervision FT devices
Date: Thu,  3 Jan 2019 20:23:22 +0100
Message-Id: <20190103192327.6170-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-input@vger.kernel.org, hdegoede@redhat.com, simon.budig@kernelconcepts.de
List-ID: <devicetree@vger.kernel.org>

This series adds the support for Evervision Focaltech based touchscreen
controllers. Evervision uses three different controllers, depending on
the display resolution, these are:
 - FT5306
 - FT5726
 - FT5C26.

It seems that the firmware for all controllers doesn't differ, but I
had only a FT5726 based device. So this series adds only the support
for those devices.

The Evervision vendor-prefix was added in an another patchset [1].

This patchset is based on the v4.20-rc1 tag.

[1] https://www.spinics.net/lists/devicetree/msg266938.html

Marco Felsch (5):
  dt-bindings: Input: edt-ft5x06 - add support for FT5726
  Input: edt-ft5x06 - add support for Evervision FT5726
  Input: edt-ft5x06 - Add support to update ev-ft5726 registers
  dt-bindings: Input: edt-ft5x06 - add offset bindings for ft5726
  Input: edt-ft5x06 - add offset support for ev-ft5726

 .../bindings/input/touchscreen/edt-ft5x06.txt |  13 ++-
 drivers/input/touchscreen/edt-ft5x06.c        | 110 ++++++++++++++++--
 2 files changed, 114 insertions(+), 9 deletions(-)

-- 
2.19.1
