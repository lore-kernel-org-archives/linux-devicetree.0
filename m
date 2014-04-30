From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH v3 0/7] Input: pixcir_i2c_ts: Add Type-B Multi-touch and DT support
Date: Wed, 30 Apr 2014 15:36:25 +0300
Message-ID: <1398861392-8959-1-git-send-email-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: dmitry.torokhov@gmail.com
Cc: rydberg@euromail.se, balbi@ti.com, dmurphy@ti.com, mugunthanvnm@ti.com, nsekhar@ti.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Dmitry,

This series does the following

- use devres managed resource allocations
- convert to Type-B multi touch protocol
- support upto 5 fingers with hardware supplied tracking IDs
- device tree support

Please queue this for -next (3.16). Thanks.

cheers,
-roger

Changelog:

v3:
- Rebased to 3.15-rc3
- Fixed suspend while touchscreen in use
- Fixed module removal while touchscreen in use

v2:
- Addressed review comments and re-arranged patch order

v1:
- http://article.gmane.org/gmane.linux.kernel/1616417

---
Roger Quadros (7):
  Input: pixcir_i2c_ts: Use devres managed resource allocations
  Input: pixcir_i2c_ts: Initialize interrupt mode and power mode
  Input: pixcir_i2c_ts: Get rid of pdata->attb_read_val()
  Input: pixcir_i2c_ts: Use Type-B Multi-Touch protocol
  Input: pixcir_i2c_ts: support upto 5 fingers and hardware provided
    tracking IDs
  Input: pixcir_i2c_ts: Implement wakeup from suspend
  Input: pixcir_i2c_ts: Add device tree support

 .../bindings/input/touchscreen/pixcir_i2c_ts.txt   |  26 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/input/touchscreen/pixcir_i2c_ts.c          | 525 ++++++++++++++++++---
 include/linux/input/pixcir_ts.h                    |  56 ++-
 4 files changed, 548 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/pixcir_i2c_ts.txt

-- 
1.8.3.2

