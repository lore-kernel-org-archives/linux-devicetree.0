From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/22] of: Introduce of_match_device()
Date: Mon,  6 Jun 2016 10:31:42 +0200
Message-ID: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This series of patches introduces a common implementation of a function
that can be used in iterators (such as the bus_for_each_dev() or the
driver_for_each_device() functions) and that compare's a device's device
tree node with the passed in data. Numerous drivers and subsystems have
their own variant of this function, so a lot of duplication can be
removed by making use of the common implementation.

One thing that slightly bugs me about this is that it can't be used with
users of class_for_each_device() or class_find_device() because they get
passed a callback that takes a const void * rather than a void * for the
device tree node. I had at some point investigated to turn the remainder
of the iterators into taking const void *, but there are some drivers in
the kernel that want to modify the data passed to them, so it isn't easy
to switch.

An alternative would be to turn the const void * into void * for all the
callbacks of this sort, so that we can use a single set throughout the
tree, but I'm not sure how welcome that would be. I can give that a shot
if people think it worth, though.

Greg, any thoughts on this?

I've also kept the list of recipients very short, to get early feedback
and buy-in from Rob and Frank on the common implementation. I expect the
naming to allow for some good bike-shedding.

Russell, I've Cc'ed you explicitly on this because last dozen or so
patches touch users of component helpers and you've been busy working on
those lately. I wanted to give you a heads up on this and am looking for
your feedback on where you think this would fit in.

Merging this might get a little complicated, but I think it'd be easiest
to take it all through the DT tree. Perhaps we can hold off on the final
DRM and IOMMU patches since they are based on stuff currently in linux-
next only, and defer those to v4.9?

Thierry

Thierry Reding (22):
  of: Implement of_match_device()
  amba: tegra-ahb: Use of_device_match()
  coresight: Use of_device_match()
  i2c: core: Use of_device_match()
  net: cpsw-phy-sel: Use of_device_match()
  nvmem: core: Use of_device_match()
  of/platform: Use of_device_match()
  spi: Use of_device_match()
  of: mdio: Use of_device_match()
  usb: phy: am335x-control: Use of_device_match()
  usb: phy: isp1301: Use of_device_match()
  drm/hdlcd: Use of_device_match()
  drm/armada: Use of_device_match()
  drm/etnaviv: Use of_device_match()
  drm/hisilicon: Use of_device_match()
  drm/mediatek: Use of_device_match()
  drm/msm: Use of_device_match()
  drm/rockchip: Use of_device_match()
  drm/sti: Use of_device_match()
  drm/sun4i: Use of_device_match()
  drm/tilcdc: Use of_device_match()
  iommu/mediatek: Use of_device_match()

 drivers/amba/tegra-ahb.c                        | 11 ++---------
 drivers/gpu/drm/arm/hdlcd_drv.c                 |  8 ++------
 drivers/gpu/drm/armada/armada_drv.c             |  8 ++------
 drivers/gpu/drm/drm_mipi_dsi.c                  |  5 -----
 drivers/gpu/drm/etnaviv/etnaviv_drv.c           | 12 +++---------
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c |  8 ++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  8 ++------
 drivers/gpu/drm/msm/msm_drv.c                   | 13 +++----------
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c     | 12 +++---------
 drivers/gpu/drm/sti/sti_drv.c                   |  8 ++------
 drivers/gpu/drm/sun4i/sun4i_drv.c               | 12 ++----------
 drivers/gpu/drm/tilcdc/tilcdc_external.c        |  8 ++------
 drivers/hwtracing/coresight/of_coresight.c      | 10 +++-------
 drivers/i2c/i2c-core.c                          |  9 ++-------
 drivers/iommu/mtk_iommu.c                       |  8 ++------
 drivers/net/ethernet/ti/cpsw-phy-sel.c          |  9 ++-------
 drivers/nvmem/core.c                            |  8 ++------
 drivers/of/of_mdio.c                            |  9 ++-------
 drivers/of/platform.c                           |  7 +------
 drivers/spi/spi.c                               |  7 +------
 drivers/usb/phy/phy-am335x-control.c            | 10 +++-------
 drivers/usb/phy/phy-isp1301.c                   | 13 ++++---------
 include/linux/of_device.h                       |  5 +++++
 23 files changed, 52 insertions(+), 156 deletions(-)

-- 
2.8.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
