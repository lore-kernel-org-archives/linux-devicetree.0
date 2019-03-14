From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC v1 0/4] media: mediatek: support mdp3 on mt8183 platform
Date: Thu, 14 Mar 2019 09:37:20 +0100
Message-ID: <176c023b-d734-c5a0-bf40-e190eff00278@xs4all.nl>
References: <1552024160-33055-1-git-send-email-daoyuan.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1552024160-33055-1-git-send-email-daoyuan.huang@mediatek.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daoyuan Huang <daoyuan.huang@mediatek.com>, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, ping-hsun.wu@mediatek.com, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Daoyuan Huang,

On 3/8/19 6:49 AM, Daoyuan Huang wrote:
> From: daoyuan huang <daoyuan.huang@mediatek.com>
> 
> This is the first version of RFC patch for Media Data Path 3 (MDP3),
> MDP3 is used for scaling and color format conversion.
> support using GCE to write register in critical time limitation.
> support V4L2 m2m device control.

Just a high-level comment before you post the next version of this series:

Please compile the latest version of v4l2-compliance (part of
git://linuxtv.org/v4l-utils.git) and run it against your driver:

v4l2-compliance -d /dev/videoX -s10 -f

(I hope the -f option works, it tests all combinations of pixelformats, but those
tests are new so there may be issues, just let me know if that's the case).

Whenever you post a new version of this series, please do a 'git pull' of
the v4l-utils repo, recompile and retest with v4l2-compliance and post the
test results in the cover letter.

Obviously, there should be no FAILs and probably no warnings.

Regards,

	Hans

> 
> ---
> Based on v5.0-rc1 and these series:
> device tree:
> http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017570.html
> clock control:
> http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017320.html
> system control processor (SCP):
> http://lists.infradead.org/pipermail/linux-mediatek/2019-February/017774.html
> global command engine (GCE):
> http://lists.infradead.org/pipermail/linux-mediatek/2019-January/017143.html
> ---
> 
> daoyuan huang (4):
>   dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
>   dts: arm64: mt8183: Add Mediatek MDP3 nodes
>   media: platform: Add Mediatek MDP3 driver KConfig
>   media: platform: mtk-mdp3: Add Mediatek MDP3 driver
> 
>  .../bindings/media/mediatek,mt8183-mdp3.txt        |  217 ++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  109 ++
>  drivers/media/platform/Kconfig                     |   18 +
>  drivers/media/platform/Makefile                    |    2 +
>  drivers/media/platform/mtk-mdp3/Makefile           |    9 +
>  drivers/media/platform/mtk-mdp3/isp_reg.h          |   38 +
>  drivers/media/platform/mtk-mdp3/mdp-platform.h     |   67 ++
>  drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h    |   76 ++
>  drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h     |  207 ++++
>  drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h      |  110 ++
>  drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h     |  126 +++
>  drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h     |  116 ++
>  drivers/media/platform/mtk-mdp3/mmsys_config.h     |  189 ++++
>  drivers/media/platform/mtk-mdp3/mmsys_mutex.h      |   36 +
>  drivers/media/platform/mtk-mdp3/mmsys_reg_base.h   |   39 +
>  drivers/media/platform/mtk-mdp3/mtk-img-ipi.h      |  272 +++++
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c    |  407 +++++++
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h    |   52 +
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c    | 1180 ++++++++++++++++++++
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h    |  176 +++
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c    |  257 +++++
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h    |   89 ++
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c     |  784 +++++++++++++
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h     |   52 +
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c    |  778 +++++++++++++
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h    |  382 +++++++
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c     |  277 +++++
>  drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h     |   90 ++
>  28 files changed, 6155 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
>  create mode 100644 drivers/media/platform/mtk-mdp3/Makefile
>  create mode 100644 drivers/media/platform/mtk-mdp3/isp_reg.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp-platform.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ccorr.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wdma.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_wrot.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_config.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_mutex.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mmsys_reg_base.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.c
>  create mode 100644 drivers/media/platform/mtk-mdp3/mtk-mdp3-vpu.h
> 
