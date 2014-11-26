From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v13 0/12] dw-hdmi: convert imx hdmi to bridge/dw_hdmi
Date: Wed, 26 Nov 2014 21:22:37 +0800
Message-ID: <1417008157-31861-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Andy Yan <andy.yan@rock-chips.com>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org


We found Freescale imx6 and Rockchip rk3288 and Ingenic JZ4780 (Xburst/MIPS)
use the interface compatible Designware HDMI IP, but they also have some
lightly differences, such as phy pll configuration, register width(imx hdmi
register is one byte, but rk3288 is 4 bytes width and can only be accessed
by word), 4K support(imx6 doesn't support 4k, but rk3288 does), and HDMI2.0
support.

To reuse the imx-hdmi driver, we make this patch set:
(1): fix some CodingStyle warning to make checkpatch happy
(2): convert imx-hdmi to drm_bridge
(3): split platform specific code
(4): move imx-hdmi to bridge/dw_hdmi
(5): extend dw_hdmi.c to support rk3288 hdmi
(6): add rockchip rk3288 platform specific code dw_hdmi-rockchip.c

Changes in v13:
- patch against drm-next
- split phy configuration from patch#4

Changes in v12:
- refactor of_node_put(ddc_node)
- squash patch <convert dw_hdmi to drm_bridge>
- add comment for the depend on patch

Changes in v11:
- squash patch  <split some phy configuration to platform driver>
- split form patch <dw_hdmi: add rk3288 support>

Changes in v10:
- split generic dw_hdmi.c improvements from patch#11 (add rk3288 support)
- add more display mode support mpll configuration for rk3288

Changes in v9:
- move some phy configuration to platform driver

Changes in v8:
- correct some spelling mistake
- modify ddc-i2c-bus and interrupt description
- Add documentation for rockchip dw hdmi

Changes in v7:
- remove unused variables from structure dw_hdmi
- remove a wrong modification
- add copyrights for dw_hdmi-imx.c

Changes in v6:
- rearrange the patch order
- refactor register access without reg_shift

Changes in v5:
- refactor reg-io-width

Changes in v4:
- fix checkpatch CHECK
- defer probe ddc i2c adapter

Changes in v3:
- split multi-register access to one indepent patch

Andy Yan (12):
  drm: imx: imx-hdmi: make checkpatch happy
  drm: imx: imx-hdmi: return defer if can't get ddc i2c adapter
  drm: imx: imx-hdmi: convert imx-hdmi to drm_bridge mode
  drm: imx: imx-hdmi: split phy configuration to platform driver
  drm: imx: imx-hdmi: move imx-hdmi to bridge/dw_hdmi
  dt-bindings: add document for dw_hdmi
  drm: bridge/dw_hdmi: add support for multi-byte register width access
  drm: bridge/dw_hdmi: add mode_valid support
  drm: bridge/dw_hdmi: clear i2cmphy_stat0 reg in hdmi_phy_wait_i2c_done
  drm: bridge/dw_hdmi: add function dw_hdmi_phy_enable_spare
  dt-bindings: Add documentation for rockchip dw hdmi
  drm: bridge/dw_hdmi: add rockchip rk3288 support

 .../devicetree/bindings/drm/bridge/dw_hdmi.txt     |  40 ++
 .../devicetree/bindings/video/dw_hdmi-rockchip.txt |  43 ++
 drivers/gpu/drm/bridge/Kconfig                     |   5 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 .../gpu/drm/{imx/imx-hdmi.c => bridge/dw_hdmi.c}   | 757 +++++++++------------
 .../gpu/drm/{imx/imx-hdmi.h => bridge/dw_hdmi.h}   |   4 +-
 drivers/gpu/drm/imx/Kconfig                        |   1 +
 drivers/gpu/drm/imx/Makefile                       |   2 +-
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  | 273 ++++++++
 drivers/gpu/drm/rockchip/Kconfig                   |  10 +
 drivers/gpu/drm/rockchip/Makefile                  |   2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 355 ++++++++++
 include/drm/bridge/dw_hdmi.h                       |  60 ++
 13 files changed, 1132 insertions(+), 421 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt
 rename drivers/gpu/drm/{imx/imx-hdmi.c => bridge/dw_hdmi.c} (71%)
 rename drivers/gpu/drm/{imx/imx-hdmi.h => bridge/dw_hdmi.h} (99%)
 create mode 100644 drivers/gpu/drm/imx/dw_hdmi-imx.c
 create mode 100644 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
 create mode 100644 include/drm/bridge/dw_hdmi.h

-- 
1.9.1
