From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch 0/6] media: i2c: ov2659: maintenance series
Date: Thu, 12 Sep 2019 08:00:01 -0500
Message-ID: <20190912130007.4469-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

This patch series is a collection of patches we have been carrying for a
while.

It includes a few sensor register fixes which would cause visual
artifacts at lower resolution and also at 720p.

Also on some board the 'powerdown' is not tied to always on so we add
support for an optional powerdown gpio.

Since these camera are removable on some board we alos need the driver
to actually fail when there is no hardware present so the driver is
actually removed.

Finally, we update the licensing statement to use SPDX licensing.

Benoit Parrot (6):
  media: i2c: ov2659: Fix for image wrap-around in lower resolution
  media: i2c: ov2659: Fix sensor detection to actually fail when device
    is not present
  media: dt-bindings: ov2659: add powerdown-gpios optional property
  media: i2c: ov2659: Add optional powerdown gpio handling
  media: i2c: ov2659: Fix missing 720p register config
  media: i2c: ov2659: Switch to SPDX Licensing

 .../devicetree/bindings/media/i2c/ov2659.txt  |  6 +++
 drivers/media/i2c/Kconfig                     |  2 +-
 drivers/media/i2c/ov2659.c                    | 40 +++++++++++--------
 3 files changed, 30 insertions(+), 18 deletions(-)

-- 
2.17.1
