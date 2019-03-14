From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC PATCH V0 0/4] media: support Mediatek sensor interface driver
Date: Thu, 14 Mar 2019 09:42:18 +0100
Message-ID: <d65ff907-51af-cf95-9f95-84aef95af505@xs4all.nl>
References: <1550733718-31702-1-git-send-email-louis.kuo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550733718-31702-1-git-send-email-louis.kuo@mediatek.com>
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
To: Louis Kuo <louis.kuo@mediatek.com>, hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Louis Kuo,

On 2/21/19 8:21 AM, Louis Kuo wrote:
> Hello,
> 
> This is the first version of the RFC patch series adding Sensor Inferface(seninf) driver on
> Mediatek mt8183 SoC, which will be used in camera features on CrOS application.
> It belongs to the first Mediatek's camera driver series based on V4L2 and media controller framework.
> I posted the main part of the seninf driver as RFC to discuss first and would like some review comments
> on the overall structure of the driver.
> 
> The driver is implemented with V4L2 framework.
> 1. Register as a V4L2 sub-device.
> 2. Only one entity with sink pads linked to camera sensors for choosing desired camera sensor by setup link
>    and with source pads linked to cam-io for routing different types of decoded packet datas to PASS1 driver
>    to generate sensor image frame and meta-data.

Just a high-level comment before you post the next version of this series:

Please compile the latest version of v4l2-compliance (part of
git://linuxtv.org/v4l-utils.git) and run it against your driver:

v4l2-compliance -d /dev/videoX -s10 -f

Whenever you post a new version of this series, please do a 'git pull' of
the v4l-utils repo, recompile and retest with v4l2-compliance and post the
test results in the cover letter.

Obviously, there should be no FAILs and probably no warnings.

Regards,

	Hans

> 
> The overall file structure of the seninf driver is as following:
> 
> * mtk_seninf.c: Implement software and HW control flow of seninf driver.
> * seninf_drv_def.h: Define data structure and enumeration.
> * seninf_reg.h: Define HW register R/W macros and HW register names.
> 
> Louis Kuo (4):
>   media: platform: mtk-isp: Add Mediatek sensor interface driver
>   media: platform: Add Mediatek sensor interface driver KConfig
>   dt-bindings: mt8183: Added sensor interface dt-bindings
>   dts: arm64: mt8183: Add sensor interface nodes
> 
>  .../devicetree/bindings/media/mediatek-seninf.txt  |   52 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   34 +
>  drivers/media/platform/Makefile                    |    2 +
>  drivers/media/platform/mtk-isp/Kconfig             |   16 +
>  drivers/media/platform/mtk-isp/Makefile            |   14 +
>  drivers/media/platform/mtk-isp/isp_50/Makefile     |   17 +
>  .../media/platform/mtk-isp/isp_50/seninf/Makefile  |    4 +
>  .../platform/mtk-isp/isp_50/seninf/mtk_seninf.c    | 1339 ++++++++++++++++++++
>  .../mtk-isp/isp_50/seninf/seninf_drv_def.h         |  201 +++
>  .../platform/mtk-isp/isp_50/seninf/seninf_reg.h    |  992 +++++++++++++++
>  10 files changed, 2671 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt
>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/seninf_drv_def.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/seninf_reg.h
> 
