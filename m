From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: mediatek: add support for mt6779
 reference board
Date: Fri, 23 Aug 2019 17:50:27 +0200
Message-ID: <9f3daf61-eb8b-28c9-e3ce-08b9ca61166b@gmail.com>
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com>
 <1566206502-4347-2-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566206502-4347-2-git-send-email-mars.cheng@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 19/08/2019 11:21, Mars Cheng wrote:
> Update binding document for mt6779 reference board
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied thanks!

> ---
>  .../devicetree/bindings/arm/mediatek.yaml          |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index a4ad2eb..4043c50 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -48,6 +48,10 @@ properties:
>            - const: mediatek,mt6765
>        - items:
>            - enum:
> +              - mediatek,mt6779-evb
> +          - const: mediatek,mt6779
> +      - items:
> +          - enum:
>                - mediatek,mt6795-evb
>            - const: mediatek,mt6795
>        - items:
> 
