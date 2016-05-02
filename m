From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [RESEND PATCH v4 0/4] Add ANX7814 I2C bridge driver
Date: Mon,  2 May 2016 09:54:22 +0200
Message-ID: <1462175666-8891-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, treding@nvidia.com
Cc: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, djkurtz@chromium.org, drinkcat@chromium.org, dan.carpenter@oracle.com
List-Id: devicetree@vger.kernel.org

Hi all,

This is the fourth version of the patch, thanks to all that did some comments.

In this version I basically added the comments made by Thierry, also it
introduces a new patch in the series to add a new helper constant in
drm_dp_helper.h. The devicetree binding also suffered a slight modification, one
gpio is modelled as a regulator now, for that reason, I removed the ack from Rob,
so please if you're ok with the change ack again.

This patch set to introduces the anx7814 slimport transmitter driver. These
new series will replace the old series that can be found here [1]. The reason
why I introduce these new series is because the driver changed significantly.
The old approach used a polled state machine ans was not really well using the
kernel mode setting API. With this new driver I tried to use better the drm API
and use an interrupt driven model.

Waiting for new comments ...

Changes since v3:
 - Introduce new patch to define the DP_PERCENT_DOWNSPREAD_0_5 constant needed
   by the driver.
 - Thierry Reding:
   - Add vendor name on symbols and files
   - Remove <linux/async.h> include
   - Improve anx78xx_aux_wait code (remove atomic case)
   - Fix msg->reply handling
   - Capitalize HPD/HDMI/DP
   - Don't return -EAGAIN on link training
   - Use symbolic constants defined instead of magic numbers
   - Move connector_to_anx78xx after the anx78xx declaration
   - Improve some coding style
     - Give the first parameter the proper name (irq)
     - Leave out the tab-padding in anx78xx_bridge_funcs
     - Put bridge_to_anx78xx together with the connector cast function.
      - The structure name should start in the first column
   - Remove messages for connector status changes
   - Free the EDID on unplug instead of on plug event
   - Use unsigned int for i in for loops.
   - Model v10 as regulator.
   - Remove the use of OR'ed errors
   - Simply pass adjusted_mode in bridge mode set.
   - Remove bridge_enable/disable mutex protection, not needed.
   - There's no need to set ->edid to NULL when remove the driver.

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


Enric Balletbo i Serra (4):
  drm/dp: Add define to set 0.5% down-spread in MAX_DOWNSPREAD register.
  of: Add vendor prefix for Analogix Semiconductor
  devicetree: Add ANX7814 SlimPort transmitter binding.
  drm: bridge: anx78xx: Add anx78xx driver support.

 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 .../devicetree/bindings/video/bridge/anx7814.txt   |   40 +
 drivers/gpu/drm/bridge/Kconfig                     |   10 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/analogix-anx78xx.c          | 1499 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix-anx78xx.h          |  719 ++++++++++
 include/drm/drm_dp_helper.h                        |    1 +
 7 files changed, 2271 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/anx7814.txt
 create mode 100644 drivers/gpu/drm/bridge/analogix-anx78xx.c
 create mode 100644 drivers/gpu/drm/bridge/analogix-anx78xx.h

-- 
2.1.0
