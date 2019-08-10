From: houlong wei <houlong.wei@mediatek.com>
Subject: Re: [PATCH v11 12/12] arm64: dts: add gce node for mt8183
Date: Sun, 11 Aug 2019 00:25:09 +0800
Message-ID: <1565454309.19079.27.camel@mhfsdcap03>
References: <20190729070106.9332-1-bibby.hsieh@mediatek.com>
         <20190729070106.9332-13-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729070106.9332-13-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT
List-Id: devicetree@vger.kernel.org

On Mon, 2019-07-29 at 15:01 +0800, Bibby Hsieh wrote:
> add gce device node for mt8183
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 08274bfcebd8..98d17d0bdebf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/mt8183-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gce/mt8183-gce.h>
>  
>  / {
>  	compatible = "mediatek,mt8183";
> @@ -212,6 +213,15 @@
>  			clock-names = "spi", "wrap";
>  		};
>  
> +		gce: gce@10238000 {

Use mailbox@ instead of gce@, Rob suggested in
https://patchwork.kernel.org/patch/10491213/


> +			compatible = "mediatek,mt8183-gce";
> +			reg = <0 0x10238000 0 0x4000>;
> +			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
> +			#mbox-cells = <3>;
> +			clocks = <&infracfg CLK_INFRA_GCE>;
> +			clock-names = "gce";
> +		};
> +
>  		uart0: serial@11002000 {
>  			compatible = "mediatek,mt8183-uart",
>  				     "mediatek,mt6577-uart";
