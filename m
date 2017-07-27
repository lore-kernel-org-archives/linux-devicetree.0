From: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/3] Initial Allwinner V3s CSI Support
Date: Thu, 27 Jul 2017 11:51:11 +0800
Message-ID: <1501127474-40895-1-git-send-email-yong.deng__41165.7174038284$1501166954$gmane$org@magewell.com>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBAABBX7247FQKGQEALYRCXQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Trotin <jean-christophe.trotin-qxv4g6HH51o@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel@li
Cc: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset add initial support for Allwinner V3s CSI.

Allwinner V3s SoC have two CSI module. CSI0 is used for MIPI interface
and CSI1 is used for parallel interface. This is not documented in
datasheet but by testing and guess.

This patchset implement a v4l2 framework driver and add a binding 
documentation for it. 

Currently, the driver only support the parallel interface. And has been
tested with a BT1120 signal which generating from FPGA. The following
fetures are not support with this patchset:
  - ISP 
  - MIPI-CSI2
  - Master clock for camera sensor
  - Power regulator for the front end IC

sun6i_csi_ops is still there. I seriously thought about it. Without 
sun6i_csi_ops, the dependency between sun6i_video and sun6i_csi_v3s
will be complicated. Comments and criticisms are welcome.

Changes in v2:
  * Change sunxi-csi to sun6i-csi
  * Rebase to media_tree master branch

Yong Deng (3):
  media: V3s: Add support for Allwinner CSI.
  dt-bindings: media: Add Allwinner V3s Camera Sensor Interface (CSI)
  media: MAINTAINERS: add entries for Allwinner V3s CSI

 .../devicetree/bindings/media/sun6i-csi.txt        |  49 ++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   2 +
 drivers/media/platform/sun6i-csi/Kconfig           |   9 +
 drivers/media/platform/sun6i-csi/Makefile          |   3 +
 drivers/media/platform/sun6i-csi/sun6i_csi.c       | 545 ++++++++++++++
 drivers/media/platform/sun6i-csi/sun6i_csi.h       | 203 +++++
 drivers/media/platform/sun6i-csi/sun6i_csi_v3s.c   | 827 +++++++++++++++++++++
 drivers/media/platform/sun6i-csi/sun6i_csi_v3s.h   | 206 +++++
 drivers/media/platform/sun6i-csi/sun6i_video.c     | 663 +++++++++++++++++
 drivers/media/platform/sun6i-csi/sun6i_video.h     |  61 ++
 12 files changed, 2577 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/sun6i-csi.txt
 create mode 100644 drivers/media/platform/sun6i-csi/Kconfig
 create mode 100644 drivers/media/platform/sun6i-csi/Makefile
 create mode 100644 drivers/media/platform/sun6i-csi/sun6i_csi.c
 create mode 100644 drivers/media/platform/sun6i-csi/sun6i_csi.h
 create mode 100644 drivers/media/platform/sun6i-csi/sun6i_csi_v3s.c
 create mode 100644 drivers/media/platform/sun6i-csi/sun6i_csi_v3s.h
 create mode 100644 drivers/media/platform/sun6i-csi/sun6i_video.c
 create mode 100644 drivers/media/platform/sun6i-csi/sun6i_video.h

-- 
1.8.3.1
