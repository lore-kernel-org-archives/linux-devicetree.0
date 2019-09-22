From: Heiko Schocher <hs@denx.de>
Subject: [PATCH 0/2] misc: add support for the cc1101 RF transceiver chip from TI
Date: Sun, 22 Sep 2019 08:03:54 +0200
Message-ID: <20190922060356.58763-1-hs@denx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Heiko Schocher <hs@denx.de>, Arnd Bergmann <arnd@arndb.de>, Derek Kiernan <derek.kiernan@xilinx.com>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This driver provides support for the Low-Power Sub-1 GHz RF
Transceiver chip from Texas Instruments. It provides a
simple message based protocol to set chip registers, send
and receive packets to/from the chip.


Heiko Schocher (2):
  misc: add cc1101 devicetree binding
  misc: add support for the cc1101 RF transceiver chip from TI

 .../devicetree/bindings/misc/cc1101.txt       |   27 +
 Documentation/misc-devices/cc1101.txt         |  446 ++++
 drivers/misc/Kconfig                          |   11 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/cc1101.c                         | 2004 +++++++++++++++++
 drivers/misc/cc1101.h                         |   89 +
 include/uapi/linux/cc1101_user.h              |  255 +++
 7 files changed, 2833 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/cc1101.txt
 create mode 100644 Documentation/misc-devices/cc1101.txt
 create mode 100644 drivers/misc/cc1101.c
 create mode 100644 drivers/misc/cc1101.h
 create mode 100644 include/uapi/linux/cc1101_user.h

-- 
2.21.0
