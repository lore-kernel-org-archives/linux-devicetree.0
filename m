From: houlong wei <houlong.wei@mediatek.com>
Subject: Re: [PATCH v23 3/4] arm64: dts: mt8173: Add GCE node
Date: Wed, 15 Aug 2018 09:48:14 +0800
Message-ID: <1534297694.21668.5.camel@mhfsdcap03>
References: <1532482002-11164-1-git-send-email-houlong.wei@mediatek.com>
         <1532482002-11164-4-git-send-email-houlong.wei@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532482002-11164-4-git-send-email-houlong.wei@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, JassiBrar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>, Bibby Hsieh =?UTF-8?Q?=28=E8=AC=9D=E6=BF=9F=E9=8
List-Id: devicetree@vger.kernel.org

On Wed, 2018-07-25 at 09:26 +0800, Houlong Wei wrote:
> This patch adds the device node of the GCE hardware for CMDQ module.
> 
> Signed-off-by: Houlong Wei <houlong.wei@mediatek.com>
> Signed-off-by: HS Liao <hs.liao@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 94597e3..97b1ec6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -18,6 +18,7 @@
>  #include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/power/mt8173-power.h>
>  #include <dt-bindings/reset/mt8173-resets.h>
> +#include <dt-bindings/gce/mt8173-gce.h>
>  #include "mt8173-pinfunc.h"
>  
>  / {
> @@ -519,6 +520,15 @@
>  			status = "disabled";
>  		};
>  
> +		gce: mailbox@10212000 {
> +			compatible = "mediatek,mt8173-gce";
> +			reg = <0 0x10212000 0 0x1000>;
> +			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&infracfg CLK_INFRA_GCE>;
> +			clock-names = "gce";
> +			#mbox-cells = <3>;
> +		};
> +
>  		mipi_tx0: mipi-dphy@10215000 {
>  			compatible = "mediatek,mt8173-mipi-tx";
>  			reg = <0 0x10215000 0 0x1000>;

Hi Matthias,
  Could you please review this patch when you are available? Thanks a
lot.
