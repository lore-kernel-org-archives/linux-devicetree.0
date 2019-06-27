From: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Document MediaTek I3C master
 bindings
Date: Thu, 27 Jun 2019 15:25:27 +0800
Message-ID: <1561620327.12217.27.camel@mhfsdcap03>
References: <1561527388-4829-1-git-send-email-qii.wang@mediatek.com>
         <1561527388-4829-2-git-send-email-qii.wang@mediatek.com>
         <20190626182339.0c6301a2@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626182339.0c6301a2@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: bbrezillon@kernel.org, matthias.bgg@gmail.com, linux-i3c@lists.infradead.org, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, leilk.liu@mediatek.com, liguo.zhang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

On Wed, 2019-06-26 at 18:23 +0200, Boris Brezillon wrote:
> On Wed, 26 Jun 2019 13:36:27 +0800
> Qii Wang <qii.wang@mediatek.com> wrote:
> 
> > Document MediaTek I3C master DT bindings.
> > 
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > ---
> >  .../devicetree/bindings/i3c/mtk,i3c-master.txt     |   47 ++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> > new file mode 100644
> > index 0000000..3fd4f17
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
> > @@ -0,0 +1,47 @@
> > +Bindings for MediaTek I3C master block
> > +=====================================
> > +
> > +Required properties:
> > +--------------------
> > +- compatible: shall be "mediatek,i3c-master"
> > +- reg: physical base address of the controller and apdma base, length of
> > +  memory mapped region.
> > +- reg-names: should be "main" for controller and "dma" for apdma.
> > +- interrupts: interrupt number to the cpu.
> 
> Depending on the interrupt controller, each interrupt cell might
> contain more than just the interrupt number.
> 

ok, I will modify it as "the interrupt line connected to this I3C
master"

> > +- clocks: clock name from clock manager.
> 
> This property does not contain clock names but clk references.
> 

ok, I will modify it as "shall reference the i3c and apdma clocks"

> > +- clock-names: must include "main" and "dma".
> > +
> > +Mandatory properties defined by the generic binding (see
> > +Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> > +
> > +- #address-cells: shall be set to 3
> > +- #size-cells: shall be set to 0
> > +
> > +Optional properties defined by the generic binding (see
> > +Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> > +
> > +- i2c-scl-hz
> > +- i3c-scl-hz
> > +
> > +I3C device connected on the bus follow the generic description (see
> > +Documentation/devicetree/bindings/i3c/i3c.txt for more details).
> > +
> > +Example:
> > +
> > +	i3c0: i3c@1100d000 {
> > +		compatible = "mediatek,i3c-master";
> > +		reg = <0x1100d000 0x100>,
> > +		      <0x11000300 0x80>;
> > +		reg-names = "main", "dma";
> > +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&i3c0_ck>, <&ap_dma_ck>;
> > +		clock-names = "main", "dma";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		i2c-scl-hz = <100000>;
> > +
> > +		nunchuk: nunchuk@52 {
> > +			compatible = "nintendo,nunchuk";
> > +			reg = <0x52 0x80000010 0>;
> 
> reg is wrong here, should be
> 
> 			reg = <0x52 0x0 0x10>;
> 
> While at it, can you send a patch to fix the example in the cadence
> binding doc?
> 

ok, I will do it. Thanks for your review.

> > +		};
> > +	};
> 
