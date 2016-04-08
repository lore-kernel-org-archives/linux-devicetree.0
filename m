From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 0/3] Add ANX7814 I2C bridge driver
Date: Fri,  8 Apr 2016 14:52:49 +0200
Message-ID: <1460119972-8658-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, treding@nvidia.com, robh+dt@kernel.org, djkurtz@chromium.org, drinkcat@chromium.org, dan.carpenter@oracle.com
List-Id: devicetree@vger.kernel.org

Hi all,

This is the third version of the patch, thanks to all that did some comments.
Since I got some reviews and acks I'm wondering if would be possible to land
these patches. Otherwise all reviews are welcome.

I'm not sure if there is a drm bridge maintainer, I think Thierry Reding
maintained this in the past but I'm not sure he's still maintaining the bridge
drivers, so who is the most suitable person to pick up the patches if they are
ok? Maybe Dave?

This patch set to introduces the anx7814 slimport transmitter driver. These
new series will replace the old series that can be found here [1]. The reason
why I introduce these new series is because the driver changed significantly.
The old approach used a polled state machine ans was not really well using the
kernel mode setting API. With this new driver I tried to use better the drm API
and use an interrupt driven model.

Changes since v2:
 - Add Acked-by: Rob Herring <robh@kernel.org> for patch 0002
 - Add Tested-by: Nicolas Boichat <drinkcat@chromium.org>
 - Add Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
 - Nicolas Boichat:
   - Get rid of wait_for macro since is only used once.
   - Do not replace the error code if it's readily available to you.

Changes since v1:
 - Add Acked-by: Rob Herring <robh@kernel.org> for patch 0001
 - Dan Carpenter: 
   - Fix missing error code
   - Use meaningful names for goto exit paths
 - Rob Herring:
   - Rename cable-det-gpios for hpd-gpios as is more standard
   - Fix HDMI output for HDMI input
   - Use hpd instead cable_det as is the more standard name.
 - Daniel Kurtz: 
   - Use regmap_bulk in aux_transfer
   - Fix gpio reset polarity.
   - Turn off v10 last so we mirror poweron sequence
   - Fix some error paths.
   - Remove mutex in anx78xx_detect
 - kbuild:
   - WARNING: PTR_ERR_OR_ZERO can be used

[1] https://lwn.net/Articles/666885/

Enric Balletbo i Serra (3):
  of: Add vendor prefix for Analogix Semiconductor
  devicetree: Add ANX7814 SlimPort transmitter binding.
  drm: bridge: anx78xx: Add anx78xx driver support.

 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 .../devicetree/bindings/video/bridge/anx7814.txt   |   41 +
 drivers/gpu/drm/bridge/Kconfig                     |    8 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/anx78xx.c                   | 1403 ++++++++++++++++++++
 drivers/gpu/drm/bridge/anx78xx.h                   |  719 ++++++++++
 6 files changed, 2173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/anx7814.txt
 create mode 100644 drivers/gpu/drm/bridge/anx78xx.c
 create mode 100644 drivers/gpu/drm/bridge/anx78xx.h

-- 
2.1.0
