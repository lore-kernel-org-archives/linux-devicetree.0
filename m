From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3 1/3] usb: xhci-mtk: add generic compatible string
Date: Fri, 1 Sep 2017 13:00:03 +0300
Message-ID: <59A92FA3.5090105@linux.intel.com>
References: <33fa448238c0d95f0cfd6c2be3bd5c4e657a0cd4.1504092763.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <33fa448238c0d95f0cfd6c2be3bd5c4e657a0cd4.1504092763.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 30.08.2017 14:34, Chunfeng Yun wrote:
> The xhci-mtk driver is a generic driver for MediaTek xHCI IP, add
> a generic compatible to avoid confusion when support new SoCs but
> use a compatible with specific SoC's name "mt8173".
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk.c |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 67d5dc7..8fb6065 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -795,6 +795,7 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
>   #ifdef CONFIG_OF
>   static const struct of_device_id mtk_xhci_of_match[] = {
>   	{ .compatible = "mediatek,mt8173-xhci"},
> +	{ .compatible = "mediatek,mtk-xhci"},
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, mtk_xhci_of_match);
>

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
