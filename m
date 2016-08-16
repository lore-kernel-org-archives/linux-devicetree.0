From: Horng-Shyang Liao <hs.liao@mediatek.com>
Subject: Re: [PATCH v12 2/4] CMDQ: Mediatek CMDQ driver
Date: Tue, 16 Aug 2016 16:20:27 +0800
Message-ID: <1471335627.22752.4.camel@mtksdaap41>
References: <1470645093-13309-1-git-send-email-hs.liao@mediatek.com>
	 <1470645093-13309-3-git-send-email-hs.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470645093-13309-3-git-send-email-hs.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK HU <ck.hu@mediatek.com>, cawa cheng <cawa.cheng@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Damon Chu <damon.chu@mediatek.com>, Josh-YC Liu <josh-yc.liu@mediatek.com>, Glory Hung <glory.hung@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Monica Wang <monica.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi Matthias,

Sorry to disturb you.
Do you have any further comment on CMDQ v12?

Thanks.
HS

On Mon, 2016-08-08 at 16:31 +0800, HS Liao wrote:
> This patch is first version of Mediatek Command Queue(CMDQ) driver. The
> CMDQ is used to help write registers with critical time limitation,
> such as updating display configuration during the vblank. It controls
> Global Command Engine (GCE) hardware to achieve this requirement.
> Currently, CMDQ only supports display related hardwares, but we expect
> it can be extended to other hardwares for future requirements.
> 
> Signed-off-by: HS Liao <hs.liao@mediatek.com>
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> ---
>  drivers/soc/mediatek/Kconfig    |  11 +
>  drivers/soc/mediatek/Makefile   |   1 +
>  drivers/soc/mediatek/mtk-cmdq.c | 948 ++++++++++++++++++++++++++++++++++++++++
>  include/soc/mediatek/cmdq.h     | 179 ++++++++
>  4 files changed, 1139 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mtk-cmdq.c
>  create mode 100644 include/soc/mediatek/cmdq.h
> 
[...]
