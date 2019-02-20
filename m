From: Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Subject: [RFC PATCH V0 0/7] media: platform: Add support for Face Detection
 (FD) on mt8183 SoC
Date: Wed, 20 Feb 2019 15:48:06 +0800
Message-ID: <1550648893-42050-1-git-send-email-Jerry-Ch.chen@mediatek.com>
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

Hello,

This is the first version of the RFC patch series adding Face Detection
(FD) driver on Mediatek mt8183 SoC, which will be used in camera features
on CrOS application. It belongs to the first Mediatek's camera driver
series based on V4L2 and media controller framework. I posted the main part
of the FD driver as RFC to discuss first and would like some review
comments on the overall structure of the driver.

Face Detection (FD) unit provide hardware accelerated face detection
feature. It can detect different sizes of faces in a given image.
Furthermore, it has the capability to detect the faces of Rotation-in-Plane
from -180 to +180 degrees and Rotation-off-Plane from -90 to +90 degrees.

The driver is implemented with V4L2 and media controller framework. We have
the following entities describing the FD path.

1. Meta input (output video device): connects to FD sub device. It accepts
   the input parameter buffer from userspace. The metadata interface used
   currently is only a temporary solution to kick off driver development
   and is not ready for reviewed yet.

2. RAW (output video device): connects to FD sub device. It accepts input
   image buffer from userspace.

3. FD (sub device): connects to Meta output. When processing an image,
   FD hardware only returns the statistics of detected faces so it needs
   only one capture video devices to return the streaming data to the user.

4. Meta output (capture video device): Return the result of detected faces
   as metadata output.

   The overall file structure of the FD driver is as following:

* mtk_fd-dev-ctx-core.c: Implements common software flow of FD driver.
* mtk_fd-v4l2.c: Static FD contexts configuration.
* mtk_fd.c: Controls the hardware flow.
* mtk_fd-dev.c: Implements context-independent flow.
* mtk_fd-ctrl.c: Handles the HW ctrl request from userspace.
* mtk_fd-smem-drv.c: Provides the shared memory management required
operation. We reserved a memory region for the co-processor and FD to
exchange the hardware configuration data.
* mtk_fd-v4l2-util.c: Implements V4L2 and vb2 ops.

Jerry-ch Chen (7):
  dt-bindings: mt8183: Add binding for FD shared memory
  dts: arm64: mt8183: Add FD shared memory node
  dt-bindings: mt8183: Added FD-SMEM dt-bindings
  dt-bindings: mt8183: Added FD dt-bindings
  dts: arm64: mt8183: Add FD nodes
  media: platform: Add Mediatek FD driver KConfig
  platform: mtk-isp: Add Mediatek FD driver

 .../devicetree/bindings/media/mediatek,fd_smem.txt |   28 +
 .../bindings/media/mediatek,mt8183-fd.txt          |   30 +
 .../mediatek,reserve-memory-fd_smem.txt            |   44 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   28 +
 drivers/media/platform/Kconfig                     |    2 +
 drivers/media/platform/mtk-isp/Kconfig             |   10 +
 drivers/media/platform/mtk-isp/Makefile            |   16 +
 drivers/media/platform/mtk-isp/fd/Makefile         |   38 +
 drivers/media/platform/mtk-isp/fd/mtk_fd-core.h    |  157 +++
 drivers/media/platform/mtk-isp/fd/mtk_fd-ctx.h     |  299 ++++++
 .../platform/mtk-isp/fd/mtk_fd-dev-ctx-core.c      |  917 +++++++++++++++++
 drivers/media/platform/mtk-isp/fd/mtk_fd-dev.c     |  355 +++++++
 drivers/media/platform/mtk-isp/fd/mtk_fd-dev.h     |  198 ++++
 .../media/platform/mtk-isp/fd/mtk_fd-smem-drv.c    |  452 +++++++++
 drivers/media/platform/mtk-isp/fd/mtk_fd-smem.h    |   25 +
 .../media/platform/mtk-isp/fd/mtk_fd-v4l2-util.c   | 1046 ++++++++++++++++++++
 drivers/media/platform/mtk-isp/fd/mtk_fd-v4l2.c    |  115 +++
 drivers/media/platform/mtk-isp/fd/mtk_fd-v4l2.h    |   36 +
 drivers/media/platform/mtk-isp/fd/mtk_fd.c         |  730 ++++++++++++++
 drivers/media/platform/mtk-isp/fd/mtk_fd.h         |  127 +++
 20 files changed, 4653 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,fd_smem.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-fd_smem.txt
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig
 create mode 100644 drivers/media/platform/mtk-isp/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/fd/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-core.h
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-ctx.h
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-dev-ctx-core.c
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-dev.c
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-dev.h
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-smem-drv.c
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-smem.h
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-v4l2-util.c
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-v4l2.c
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd-v4l2.h
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd.c
 create mode 100644 drivers/media/platform/mtk-isp/fd/mtk_fd.h

-- 
1.9.1
