From: Horng-Shyang Liao <hs.liao@mediatek.com>
Subject: Re: [PATCH v20 0/4] Mediatek MT8173 CMDQ support
Date: Fri, 13 Jan 2017 09:27:06 +0800
Message-ID: <1484270826.14822.1.camel@mtksdaap41>
References: <1483499169-16329-1-git-send-email-hs.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483499169-16329-1-git-send-email-hs.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK HU <ck.hu@mediatek.com>, cawa cheng <cawa.cheng@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Damon Chu <damon.chu@mediatek.com>, Josh-YC Liu <josh-yc.liu@mediatek.com>, Glory Hung <glory.hung@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@media>
List-Id: devicetree@vger.kernel.org

On Wed, 2017-01-04 at 11:06 +0800, HS Liao wrote:
> Hi,
> 
> This is Mediatek MT8173 Command Queue(CMDQ) driver. The CMDQ is used
> to help write registers with critical time limitation, such as
> updating display configuration during the vblank. It controls Global
> Command Engine (GCE) hardware to achieve this requirement.
> 
> These patches have a build dependency on top of v4.10-rc2.
> 
> Changes since v19:
>  - rebase to v4.10-rc2
> 
> Best regards,
> HS Liao
> 
> HS Liao (4):
>   dt-bindings: soc: Add documentation for the MediaTek GCE unit
>   mailbox: mediatek: Add Mediatek CMDQ driver
>   arm64: dts: mt8173: Add GCE node
>   soc: mediatek: Add Mediatek CMDQ helper
> 
>  .../devicetree/bindings/mailbox/mtk-gce.txt        |  43 ++
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  10 +
>  drivers/mailbox/Kconfig                            |  10 +
>  drivers/mailbox/Makefile                           |   2 +
>  drivers/mailbox/mtk-cmdq-mailbox.c                 | 596 +++++++++++++++++++++
>  drivers/soc/mediatek/Kconfig                       |  12 +
>  drivers/soc/mediatek/Makefile                      |   1 +
>  drivers/soc/mediatek/mtk-cmdq-helper.c             | 310 +++++++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h           |  75 +++
>  include/linux/soc/mediatek/mtk-cmdq.h              | 174 ++++++
>  10 files changed, 1233 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt
>  create mode 100644 drivers/mailbox/mtk-cmdq-mailbox.c
>  create mode 100644 drivers/soc/mediatek/mtk-cmdq-helper.c
>  create mode 100644 include/linux/mailbox/mtk-cmdq-mailbox.h
>  create mode 100644 include/linux/soc/mediatek/mtk-cmdq.h
> 

Hi Jassi, Matthias,

Sorry to disturb you.
Do you have any further comments on CMDQ v20?

Thanks.
HS
