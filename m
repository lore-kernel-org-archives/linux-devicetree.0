From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 0/6] Rockchip dw-mipi-dsi driver
Date: Tue, 24 Jan 2017 10:38:00 +0800
Message-ID: <1485225486-669-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all

This patch serial is for RK3399 MIPI DSI. The MIPI DSI controller of
RK3399 is almost the same as RK3288, except a little bit of difference
in phy clock controlling and port id selection register. These patches
add RK3399 support and the power domain support.

And these patches base on John Keeping's series[0], it fixes many bugs,
they have been tested on rk3288 evb board.

[0]:
[01/26] https://patchwork.kernel.org/patch/9340213
[02/26] https://patchwork.kernel.org/patch/9340145
[03/26] https://patchwork.kernel.org/patch/9340235
[04/26] https://patchwork.kernel.org/patch/9340123
[05/26] https://patchwork.kernel.org/patch/9340161
[06/26] https://patchwork.kernel.org/patch/9340203
[07/26] https://patchwork.kernel.org/patch/9340229
[08/26] https://patchwork.kernel.org/patch/9340131
[09/26] https://patchwork.kernel.org/patch/9340191
[10/26] https://patchwork.kernel.org/patch/9340175
[11/26] https://patchwork.kernel.org/patch/9340237
[12/26] https://patchwork.kernel.org/patch/9340207
[13/26] https://patchwork.kernel.org/patch/9340233
[14/26] https://patchwork.kernel.org/patch/9340205
[15/26] https://patchwork.kernel.org/patch/9340189
[16/26] https://patchwork.kernel.org/patch/9340143
[17/26] https://patchwork.kernel.org/patch/9340117
[18/26] https://patchwork.kernel.org/patch/9340193
[19/26] https://patchwork.kernel.org/patch/9340151
[20/26] https://patchwork.kernel.org/patch/9340183
[23/26] https://patchwork.kernel.org/patch/9340173
[24/26] https://patchwork.kernel.org/patch/9340251
[25/26] https://patchwork.kernel.org/patch/9340127
[26/26] https://patchwork.kernel.org/patch/9340139


Changes in v4:
- remove the unrelated change

Changes in v3:
- base on John Keeping's patch series

Chris Zhong (6):
  dt-bindings: add rk3399 support for dw-mipi-rockchip
  drm/rockchip/dsi: dw-mipi: support RK3399 mipi dsi
  drm/rockchip/dsi: dw-mipi: correct the coding style
  drm/rockchip/dsi: remove mode_valid function
  dt-bindings: add power domain node for dw-mipi-rockchip
  drm/rockchip/dsi: add dw-mipi power domain support

 .../display/rockchip/dw_mipi_dsi_rockchip.txt      |   7 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi.c             | 156 ++++++++++++---------
 2 files changed, 96 insertions(+), 67 deletions(-)

-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
