From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v11 03/12] dt-binding: gce: add binding for gce client
 reg property
Date: Fri, 16 Aug 2019 17:06:15 -0500
Message-ID: <20190816220615.GA25142@bogus>
References: <20190729070106.9332-1-bibby.hsieh@mediatek.com>
 <20190729070106.9332-4-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190729070106.9332-4-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, CK HU <ck.hu@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, Bibby Hsieh <bibby.hsieh@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Mon, 29 Jul 2019 15:00:57 +0800, Bibby Hsieh wrote:
> cmdq driver provide a function that get the relationship
> of sub system number from device node for client.
> add specification for #subsys-cells, mediatek,gce-client-reg.
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mtk-gce.txt      | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
