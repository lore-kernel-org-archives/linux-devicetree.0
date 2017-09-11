From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: mt8173-xhci: add generic compatible
 and rename file
Date: Mon, 11 Sep 2017 15:57:08 -0500
Message-ID: <20170911205708.jh2y74asqvffgy4g@rob-hp-laptop>
References: <33fa448238c0d95f0cfd6c2be3bd5c4e657a0cd4.1504092763.git.chunfeng.yun@mediatek.com>
 <0ef0bfd4f2544e57c7bdaea518c3fc75ae40b74f.1504092763.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0ef0bfd4f2544e57c7bdaea518c3fc75ae40b74f.1504092763.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 30, 2017 at 07:34:10PM +0800, Chunfeng Yun wrote:
> The mt8173-xhci.txt actually holds the bindings for all mediatek
> SoCs with xHCI controller, so add a generic compatible and change
> the name to mediatek,mtk-xhci.txt to reflect that.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../usb/{mt8173-xhci.txt => mediatek,mtk-xhci.txt} |   14 +++++++++++---
>  .../devicetree/bindings/usb/mt8173-mtu3.txt        |    2 +-
>  2 files changed, 12 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/usb/{mt8173-xhci.txt => mediatek,mtk-xhci.txt} (85%)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
