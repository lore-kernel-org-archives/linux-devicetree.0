From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: arm: mediatek: document clk bindings for
 MT7629
Date: Mon, 12 Nov 2018 17:37:10 -0600
Message-ID: <5bea0ea8.1c69fb81.144ae.8670@mx.google.com>
References: <815e38d4d74689980cd73c86d9e80fd5854cfc94.1541143168.git.ryder.lee@mediatek.com>
 <b947cd11a6b13a7a160bbb6af42261bf50bffe28.1541143168.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b947cd11a6b13a7a160bbb6af42261bf50bffe28.1541143168.git.ryder.lee@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Stephen Boyd <sboyd@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, linux-kernel@vger.kernel.org, Roy Luo <cheng-hao.luo@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 5 Nov 2018 16:43:56 +0800, Ryder Lee wrote:
> This patch adds the binding documentation for apmixedsys, infracfg,
> pciesys, pericfg, topckgen, ethsys, sgmiisys and ssusbsys for MT7629.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt | 1 +
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt     | 1 +
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt   | 1 +
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt    | 1 +
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt    | 1 +
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt   | 1 +
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt   | 1 +
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt   | 1 +
>  8 files changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
