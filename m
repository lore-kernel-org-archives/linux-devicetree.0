From: Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 0/3] RK3288 Gamma LUT
Date: Fri, 21 Jun 2019 18:13:43 -0300
Message-ID: <20190621211346.1324-1-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, kernel@collabora.com, Sean Paul <seanpaul@chromium.org>, Boris Brezillon <boris.brezillon@collabora.com>, Douglas Anderson <dianders@chromium.org>, Jacopo Mondi <jacopo@jmondi.org>, Ilia Mirkin <imirkin@alum.mit.edu>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>
List-Id: devicetree@vger.kernel.org

Let's support Gamma LUT configuration on RK3288 SoCs.

In order to do so, this series adds a new and optional
address resource.
    
A separate address resource is required because on this RK3288,
the LUT address is after the MMU address, which is requested
by the iommu driver. This prevents the DRM driver
from requesting an entire register space.

The current implementation works for RGB 10-bit tables, as that
is what seems to work on RK3288.

This has been tested on a Rock2 Square board, using
a hacked 'modetest' tool, with legacy and atomic APIs. 

Thanks,
Eze

Changes from v1:
* drop explicit linear LUT after finding a proper
  way to disable gamma correction.
* avoid setting gamma is the CRTC is not active.
* s/int/unsigned int as suggested by Jacopo.
* only enable color management and set gamma size
  if gamma LUT is supported, suggested by Doug.
* drop the reg-names usage, and instead just use indexed reg
  specifiers, suggested by Doug.

Changes from RFC:
* Request (an optional) address resource for the LUT.
* Add devicetree changes.
* Drop support for RK3399, which doesn't seem to work
  out of the box and needs more research.
* Support pass-thru setting when GAMMA_LUT is NULL.
* Add a check for the gamma size, as suggested by Ilia.
* Move gamma setting to atomic_commit_tail, as pointed
  out by Jacopo/Laurent, is the correct way.

Ezequiel Garcia (3):
  dt-bindings: display: rockchip: document VOP gamma LUT address
  drm/rockchip: Add optional support for CRTC gamma LUT
  ARM: dts: rockchip: Add RK3288 VOP gamma LUT address

 .../display/rockchip/rockchip-vop.txt         |   6 +-
 arch/arm/boot/dts/rk3288.dtsi                 |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |   3 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 114 ++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |   7 ++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |   2 +
 6 files changed, 133 insertions(+), 3 deletions(-)

-- 
2.20.1
