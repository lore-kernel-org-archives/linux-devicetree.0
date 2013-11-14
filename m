From: Marek Belisko <marek@goldelico.com>
Subject: [PATCH 0/3] Add EOC handling for bmp085 + DT and platform data updates
Date: Thu, 14 Nov 2013 22:46:46 +0100
Message-ID: <1384465609-26485-1-git-send-email-marek@goldelico.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org
Cc: neilb@suse.de, hns@goldelico.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, rob@landley.net, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Belisko <marek@goldelico.com>
List-Id: devicetree@vger.kernel.org

This series add support for using EOC gpio line of bmp085 to detect when conversion
is finished. First patch add that functionality. Second patch add DT bindings for gpio
and irq parameters. Third patch add missing platform data which are already in DT bindings
to have possibility to used them on non-DT archs.

Marek Belisko (3):
  misc: bmp085: Clean up and enable use of interrupt for completion.
  misc: bmp085: Add DT bindings for EOC gpio line and direct irq.
  misc: bmp085: Add missing platform data.

 Documentation/devicetree/bindings/misc/bmp085.txt |   8 ++
 drivers/misc/bmp085.c                             | 138 +++++++++++++++++++---
 include/linux/i2c/bmp085.h                        |  24 ++++
 3 files changed, 155 insertions(+), 15 deletions(-)
 create mode 100644 include/linux/i2c/bmp085.h

-- 
1.8.1.2

