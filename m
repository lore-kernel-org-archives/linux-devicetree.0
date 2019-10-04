From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 0/3] media: ov5640: updates
Date: Fri, 4 Oct 2019 12:24:15 -0500
Message-ID: <20191004172418.2339-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

This patch series is a collection of patches we have been carrying for a
while.

First, it adds support for PIXEL_RATE control which is used by some
CSI2 receiver driver to properly set-up their DPHY.

Then we fix an issue related to having extra sensor enable/disable in
the register array for the 1920x1080 mode.

Finally we restrict the largest resolution which should only be
available at the lowest FPS.

Changes since v2:
- Addressed comment from Sakari and Jacopo.
- Make use of the calc_pixel_rate in set_mode also
- Cleaned up the pixel_rate ctrl struct
- Fix the fps condition checking for the max resolution case

Changes since v1:
- Addressed comment from Sakari.
  added a function to calculate the pixel rate and remove the need to
  cache its value

Benoit Parrot (3):
  media: ov5640: add PIXEL_RATE control
  media: ov5640: Fix 1920x1080 mode to remove extra enable/disable
  media: ov5640: Make 2592x1944 mode only available at 15 fps

 drivers/media/i2c/ov5640.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

-- 
2.17.1
