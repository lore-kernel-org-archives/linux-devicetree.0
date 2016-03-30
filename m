From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 0/3] Add ANX7814 I2C bridge driver
Date: Wed, 30 Mar 2016 18:22:21 +0200
Message-ID: <1459354944-15326-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: treding@nvidia.com, robh+dt@kernel.org, djkurtz@chromium.org, drinkcat@chromium.org, dan.carpenter@oracle.com
List-Id: devicetree@vger.kernel.org

Hi all,

Following the Emil suggestions to increase the chances of this getting reviewed
I added a per-patch changelog and I explicitly Cc (in the commit message) the
people who commented. I will also cut down the people from the to/cc list. If
someone is really interested to be there just ping me.

This patch set to introduces the anx7814 slimport transmitter driver. These
new series will replace the old series that can be found here [1]. The reason
why I introduce these new series is because the driver changed significantly.
The old approach used a polled state machine ans was not really well using the
kernel mode setting API. With this new driver I tried to use better the drm API
and use an interrupt driven model.

Wating for your new comments...

Changes since previous version:
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
 drivers/gpu/drm/bridge/anx78xx.c                   | 1411 ++++++++++++++++++++
 drivers/gpu/drm/bridge/anx78xx.h                   |  719 ++++++++++
 6 files changed, 2181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/anx7814.txt
 create mode 100644 drivers/gpu/drm/bridge/anx78xx.c
 create mode 100644 drivers/gpu/drm/bridge/anx78xx.h

-- 
2.1.0
