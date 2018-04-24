From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: clock: mediatek: add g3dsys bindings
Date: Tue, 24 Apr 2018 23:45:38 +0800
Message-ID: <1524584738.12322.17.camel@mtkswgap22>
References: <cover.1524044917.git.sean.wang@mediatek.com>
         <4b5d243d33433f83874359794b796d4228574714.1524044917.git.sean.wang@mediatek.com>
         <20180424143907.eewrpzdmkhhux3lb@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424143907.eewrpzdmkhhux3lb@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-04-24 at 09:39 -0500, Rob Herring wrote:
> On Wed, Apr 18, 2018 at 06:24:54PM +0800, sean.wang@mediatek.com wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > Add bindings to g3dsys providing necessary clock and reset control to
> > Mali-450.
> > 
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,g3dsys.txt      | 30 ++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
> > new file mode 100644
> > index 0000000..ff2d70c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
> > @@ -0,0 +1,30 @@
> > +MediaTek g3dsys controller
> > +============================
> > +
> > +The MediaTek g3dsys controller provides various clocks and reset controller to
> > +the GPU.
> > +
> > +Required Properties:
> > +
> > +- compatible: Should be:
> > +	- "mediatek,mt2701-g3dsys", "syscon":
> > +		for MT2701 SoC
> > +	- "mediatek,mt7623-ethsys", "mediatek,mt2701-g3dsys", "syscon":
> > +		for MT7623 SoC
> 
> ethsys?
> 

thanks! I'll also fix it up in the next version.

> > +- #clock-cells: Must be 1
> > +- #reset-cells: Must be 1
> > +
> > +The ethsys controller uses the common clk binding from
> > +Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +The available clocks are defined in dt-bindings/clock/mt*-clk.h.
> > +
> > +Example:
> > +
> > +g3dsys: clock-controller@13000000 {
> > +	compatible = "mediatek,mt7623-g3dsys",
> > +		     "mediatek,mt2701-g3dsys",
> > +		     "syscon";
> > +	reg = <0 0x13000000 0 0x200>;
> > +	#clock-cells = <1>;
> > +	#reset-cells = <1>;
> > +};
> > -- 
> > 2.7.4
> > 
