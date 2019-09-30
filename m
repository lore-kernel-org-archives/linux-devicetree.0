From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v5 0/8] media: i2c: ov2659: maintenance series
Date: Mon, 30 Sep 2019 08:06:36 -0500
Message-ID: <20190930130644.8704-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

This patch series is a collection of patches we have been carrying for a
while.

It includes a few sensor register fixes which would cause visual
artifacts at lower resolution and also at 720p.

Also on some board the 'powerdown' and /or 'reset' pins are not tied so
we need to add support for optional gpios to handle these.

Since these camera are removable on some board we also need the driver
to actually fail when there is no hardware present so the driver is
actually removed.

Also added a patch to check and propagate errors on s_stream invocation.

Finally, we update the licensing statement to use SPDX licensing.

Changes since v4:
- Changes the s_ctrl "power" access method to use pm runtime API
- Fix an issue with "streaming" vairable left on in error case.
- Added Acked-by from Prabhakar
- Added Reviwed-by from Rob

Changes since v3:
- Addressed review comment from Sakari about s_ctrl i2c access whne
  powered off

Changes since v2:
- Addressed review comment from Sakari
- Reworked the "media: i2c: ov2659: Add powerdown/reset gpio handling"
  to use pm_runtime if it is available but not to make it depend on it.
- Cleaned up the gpio related calls to remove the unnecessary NULL check

Changes since v1:
- Addressed review comment from Prabhakar
- Added support for reset-gpios
- Rework the power setting to use pm_runtime instead of s_power
  as based on discussion with Sakari it would be the prefered method
- Added a patch to reduce the number explicit include files to the
  minimum necessary instead of the previous kitchen sink approach

Benoit Parrot (8):
  media: i2c: ov2659: Fix for image wrap-around in lower resolution
  media: i2c: ov2659: Fix sensor detection to actually fail when device
    is not present
  media: i2c: ov2659: Cleanup include file list
  media: i2c: ov2659: fix s_stream return value
  media: dt-bindings: ov2659: add powerdown/reset-gpios optional
    property
  media: i2c: ov2659: Add powerdown/reset gpio handling
  media: i2c: ov2659: Fix missing 720p register config
  media: i2c: ov2659: Switch to SPDX Licensing

 .../devicetree/bindings/media/i2c/ov2659.txt  |   9 ++
 drivers/media/i2c/Kconfig                     |   2 +-
 drivers/media/i2c/ov2659.c                    | 139 +++++++++++++-----
 3 files changed, 112 insertions(+), 38 deletions(-)

-- 
2.17.1
