From: Vishal Sagar <vishal.sagar@xilinx.com>
Subject: [PATCH 0/2] Add support for Xilinx UHD-SDI Receiver subsystem
Date: Tue,  4 Jun 2019 19:25:54 +0530
Message-ID: <1559656556-79174-1-git-send-email-vishal.sagar@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hyun Kwon <hyun.kwon@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>, Vishal Sagar <vishal.sagar@xilinx.com>
List-Id: devicetree@vger.kernel.org

Xilinx SMPTE UHD-SDI Receiver Subsystem
----------------------------------------

The SMPTE UHD-SDI Receiver (RX) Subsystem allows you to quickly create
systems based on SMPTE SDI protocols. It receives unaligned native SDI
streams from the SDI GT PHY and outputs an AXI4-Stream video stream,
native video, or native SDI using Xilinx transceivers as the physical
layer.

                SMPTE UHD-SDI Rx Subsystem AXI4-Stream Architecture

          +============================================================+
	  |           Native SDI           Native Video                |
SDI	  |   +=========+   |   +============+  |   +=============+    |AXI4
Stream	  |   |  SMPTE  |   V   |   SDI Rx   |  V   | Video In    |    |Stream
--------->|-->| UHD-SDI |------>|    to      |----->|   to        |--->|------->
	  |   |   RX    |       |  Native    |      | AXI4-Stream |    |
	  |   +=========+       |Video Bridge|      +=============+    |
	  |      |  ^           +============+                         |
   <------|------+  |                                                  |
sdi_rx_irq|         |                                                  |
	  +=====+===+==================================================+
                    |                            ^              ^
                    |                            |              |
                 s_axi_aclk                   sdi_rx_clk   video_out_clk


The subsystem consists of the following subcores:
- SMPTE UHD-SDI (RX)
- SDI RX to Video Bridge
- Video In to AXI4-Stream

At design time, this subsystem can be configured in 3Gbps, 6Gbps or
12Gbps mode. It can also be configured to output
- SDI Native stream
- Native Video
- AXI4-Stream

This driver only supports the AXI4-Stream configuration as there is a
corresponding media bus format for YUV 422 10 bits per component in
MEDIA_BUS_FMT_UYVY10_1X20.

Though the core also supports YUV 420 10 bits per component, this is
not supported in driver due to lack of corresponding media bus format
currently.

The SDI core has detection modes where in it can be configured to detect
one or more modes from SD (Standard Definition), HD (High Definition),
3GA, 3GB, 6G and 12G modes. When the core has detected the format, it
generates a video lock. In case the source is removed or there is data
corruption, the video may unlock. This is intimated to the application
via a V4L2 event. Other events which application can subscribe are for
overflow and underflow of the video bridges.

The driver gives out the stream properties like width, height, colorformat,
frame interval and progressive/interlaced based on the ST352 packet in SDI
stream. If the ST352 packet is absent, then the values detected by the
SMPTE UHD-SDI Rx core are used.

The SDI core detection modes and detected mode, errors, etc are all
accessible via v4l controls. This driver has been tested with Omnitek
Ultra4K HD, Phabrix Qx and Blackmagic SDI-HDMI convertors.

This patch set is being sent on top of v8 of Xilinx MIPI CSI2-Rx Subsystem
driver patches.

Vishal Sagar (2):
  media: dt-bindings: media: xilinx: Add Xilinx UHD-SDI Receiver
    Subsystem
  media: v4l: xilinx: Add Xilinx UHD-SDI Rx Subsystem driver

 .../bindings/media/xilinx/xlnx,sdirxss.txt         |   80 +
 drivers/media/platform/xilinx/Kconfig              |   11 +
 drivers/media/platform/xilinx/Makefile             |    1 +
 drivers/media/platform/xilinx/xilinx-sdirxss.c     | 1846 ++++++++++++++++++++
 include/uapi/linux/xilinx-sdirxss.h                |   63 +
 include/uapi/linux/xilinx-v4l2-controls.h          |   30 +
 include/uapi/linux/xilinx-v4l2-events.h            |    9 +
 7 files changed, 2040 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,sdirxss.txt
 create mode 100644 drivers/media/platform/xilinx/xilinx-sdirxss.c
 create mode 100644 include/uapi/linux/xilinx-sdirxss.h

-- 
1.8.3.1
