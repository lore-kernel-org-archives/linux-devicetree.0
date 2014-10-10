From: Matt Ranostay <mranostay@gmail.com>
Subject: [PATCH v5 0/3] cap1106: add support for cap11xx variants
Date: Thu,  9 Oct 2014 21:23:00 -0700
Message-ID: <1412914983-3742-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: dmitry.torokhov@gmail.com, galak@codeaurora.org, zonque@gmail.com
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Matt Ranostay <mranostay@gmail.com>
List-Id: devicetree@vger.kernel.org

Changes from v4:

 * Only allocate private structure and keycodes memory once 

Matt Ranostay (3):
  cap11xx: make driver generic for variant support
  cap11xx: Add support for various cap11xx devices
  cap11xx: support for irq-active-high option

 .../bindings/input/{cap1106.txt => cap11xx.txt}    |  12 +-
 drivers/input/keyboard/Kconfig                     |   8 +-
 drivers/input/keyboard/Makefile                    |   2 +-
 drivers/input/keyboard/cap1106.c                   | 341 -------------------
 drivers/input/keyboard/cap11xx.c                   | 368 +++++++++++++++++++++
 5 files changed, 382 insertions(+), 349 deletions(-)
 rename Documentation/devicetree/bindings/input/{cap1106.txt => cap11xx.txt} (78%)
 delete mode 100644 drivers/input/keyboard/cap1106.c
 create mode 100644 drivers/input/keyboard/cap11xx.c

-- 
1.9.1

