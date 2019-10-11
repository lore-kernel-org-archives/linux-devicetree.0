From: Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [RESEND PATCH v2 0/4] media: rockchip: Add the rkvdec driver
Date: Fri, 11 Oct 2019 11:33:38 +0200
Message-ID: <20191011093342.3471-1-boris.brezillon@collabora.com>
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
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

Sorry for the noise, I forgot to Cc the DT maintainers/ML on my last
attempt.

This is v2 of the rkvdec driver which was initially posted as part of
my RFC adding codec helpers.
For this version, I decided to get rid of the helper stuff which is
likely to take some more time to settle. The patchset now contains a
proper DT binding doc.

Note that this implementation is likely to be adjusted based on the
outcome of the 'scaling matrix order' [1] and 'dynamic resolution
changes' [2] discussions, but I thought it'd be worth posting this
version to start getting feeback.

Regards,

Boris

[1]https://patchwork.kernel.org/cover/11125207/
[2]https://lkml.org/lkml/2019/9/3/1033

Boris Brezillon (4):
  media: vb2: Add a helper to get the vb2 buffer attached to a request
  media: dt-bindings: rockchip: Document RK3399 Video Decoder bindings
  media: rockchip: Add the rkvdec driver
  arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node

 .../bindings/media/rockchip,vdec.yaml         |   71 ++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |   14 +-
 .../media/common/videobuf2/videobuf2-core.c   |   23 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/rockchip/Kconfig        |   16 +
 drivers/staging/media/rockchip/Makefile       |    2 +
 drivers/staging/media/rockchip/vdec/Kconfig   |   14 +
 drivers/staging/media/rockchip/vdec/Makefile  |    3 +
 .../staging/media/rockchip/vdec/rkvdec-h264.c |  960 +++++++++++++++
 .../staging/media/rockchip/vdec/rkvdec-regs.h |  306 +++++
 drivers/staging/media/rockchip/vdec/rkvdec.c  | 1089 +++++++++++++++++
 drivers/staging/media/rockchip/vdec/rkvdec.h  |  131 ++
 include/media/videobuf2-core.h                |   11 +
 14 files changed, 2642 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
 create mode 100644 drivers/staging/media/rockchip/Kconfig
 create mode 100644 drivers/staging/media/rockchip/Makefile
 create mode 100644 drivers/staging/media/rockchip/vdec/Kconfig
 create mode 100644 drivers/staging/media/rockchip/vdec/Makefile
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec-h264.c
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec-regs.h
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec.c
 create mode 100644 drivers/staging/media/rockchip/vdec/rkvdec.h

-- 
2.21.0
