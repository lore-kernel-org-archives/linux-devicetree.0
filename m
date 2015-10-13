From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: mt8173: Add nor flash node
Date: Tue, 13 Oct 2015 17:33:38 +0300
Message-ID: <561D1642.3070105@cogentembedded.com>
References: <1444729160-26433-1-git-send-email-bayi.cheng@mediatek.com>
 <1444729160-26433-4-git-send-email-bayi.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444729160-26433-4-git-send-email-bayi.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bayi Cheng <bayi.cheng@mediatek.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 10/13/2015 12:39 PM, Bayi Cheng wrote:

> Add Mediatek nor flash node
>
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index d18ee42..385c2e4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -365,6 +365,21 @@
>   			status = "disabled";
>   		};
>
> +		nor_flash: spi@1100d000 {

    I don't think this is a good label name for a SPI controller.

> +			compatible = "mediatek,mt8173-nor";
> +			reg = <0 0x1100d000 0 0xe0>;
> +			clocks = <&pericfg CLK_PERI_SPI>,
> +				 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +			clock-names = "spi", "sf";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			flash@0 {
> +				compatible = "jedec,spi-nor";
> +				reg = <0>;
> +			};
> +		};
> +
>   		i2c3: i2c3@11010000 {

    Grr, the name should be "i2c@11010000".

[...]

MBR, Sergei
