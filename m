From: Ryan Case <ryandcase@chromium.org>
Subject: Re: [PATCH v4, 06/33] dt-bindings: mediatek: add mutex description
 for mt8183 display
Date: Tue, 16 Jul 2019 16:59:23 -0700
Message-ID: <CACjz--k0wVpxWTBXQeUHqm50RgvaCNkNb3DO+KviCOtq-e9gTQ@mail.gmail.com>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com> <1562625253-29254-7-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562625253-29254-7-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yongqiang.niu@mediatek.com
Cc: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 8, 2019 at 3:37 PM <yongqiang.niu@mediatek.com> wrote:
>
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
>
> This patch add mutex description for mt8183 display
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index bb9274a..4a22d49 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -53,6 +53,7 @@ Required properties (all function blocks):
>    For most function blocks this is just a single clock input. Only the DSI and
>    DPI controller nodes have multiple clock inputs. These are documented in
>    mediatek,dsi.txt and mediatek,dpi.txt, respectively.
> +  for MT8183 mutex, this hardware is always free run, has no clocks control

This should have capitalization, punctuation, and drop the trailing space.

It also reads a little strangely. You may want something like "An
exception is that the mt8183 mutex is always free running with no
clocks property."

>
>  Required properties (DMA function blocks):
>  - compatible: Should be one of
> --
> 1.8.1.1.dirty
>
