From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-binding: mediatek: Add binding document for
 MediaTek GMAC
Date: Mon, 24 Sep 2018 14:07:36 -0700
Message-ID: <5baa1aea.1c69fb81.cc7c6.3408@mx.google.com>
References: <1537165763-13112-1-git-send-email-biao.huang@mediatek.com>
 <1537165763-13112-2-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1537165763-13112-2-git-send-email-biao.huang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, nelson.chang@mediatek.com, netdev@vger.kernel.org, sean.wang@mediatek.com, liguo.zhang@mediatek.com, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, honghui.zhang@mediatek.com, yt.shen@mediatek.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 17, 2018 at 02:29:22PM +0800, Biao Huang wrote:
> The commit adds the device tree binding documentation for the MediaTek
> GMAC found on Mediatek MT2712.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../devicetree/bindings/net/mediatek-gmac.txt      |   45 ++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-gmac.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-gmac.txt b/Documentation/devicetree/bindings/net/mediatek-gmac.txt
> new file mode 100644
> index 0000000..14876ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/mediatek-gmac.txt
> @@ -0,0 +1,45 @@
> +MediaTek Gigabit Ethernet controller
> +=========================================
> +
> +The gigabit ethernet controller can be found on MediaTek SoCs.
> +
> +* Ethernet controller node
> +
> +Required properties:
> +- compatible: Should be
> +	"mediatek,mt2712-eth": for MT2712 SoC
> +- reg: Address and length of the register set for the device
> +- interrupts: Should contain the MAC interrupts
> +- interrupt-names: the name of interrupt in the interrupts property. These are
> +	"macirq": For MT2712 SoC

Not really necessary to have interrupt-names when there is only 1 irq.

> +- clocks: the clock used by the controller
> +- clock-names: the names of the clock listed in the clocks property. These are
> +	"axi", "apb", "mac_ext", "ptp", "ptp_parent", "ptp_top": For MT2712 SoC
> +- mac-address: See ethernet.txt in the same directory
> +- power-domains: phandle to the power domain that the ethernet is part of
> +- phy-mode: See ethernet.txt file in the same directory.
> +- reset-gpio: gpio number for phy reset.

reset-gpios

> +
> +Example:
> +
> +eth: eth@1101c000 {
> +		compatible = "mediatek,mt2712-eth";
> +		reg = <0 0x1101c000 0 0x1200>;
> +		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "macirq";
> +		phy-mode ="rgmii";
> +		mac-address = [00 55 7b b5 7d f7];
> +		clock-names = "axi",
> +			      "apb",
> +			      "mac_ext",
> +			      "ptp",
> +			      "ptp_parent",
> +			      "ptp_top";
> +		clocks = <&pericfg CLK_PERI_GMAC>,
> +			 <&pericfg CLK_PERI_GMAC_PCLK>,
> +			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> +			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> +			 <&topckgen CLK_TOP_APLL1_D3>,
> +			 <&topckgen CLK_TOP_APLL1>;
> +		reset-gpio = <&pio 87 GPIO_ACTIVE_HIGH>;
> +	};
> -- 
> 1.7.9.5
> 
