From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/10] dt-binding: gce: add gce header file for mt8183
Date: Mon, 25 Feb 2019 08:39:42 -0600
Message-ID: <20190225143942.GA13388@bogus>
References: <1548747128-60136-1-git-send-email-bibby.hsieh@mediatek.com>
 <1548747128-60136-3-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548747128-60136-3-git-send-email-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, CK HU <ck.hu@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediat
List-Id: devicetree@vger.kernel.org

On Tue, 29 Jan 2019 15:31:59 +0800, Bibby Hsieh wrote:
> Add documentation for the mt8183 gce.
> 
> Add gce header file defined the gce hardware event,
> subsys number and constant for mt8183.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mtk-gce.txt        |   6 +-
>  include/dt-bindings/gce/mt8183-gce.h               | 177 +++++++++++++++++++++
>  2 files changed, 180 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/gce/mt8183-gce.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
