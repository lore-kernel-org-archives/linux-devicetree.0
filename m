From: Daoyuan Huang <daoyuan.huang@mediatek.com>
Subject: [RFC v2 0/4] media: mediatek: support mdp3 on mt8183 platform
Date: Thu, 16 May 2019 11:23:28 +0800
Message-ID: <20190516032332.56844-1-daoyuan.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This is the first version of RFC patch for Media Data Path 3 (MDP3),
MDP3 is used for scaling and color format conversion.
support using GCE to write register in critical time limitation.
support V4L2 m2m device control.

Changes since v1:
- modify code for CMDQ v3 API support
- EC ipi cmd migration
- fix compliance test fail item (m2m cmd with -f)
due to there is two problem in runing all format(-f) cmd:
1. out of memory before test complete
	Due to capture buffer mmap (refcount + 1) after reqbuf but seems
	no corresponding munmap called before device close.
	There are total 12XX items(formats) in format test and each format
	alloc 8 capture/output buffers.
2. unceasingly captureBufs() (randomly)
	Seems the break statement didn't catch the count == 0 situation:
	In v4l2-test-buffers.cpp, function: captureBufs()
			...
			count--;
			if (!node->is_m2m && !count)
				break;
	Log is as attachment

I will paste the test result with problem part in another e-mail



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

 .../bindings/media/mediatek,mt8183-mdp3.txt   |  217 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  173 +++
 drivers/media/platform/Kconfig                |   18 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/mtk-mdp3/Makefile      |    9 +
 drivers/media/platform/mtk-mdp3/isp_reg.h     |   38 +
 .../media/platform/mtk-mdp3/mdp-platform.h    |   67 +
 .../media/platform/mtk-mdp3/mdp_reg_ccorr.h   |   76 +
 .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |  207 +++
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |  110 ++
 .../media/platform/mtk-mdp3/mdp_reg_wdma.h    |  126 ++
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |  116 ++
 .../media/platform/mtk-mdp3/mmsys_config.h    |  189 +++
 drivers/media/platform/mtk-mdp3/mmsys_mutex.h |   36 +
 .../media/platform/mtk-mdp3/mmsys_reg_base.h  |   39 +
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  282 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  442 ++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   57 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1325 +++++++++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |  177 +++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  256 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   88 ++
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |  823 ++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.h    |   52 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  757 ++++++++++
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  386 +++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  277 ++++
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |   90 ++
 28 files changed, 6435 insertions(+)
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
2.18.0
