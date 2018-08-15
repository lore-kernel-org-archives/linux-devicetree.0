From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH 2/5] arm64: dts: mt7622: add a bluetooth 5 device node
Date: Wed, 15 Aug 2018 14:54:01 +0800
Message-ID: <1534316041.31978.30.camel@mtkswgap22>
References: <68c4ca0158518d6bf50f2f7becfcb87ff3ce158a.1534130854.git.ryder.lee@mediatek.com>
         <aba82b5c68c840a36b902e7cb7eab4ed4516f003.1534130854.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <aba82b5c68c840a36b902e7cb7eab4ed4516f003.1534130854.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Roy Luo <cheng-hao.luo@mediatek.com>, Weijie Gao <weijie.gao@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-08-15 at 13:18 +0800, Ryder Lee wrote:
> Add a built-in bluetooth 5 support for MT7622.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index b235df7..f8c3495 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -515,6 +515,13 @@
>  		reg-shift = <2>;
>  		reg-io-width = <4>;
>  		status = "disabled";
> +
> +		bluetooth {
> +			compatible = "mediatek,mt7622-bluetooth";
> +			power-domains = <&scpsys MT7622_POWER_DOMAIN_WB>;
> +			clocks = <&clk25m>;
> +			clock-names = "ref";
> +		};
>  	};
>  

Acked-by: Sean Wang <sean.wang@mediatek.com>

>  	nandc: nfi@1100d000 {
