From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/11] dt-bindings: phy-mtk-tphy: add two optional
 properties for u2phy
Date: Thu, 29 Aug 2019 14:23:41 -0500
Message-ID: <20190829192341.GA26293@bogus>
References: <e99c0d7a55869a4425250c601b80a3331c9d0976.1566542696.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e99c0d7a55869a4425250c601b80a3331c9d0976.1566542696.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 23, 2019 at 03:00:08PM +0800, Chunfeng Yun wrote:
> Add two optional properties, one for J-K test, another for disconnect
> threshold, both of them can be used to debug disconnection issues.

Testing and debug properties aren't really things that belong in DT.

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> index a5f7a4f0dbc1..d5b327f85fa2 100644
> --- a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> +++ b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> @@ -52,6 +52,8 @@ Optional properties (PHY_TYPE_USB2 port (child) node):
>  - mediatek,eye-vrt	: u32, the selection of VRT reference voltage
>  - mediatek,eye-term	: u32, the selection of HS_TX TERM reference voltage
>  - mediatek,bc12	: bool, enable BC12 of u2phy if support it
> +- mediatek,discth	: u32, the voltage of disconnect threshold
> +- mediatek,intr	: u32, the value of internal R (resistance)

These need units as defined in property-units.txt.

>  
>  Example:
>  
> -- 
> 2.23.0
> 
