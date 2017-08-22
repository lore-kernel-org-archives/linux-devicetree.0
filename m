From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] usb: xhci-mtk: add generic compatible string
Date: Wed, 23 Aug 2017 07:14:33 +0800
Message-ID: <1503443673.17567.8.camel@mhfsdcap03>
References: <670f9ce1ecaec5859006b6f02b45cfc72c3cca2c.1502854628.git.chunfeng.yun@mediatek.com>
         <33fa448238c0d95f0cfd6c2be3bd5c4e657a0cd4.1502854628.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <33fa448238c0d95f0cfd6c2be3bd5c4e657a0cd4.1502854628.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Mathias

On Wed, 2017-08-16 at 14:08 +0800, Chunfeng Yun wrote:
> The xhci-mtk driver is a generic driver for MediaTek xHCI IP, add
> a generic compatible to avoid confusion when support new SoCs but
> use a compatible with specific SoC's name "mt8173".
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/usb/host/xhci-mtk.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 67d5dc7..8fb6065 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -795,6 +795,7 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
>  #ifdef CONFIG_OF
>  static const struct of_device_id mtk_xhci_of_match[] = {
>  	{ .compatible = "mediatek,mt8173-xhci"},
> +	{ .compatible = "mediatek,mtk-xhci"},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, mtk_xhci_of_match);

Do you have any comment about this patch?
Thanks.



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
