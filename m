From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: phy-mtk-tphy: add properties for U2
 slew rate calibrate
Date: Sun, 18 Mar 2018 07:48:38 -0500
Message-ID: <20180318124838.ruakamqywz4jd6jz@rob-hp-laptop>
References: <c9679bc6e969ebf0f97a01c6d1aff3bbc0e8e4f7.1520832210.git.chunfeng.yun@mediatek.com>
 <94a7d3b1240297cd0cac82df52954d0a53d50d36.1520832210.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <94a7d3b1240297cd0cac82df52954d0a53d50d36.1520832210.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ryder Lee <ryder.lee@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 12, 2018 at 01:25:40PM +0800, Chunfeng Yun wrote:
> Add two properties of ref_clk and coefficient used by U2 slew rate
> calibrate which may vary on different SoCs
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> index 41e09ed..0d34b2b 100644
> --- a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> +++ b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> @@ -27,6 +27,10 @@ Optional properties (controller (parent) node):
>   - reg		: offset and length of register shared by multiple ports,
>  		  exclude port's private register. It is needed on mt2701
>  		  and mt8173, but not on mt2712.
> + - mediatek,src-ref-clk-mhz	: frequency of reference clock for slew rate
> +		  calibrate
> + - mediatek,src-coef	: coefficient for slew rate calibrate, depends on
> +		  SoC process

What are valid values? This is one cell?

>  
>  Required properties (port (child) node):
>  - reg		: address and length of the register set for the port.
> -- 
> 1.9.1
> 
