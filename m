From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v1 0/6] Add RK3399 HDMI Support
Date: Mon, 11 Jul 2016 19:04:39 +0800
Message-ID: <1468235079-29152-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Kumar Gala <galak@codeaurora.org>, Zheng Yang <zhengyang@rock-chips.com>, xhc@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Yakir Yang <ykk@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Mark,

RK3399 and RK3288 shared the same HDMI IP controller, only some
light difference with GRF configure, and an external VPLL clock
need to configure.

Thanks,
- Yakir


Douglas Anderson (2):
  drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
  drm/rockchip: dw_hdmi: Use auto-generated tables

Yakir Yang (4):
  drm/rockchip: dw_hdmi: adjust cklvl & txlvl for RF/EMI
  drm/rockchip: dw_hdmi: add RK3399 HDMI support
  drm/rockchip: dw_hdmi: introduce the VPLL clock setting
  drm/rockchip: dw_hdmi: introduce the pclk for grf

 .../devicetree/bindings/display/bridge/dw_hdmi.txt |   1 +
 .../bindings/display/rockchip/dw_hdmi-rockchip.txt |   7 +-
 drivers/gpu/drm/bridge/dw-hdmi.c                   |   2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 238 +++++++++++++--------
 include/drm/bridge/dw_hdmi.h                       |   6 +
 5 files changed, 167 insertions(+), 87 deletions(-)

-- 
1.9.1
