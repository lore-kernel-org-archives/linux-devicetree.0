From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 05/11] dt-bindings: phy-mtk-tphy: add the properties
 about address mapping
Date: Thu, 29 Aug 2019 15:16:27 -0500
Message-ID: <20190829201627.GA24612@bogus>
References: <e99c0d7a55869a4425250c601b80a3331c9d0976.1566542696.git.chunfeng.yun@mediatek.com>
 <8ce6da3118b80556f9576c5ac331312be07d8e29.1566542697.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8ce6da3118b80556f9576c5ac331312be07d8e29.1566542697.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 23 Aug 2019 15:00:12 +0800, Chunfeng Yun wrote:
> Add three required properties about the address mapping, including
> '#address-cells', '#size-cells' and 'ranges'
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
