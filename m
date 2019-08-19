From: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [RFC V2 08/11] dt-bindings: interconnect: add MT8183
 interconnect dt-bindings
Date: Mon, 19 Aug 2019 09:39:54 +0800
Message-ID: <1566178794.6371.8.camel@mtksdaap41>
References: <1556614265-12745-1-git-send-email-henryc.chen@mediatek.com>
         <1556614265-12745-9-git-send-email-henryc.chen@mediatek.com>
         <20190501202753.GA2862@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501202753.GA2862@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Nicolas Boichat <drinkcat@google.com>, Fan Chen <fan.chen@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Sorry for late reply.

On Wed, 2019-05-01 at 15:27 -0500, Rob Herring wrote:
> On Tue, Apr 30, 2019 at 04:51:02PM +0800, Henry Chen wrote:
> > Add interconnect provider dt-bindings for MT8183.
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > ---
> >  .../bindings/interconnect/mtk,mt8183.txt           | 24 ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interconnect/mtk,mt8183.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/interconnect/mtk,mt8183.txt b/Documentation/devicetree/bindings/interconnect/mtk,mt8183.txt
> > new file mode 100644
> > index 0000000..1cf1841
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interconnect/mtk,mt8183.txt
> > @@ -0,0 +1,24 @@
> > +Mediatek MT8183 interconnect binding
> 
> This should be part of the dvfsrc binding.
ok, will add these into dvfsrc binding.
> 
> > +
> > +MT8183 interconnect providers support dram bandwidth requirements. The provider
> > +is able to communicate with the DVFSRC and send the dram bandwidth to it.
> > +Provider nodes must reside within an DVFSRC device node.
> > +
> > +Required properties :
> > +- compatible : shall contain only one of the following:
> > +			"mediatek,mt8183-emi-icc"
> > +- #interconnect-cells : should contain 1
> > +
> > +Examples:
> > +
> > +dvfsrc@10012000 {
> > +	compatible = "mediatek,mt8183-dvfsrc";
> > +	reg = <0 0x10012000 0 0x1000>;
> > +	clocks = <&infracfg CLK_INFRA_DVFSRC>;
> > +	clock-names = "dvfsrc";
> > +	ddr_emi: interconnect {
> > +		compatible = "mediatek,mt8183-emi-icc";
> > +		#interconnect-cells = <1>;
> 
> No need for a child node here. Just move #interconnect-cells to the 
> parent.
Ihave tried and it cannot work if move "#interconnect-cells" to the
parent.
The provider nodes must reside within an DVFSRC device node.
> 
> Rob
