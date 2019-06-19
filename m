Return-Path: <SRS0=A4pV=US=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 0/2] media: add Toshiba TC358746 Bridge support
Date: Wed, 19 Jun 2019 17:28:36 +0200
Message-Id: <20190619152838.25079-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: sakari.ailus@linux.intel.com, mchehab@kernel.org, robh+dt@kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Cc: devicetree@vger.kernel.org, graphics@pengutronix.de, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

this is my v2 contains all the review feedback made on my v1 [1].
Since Rob didn't responed to the question how we should handle the
different input/output config I decided to use Jacopo approach since
it is common for mux devices too.

I rebased the patches ontop of media_tree/master so there should be no
conflicts.

Regards,
  Marco

[1] https://patchwork.ozlabs.org/cover/1015381/

Marco Felsch (2):
  media: dt-bindings: add bindings for Toshiba TC358746
  media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver

 .../bindings/media/i2c/toshiba,tc358746.txt   |   95 +
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   12 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/tc358746.c                  | 1807 +++++++++++++++++
 drivers/media/i2c/tc358746_regs.h             |  208 ++
 6 files changed, 2130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
 create mode 100644 drivers/media/i2c/tc358746.c
 create mode 100644 drivers/media/i2c/tc358746_regs.h

-- 
2.20.1
