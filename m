Return-Path: <SRS0=m20R=QU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36409 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387858AbfBMRvk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Feb 2019 12:51:40 -0500
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v3 0/3] Add ZynqMP VCU/Allegro DVT H.264 encoder driver
Date: Wed, 13 Feb 2019 18:51:21 +0100
Message-Id: <20190213175124.3695-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com, Michael Tretter <m.tretter@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

This is v3 of the series to add support for the Allegro DVT H.264 encoder
found in the EV family of the Xilinx ZynqMP platform.

The devicetree bindings now also include the clocks as documented in PG252
"H.264/H.265 Video Codec Unit v1.2" [0].

Most changes involve added or removed v4l2 callbacks that were mentioned in
the review comments to make the v4l2-compliance test suite happy.

I also updated the firmware loading and device probing to properly handle
failures and correctly reset or stop the MCU.

Still on my list is a check against the documentation of the memory-to-memory
stateful video encoder interface. If there are fixes necessary, I will include
them in a v4.

I did not introduce a separate queue for internal buffers for encoded frames.
I am still considering this split, but I want to have tracing in place before
doing this. The changes will completely internal to the driver and can be done
later anyway.

Each patch also contains a more detailed changelog.

Michael

[0] https://www.xilinx.com/support/documentation/ip_documentation/vcu/v1_2/pg252-vcu.pdf

v2 -> v3:
- add clocks to devicetree bindings
- fix devicetree binding according to review comments on v2
- add missing v4l2 callbacks
- drop unnecessary v4l2 callbacks
- drop debug module parameter poison_capture_buffers
- check firmware size before loading firmware
- rework error handling

v1 -> v2:
- clean up debug log levels
- fix unused variable in allegro_mbox_init
- fix uninitialized variable in allegro_mbox_write
- fix global module parameters
- fix Kconfig dependencies
- return h264 as default codec for mcu
- implement device reset as documented
- document why irq does not wait for clear
- rename ENCODE_ONE_FRM to ENCODE_FRAME
- allow error codes for mcu_channel_id
- move control handler to channel
- add fw version check
- add support for colorspaces
- enable configuration of H.264 levels
- enable configuration of frame size
- enable configuration of bit rate and CPB size
- enable configuration of GOP size
- rework response handling
- fix missing error handling in allegro_h264_write_sps


Michael Tretter (3):
  media: dt-bindings: media: document allegro-dvt bindings
  [media] allegro: add Allegro DVT video IP core driver
  [media] allegro: add SPS/PPS nal unit writer

 .../devicetree/bindings/media/allegro.txt     |   43 +
 MAINTAINERS                                   |    6 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/allegro-dvt/Kconfig     |   16 +
 drivers/staging/media/allegro-dvt/Makefile    |    6 +
 .../staging/media/allegro-dvt/allegro-core.c  | 2909 +++++++++++++++++
 drivers/staging/media/allegro-dvt/nal-h264.c  | 1278 ++++++++
 drivers/staging/media/allegro-dvt/nal-h264.h  |  188 ++
 9 files changed, 4449 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allegro.txt
 create mode 100644 drivers/staging/media/allegro-dvt/Kconfig
 create mode 100644 drivers/staging/media/allegro-dvt/Makefile
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-core.c
 create mode 100644 drivers/staging/media/allegro-dvt/nal-h264.c
 create mode 100644 drivers/staging/media/allegro-dvt/nal-h264.h

-- 
2.20.1
