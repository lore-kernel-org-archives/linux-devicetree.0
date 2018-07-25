From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v23 1/4] dt-bindings: soc: Add documentation for the
 MediaTek GCE unit
Date: Wed, 25 Jul 2018 08:47:16 -0600
Message-ID: <20180725144716.GA29676@rob-hp-laptop>
References: <1532482002-11164-1-git-send-email-houlong.wei@mediatek.com>
 <1532482002-11164-2-git-send-email-houlong.wei@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532482002-11164-2-git-send-email-houlong.wei@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Houlong Wei <houlong.wei@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK HU <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Monica Wang <monica.wang@mediatek.com>, HS Liao <hs.liao@mediatek.com>, ginny.chen@m
List-Id: devicetree@vger.kernel.org

On Wed, Jul 25, 2018 at 09:26:39AM +0800, Houlong Wei wrote:
> This adds documentation for the MediaTek Global Command Engine (GCE) unit
> found in MT8173 SoCs.
> 
> Signed-off-by: Houlong Wei <houlong.wei@mediatek.com>
> Signed-off-by: HS Liao <hs.liao@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mtk-gce.txt        |   57 ++++++++++++++++++++
>  include/dt-bindings/gce/mt8173-gce.h               |   44 +++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt
>  create mode 100644 include/dt-bindings/gce/mt8173-gce.h

Reviewed-by: Rob Herring <robh@kernel.org>
