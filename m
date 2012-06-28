From: Johan Hovold <jhovold@gmail.com>
Subject: [PATCH 0/2] mfd: tps65910: add support for enabling external 32-kHz oscillator
Date: Thu, 28 Jun 2012 12:20:20 +0200
Message-ID: <1340878822-28444-1-git-send-email-jhovold@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Johan Hovold <jhovold@gmail.com>
List-Id: devicetree@vger.kernel.org

These patches (against v3.5-rc4) add support for enabling the external 32-kHz
oscillator input in tps6591x devices. Depending on boot-mode, the internal
RC-oscillator may be used by default and the external crystal-oscillator input
must be enabled by clearing a flag in the device-control register.

These patches are needed in order to get an accurate system clock on boards
such as the Craneboard.

Thanks,
Johan

Johan Hovold (2):
  mfd: tps65910: add support for enabling external 32-kHz oscillator
  mfd: tps65910: add device-tree entry to enable external 32-kHz
    oscillator

 Documentation/devicetree/bindings/mfd/tps65910.txt |    4 ++-
 drivers/mfd/tps65910.c                             |   24 +++++++++++++++++++-
 include/linux/mfd/tps65910.h                       |    1 +
 3 files changed, 27 insertions(+), 2 deletions(-)

-- 
1.7.8.6
