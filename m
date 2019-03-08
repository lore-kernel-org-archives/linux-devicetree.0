From: Daoyuan Huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RFC v1 0/4] media: mediatek: support mdp3 on mt8183 platform
Date: Fri, 8 Mar 2019 13:49:16 +0800
Message-ID: <1552024160-33055-1-git-send-email-daoyuan.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, daoyuan huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ping-hsun.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, zwisler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, christie.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: daoyuan huang <daoyuan.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

This is the first version of RFC patch for Media Data Path 3 (MDP3),
MDP3 is used for scaling and color format conversion.
support using GCE to write register in critical time limitation.
support V4L2 m2m device control.

---
Based on v5.0-rc1 and these series:
device tree:
http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017570.html
clock control:
http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017320.html
system control processor (SCP):
http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017774.html
global command engine (GCE):
http://lists.infradead.org/pipermail/linux-mediatek/2019-January/017143.html
---

daoyuan huang (4):
  dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
  dts: arm64: mt8183: Add Mediatek MDP3 nodes
  media: platform: Add Mediatek MDP3 driver KConfig
  media: platform: mtk-mdp3: Add Mediatek MDP3 driver

 .../bindings/media/mediatek,mt8183-mdp3.txt        |  217 ++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  109 ++
 drivers/media/platform/Kconfig                     |   18 +
 drivers/media/platform/Makefile                    |    2 +
 drivers/media/platform/mtk-mdp3/Makefile           |    9 +
 drivers/media/platform/mtk-mdp3/isp_reg.h          |   38 +
 drivers/media/platform/mtk-mdp3/mdp-platform.h     |   67 ++
 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h    |   76 ++
 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h     |  207 ++++
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h      |  110 ++
 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h     |  126 +++
 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h     |  116 ++
 drivers/media/platform/mtk-mdp3/mmsys_config.h     |  189 ++++
 drivers/media/platform/mtk-mdp3/mmsys_mutex.h      |   36 +
 drivers/media/platform/mtk-mdp3/mmsys_reg_base.h   |   39 +
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h      |  272 +++++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c    |  407 +++++++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h    |   52 +
 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c    | 1180 ++++++++++++++++++++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h    |  176 +++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c    |  257 +++++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h    |   89 ++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c     |  784 +++++++++++++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h     |   52 +
 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c    |  778 +++++++++++++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h    |  382 +++++++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c     |  277 +++++
 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h     |   90 ++
 28 files changed, 6155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
 create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
 create mode 100644 drivers/media/platform/mtk-mdp3/isp_reg.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp-platform.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_config.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_mutex.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_reg_base.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
 create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h

-- 
1.9.1
