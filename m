From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: [PATCH v2 0/2] [media] s5p-tv: Add initial DT-support to s5p-tv's
 subdevices
Date: Fri, 16 Mar 2012 16:42:10 +0100
Message-ID: <1331912532-7798-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: t.stanislaws@samsung.com
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, thomas.abraham@linaro.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>
List-Id: devicetree@vger.kernel.org

Changes since v1:
 - dropped patch for sii9234 driver - driver itself hasn't been merged yet
 - changed compatible string to name first known SoC having given features
   (IP blocks, actually) [Thanks Thomas!]


This patchset adds initial device tree support to drivers used by
s5p-tv on Exynos4.

DT support for s5p-tv driver itself would benefit from changes to v4l
core (missing OF helper functions) and thus, will be sent later in
separate patchset.

Karol Lewandowski (2):
  s5p-tv: Add initial DT-support for TV mixer
  s5p-tv: Add initial DT-support for HDMIPHY

 drivers/media/video/s5p-tv/hdmiphy_drv.c |   10 ++++++++++
 drivers/media/video/s5p-tv/mixer_drv.c   |    9 +++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

-- 
1.7.9
