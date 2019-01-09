Return-Path: <SRS0=TUFM=PR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36901 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730392AbfAILap (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 9 Jan 2019 06:30:45 -0500
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 0/3] Add ZynqMP VCU/Allegro DVT H.264 encoder driver
Date: Wed,  9 Jan 2019 12:30:34 +0100
Message-Id: <20190109113037.28430-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, Michael Tretter <m.tretter@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

This series adds support for the Allegro DVT H.264 encoder found in the EV
family of the Xilinx ZynqMP platform.

The encoder is part of the ZynqMP VCU (video codec unit), which supports
encoding and decoding of H.264 and H.265. I am planning to support decoding
and H.265 as well in this driver.

The codec engines are separate hard IP cores in the FPGA of the ZynqMP and
each engine is controlled by a microcontroller (MCU). Each MCU executes code
in its own memory mapped SRAM. This SRAM also contains mailboxes that the
driver uses to exchange command and status messages with the MCU.

Encoder and decoder share an interrupt that is triggered whenever a message is
available in one of the mailboxes. Each MCU provides an interrupt status
register in its own register space.

I would appreciate feedback to the device tree bindings, the overall
architecture of the driver and if there are any major issues that I need to
address.

There are several things already on my own TODO list:

- The driver still contains various hard coded values and only works with a
  resolution of 144x144. I am working on enabling more resolutions and
  actually calculating the hard-coded values.

- The driver also only works with the vcu-firmware release 2018.2 [0]. The
  2018.3 release uses a different mailbox size, which needs to be reflected in
  the driver.

- There is the xlnx-vcu driver for managing the clocks via the FPGA glue code.
  Right now, the allegro driver does not interact with the driver to configure
  the clocks.

I ran v4l2-compliance without failures on the driver, but I think adding the
test results right now only distracts from more important open issues in the
driver.

Michael

[0] https://github.com/Xilinx/vcu-firmware/tree/xilinx-v2018.2

Michael Tretter (3):
  media: dt-bindings: media: document allegro-dvt bindings
  [media] allegro: add Allegro DVT video IP core driver
  [media] allegro: add SPS/PPS nal unit writer

 .../devicetree/bindings/media/allegro.txt     |   35 +
 MAINTAINERS                                   |    6 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/allegro-dvt/Kconfig     |    6 +
 drivers/staging/media/allegro-dvt/Makefile    |    6 +
 .../staging/media/allegro-dvt/allegro-core.c  | 2425 +++++++++++++++++
 drivers/staging/media/allegro-dvt/nal-h264.c  | 1278 +++++++++
 drivers/staging/media/allegro-dvt/nal-h264.h  |  188 ++
 9 files changed, 3947 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allegro.txt
 create mode 100644 drivers/staging/media/allegro-dvt/Kconfig
 create mode 100644 drivers/staging/media/allegro-dvt/Makefile
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-core.c
 create mode 100644 drivers/staging/media/allegro-dvt/nal-h264.c
 create mode 100644 drivers/staging/media/allegro-dvt/nal-h264.h

-- 
2.19.1
