From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v8 2/2] arm64: dts: mt8173: Add nor flash node
Date: Wed, 25 Nov 2015 11:50:28 +0100
Message-ID: <56559274.1090900@gmail.com>
References: <1447817403-16631-1-git-send-email-bayi.cheng@mediatek.com>
 <1447817403-16631-3-git-send-email-bayi.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447817403-16631-3-git-send-email-bayi.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bayi Cheng <bayi.cheng@mediatek.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com, jteki@openedev.com, ezequiel@vanguardiasur.com.ar
List-Id: devicetree@vger.kernel.org



On 18/11/15 04:30, Bayi Cheng wrote:
> Add Mediatek nor flash node
>
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
>

Applied to v4.5-next/dts

Thanks.
Matthias

> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 4dd5f93..7988656 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -387,7 +387,23 @@
>   			status = "disabled";
>   		};
>
> -		i2c3: i2c@11010000 {
> +		nor_flash: spi@1100d000 {
> +			compatible = "mediatek,mt8173-nor";
> +			reg = <0 0x1100d000 0 0xe0>;
> +			clocks = <&pericfg CLK_PERI_SPI>,
> +				 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +			clock-names = "spi", "sf";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +
> +			flash@0 {
> +				compatible = "jedec,spi-nor";
> +				reg = <0>;
> +			};
> +		};
> +
> +		i2c3: i2c3@11010000 {
>   			compatible = "mediatek,mt8173-i2c";
>   			reg = <0 0x11010000 0 0x70>,
>   			      <0 0x11000280 0 0x80>;
>
