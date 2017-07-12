From: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 0/5] drm/rockchip: add all full framework vop support
Date: Wed, 12 Jul 2017 10:03:11 +0800
Message-ID: <1499824991-7391-1-git-send-email-mark.yao@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

These patches try to make all current rockchip full framework vop works
on drm, The newer vop design always have some different to the old one,
So we add a register verify mechanism to distinguish those register, then
the registers table can be reused.

And people can easy to know the different for the vops from register table.

Tested on rk3399 evb board.

Changes in v2:
- rename rk322x to rk3228(Heiko Stübner)
- correct some vop registers define

Mark Yao (5):
  drm/rockchip: vop: get rid of register init table
  drm/rockchip: vop: support verify registers with vop version
  drm/rockchip: vop: move line_flag_num to interrupt registers
  drm/rockchip: vop: add a series of vop support
  dt-bindings: display: fill Documents for series of vop

 .../bindings/display/rockchip/rockchip-vop.txt     |   4 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  74 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |  32 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c        | 263 +++---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h        | 905 ++++++++++++++++-----
 5 files changed, 956 insertions(+), 322 deletions(-)

-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
