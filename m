From: Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH 0/2] Add driver for Domintech DMARD06 accelerometer
Date: Mon, 18 Jul 2016 15:48:10 +0300
Message-ID: <1468846092-18914-1-git-send-email-mamlinav@gmail.com>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksei Mamlin <mamlinav@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch series adds driver for Domintech DMARD06 Low-G Tri-Axial
digital accelerometer and vendor prefix for Domintech Co., Ltd.

Aleksei Mamlin (2):
  devicetree: bindings: Add vendor prefix for Domintech Co., Ltd.
  input: misc: Add support for Domintech DMARD06 accelerometer

 .../devicetree/bindings/input/dmard06.txt          |  24 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/input/misc/Kconfig                         |  12 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/dmard06.c                       | 442 +++++++++++++++++++++
 5 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/dmard06.txt
 create mode 100644 drivers/input/misc/dmard06.c

-- 
2.7.3

