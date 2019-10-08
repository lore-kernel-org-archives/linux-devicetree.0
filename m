From: Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 0/3] RK3288 Gamma LUT
Date: Tue,  8 Oct 2019 20:00:35 -0300
Message-ID: <20191008230038.24037-1-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, kernel@collabora.com, Sean Paul <seanpaul@chromium.org>, Boris Brezillon <boris.brezillon@collabora.com>, Douglas Anderson <dianders@chromium.org>, Jacopo Mondi <jacopo@jmondi.org>, Ilia Mirkin <imirkin@alum.mit.edu>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>
List-Id: devicetree@vger.kernel.org

Following Sean's comments, here's a new version.

On this new iteration, we modify the GAMMA LUT
on .atomic_enable and .atomic_begin.

With this change, the GAMMA settings are effectively
re-applied after resuming the machine, so the previous
patch "RFC: drm/atomic-helper: Reapply color transformation after
resume" is now dropped.

Also, I dropped Reviewed-bys tags on patch 2, given
the implementation is a bit different now.

Thanks!

Ezequiel Garcia (3):
  dt-bindings: display: rockchip: document VOP gamma LUT address
  drm/rockchip: Add optional support for CRTC gamma LUT
  ARM: dts: rockchip: Add RK3288 VOP gamma LUT address

 .../display/rockchip/rockchip-vop.txt         |   6 +-
 arch/arm/boot/dts/rk3288.dtsi                 |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 125 ++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |   5 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |   2 +
 6 files changed, 140 insertions(+), 3 deletions(-)

-- 
2.22.0
