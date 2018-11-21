From: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v10 0/4] Add Rockchip VPU JPEG encoder
Date: Wed, 21 Nov 2018 16:16:48 -0300
Message-ID: <20181121191652.22814-1-ezequiel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Dufresne <nicolas.dufresne-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Miouyouyou <myy-tmjzNUIc0P1+EYZtW95mkQ@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series is based on Mauro's master branch,
with the following patch applied:

https://patchwork.kernel.org/patch/10676149/

Hans,

If you think the driver is now ready, I'd like to merge
only patches 1/4 and 4/4 (the driver per-se) via the media tree.

The devicetree changes could go via Heiko's tree.

v10:
 * Fix SPDX syntax
 * Add missing patch with binding documentation
 * Remove white line in Kconfig

v9:
 * Address some style comments from Hans.
 * Fix TODO file

v8:
 * Drop new JPEG_RAW format.
 * Drop quantization table user controls.
 * Add JPEG headers to produce JPEG frames.

Ezequiel Garcia (4):
  media: dt-bindings: Document the Rockchip VPU bindings
  ARM: dts: rockchip: add VPU device node for RK3288
  arm64: dts: rockchip: add VPU device node for RK3399
  media: add Rockchip VPU JPEG encoder driver

 .../bindings/media/rockchip-vpu.txt           |  29 +
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/rk3288.dtsi                 |  14 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  14 +-
 drivers/staging/media/Kconfig                 |   2 +
 drivers/staging/media/Makefile                |   1 +
 drivers/staging/media/rockchip/vpu/Kconfig    |  13 +
 drivers/staging/media/rockchip/vpu/Makefile   |  10 +
 drivers/staging/media/rockchip/vpu/TODO       |   6 +
 .../media/rockchip/vpu/rk3288_vpu_hw.c        | 118 +++
 .../rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c     | 133 ++++
 .../media/rockchip/vpu/rk3288_vpu_regs.h      | 442 +++++++++++
 .../media/rockchip/vpu/rk3399_vpu_hw.c        | 118 +++
 .../rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c     | 160 ++++
 .../media/rockchip/vpu/rk3399_vpu_regs.h      | 600 +++++++++++++++
 .../staging/media/rockchip/vpu/rockchip_vpu.h | 237 ++++++
 .../media/rockchip/vpu/rockchip_vpu_common.h  |  29 +
 .../media/rockchip/vpu/rockchip_vpu_drv.c     | 535 +++++++++++++
 .../media/rockchip/vpu/rockchip_vpu_enc.c     | 702 ++++++++++++++++++
 .../media/rockchip/vpu/rockchip_vpu_hw.h      |  58 ++
 .../media/rockchip/vpu/rockchip_vpu_jpeg.c    | 290 ++++++++
 .../media/rockchip/vpu/rockchip_vpu_jpeg.h    |  14 +
 22 files changed, 3530 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.txt
 create mode 100644 drivers/staging/media/rockchip/vpu/Kconfig
 create mode 100644 drivers/staging/media/rockchip/vpu/Makefile
 create mode 100644 drivers/staging/media/rockchip/vpu/TODO
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3399_vpu_hw_jpeg_enc.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rk3399_vpu_regs.h
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu.h
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_common.h
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.c
 create mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.h

-- 
2.19.1
