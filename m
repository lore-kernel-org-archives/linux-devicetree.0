From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC v5 0/5] Device tree support for Exynos SoC camera subsystem
Date: Fri, 08 Mar 2013 17:46:00 +0100
Message-ID: <1362761166-5285-2-git-send-email-s.nawrocki@samsung.com>
References: <1362761166-5285-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1362761166-5285-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, swarren@wwwdotorg.org, shaik.samsung@gmail.com, arun.kk@samsung.com, a.hajda@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi All,

Here is an updated version of my patch series adding device tree support
for the Samsung S5P/Exynos SoC series camera subsystem. Previous version
can be found at [1]. Still it doesn't include asynchronous subdev 
registration support as I have been focused on the Exynos4x12 SoC camera 
ISP driver recently.

Changes in this series are mostly addressed review comments from Stephen 
Warren. Thank you for taking time to review!

Detailed changes are listed in each patch.

[1] http://www.spinics.net/lists/arm-kernel/msg222071.html

Thanks,
Sylwester

Sylwester Nawrocki (6):
  s5p-csis: Add device tree support
  s5p-fimc: Add device tree support for FIMC device driver
  s5p-fimc: Add device tree support for FIMC-LITE device driver
  s5p-fimc: Add device tree support for the media device driver
  s5p-fimc: Add device tree based sensors registration
  s5p-fimc: Use pinctrl API for camera ports configuration

 .../devicetree/bindings/media/exynos-fimc-lite.txt |   13 +
 .../devicetree/bindings/media/samsung-fimc.txt     |  186 ++++++++++
 .../bindings/media/samsung-mipi-csis.txt           |   80 +++++
 drivers/media/platform/s5p-fimc/fimc-capture.c     |    6 +-
 drivers/media/platform/s5p-fimc/fimc-core.c        |  231 +++++++------
 drivers/media/platform/s5p-fimc/fimc-core.h        |   21 +-
 drivers/media/platform/s5p-fimc/fimc-lite.c        |   63 +++-
 drivers/media/platform/s5p-fimc/fimc-m2m.c         |    2 +-
 drivers/media/platform/s5p-fimc/fimc-mdevice.c     |  358 +++++++++++++++++---
 drivers/media/platform/s5p-fimc/fimc-mdevice.h     |   16 +
 drivers/media/platform/s5p-fimc/fimc-reg.c         |    6 +-
 drivers/media/platform/s5p-fimc/mipi-csis.c        |  160 +++++++--
 drivers/media/platform/s5p-fimc/mipi-csis.h        |    1 +
 include/media/s5p_fimc.h                           |   17 +
 14 files changed, 957 insertions(+), 203 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
 create mode 100644 Documentation/devicetree/bindings/media/samsung-fimc.txt
 create mode 100644 Documentation/devicetree/bindings/media/samsung-mipi-csis.txt

-- 
1.7.9.5
