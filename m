From: Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH v7 RESEND 0/3] auxdisplay: Introduce ht16k33 driver
Date: Mon,  7 Nov 2016 10:56:33 +0100
Message-ID: <1478512596-19242-1-git-send-email-robin@protonic.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Robin van der Gracht <robin@protonic.nl>
List-Id: devicetree@vger.kernel.org

Rebased and resend for Greg.

This patchset adds a new driver to the auxdisplay subsystem. It also adds
devicetree binding documentation and a new vendor prefix.

I added myself as maintainer to the MAINTAINERS file.

Robin van der Gracht (3):
  of: add vendor prefix for Holtek Semiconductor
  auxdisplay: ht16k33: Driver for LED controller
  MAINTAINERS: auxdisplay: Added myself as maintainer for ht16k33 driver

 .../devicetree/bindings/display/ht16k33.txt        |  42 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 MAINTAINERS                                        |   6 +
 drivers/auxdisplay/Kconfig                         |   9 +
 drivers/auxdisplay/Makefile                        |   1 +
 drivers/auxdisplay/ht16k33.c                       | 563 +++++++++++++++++++++
 6 files changed, 622 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ht16k33.txt
 create mode 100644 drivers/auxdisplay/ht16k33.c

-- 
2.7.4
