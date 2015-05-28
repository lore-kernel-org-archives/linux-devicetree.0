From: Irina Tirdea <irina.tirdea@intel.com>
Subject: [PATCH 0/9] Goodix touchscreen enhancements
Date: Thu, 28 May 2015 15:47:36 +0300
Message-ID: <1432817265-23891-1-git-send-email-irina.tirdea@intel.com>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Irina Tirdea <irina.tirdea@intel.com>
List-Id: devicetree@vger.kernel.org

Add several enhancements to the Goodix touchscreen driver:
 - write configuration data to the device
 - power management support
 - cleanup and refactoring

Irina Tirdea (9):
  input: goodix: fix alignment issues
  input: goodix: fix variable length array warning
  input: goodix: export id and version read from device
  input: goodix: add ACPI IDs for GT911 and GT9271
  input: goodix: reset device at init
  input: goodix: write configuration data to device
  input: goodix: add power management support
  input: goodix: add support for ESD
  input: goodix: use goodix_i2c_write_u8 instead of i2c_master_send

 .../bindings/input/touchscreen/goodix.txt          |  14 +
 drivers/input/touchscreen/goodix.c                 | 481 +++++++++++++++++++--
 2 files changed, 463 insertions(+), 32 deletions(-)

-- 
1.9.1

