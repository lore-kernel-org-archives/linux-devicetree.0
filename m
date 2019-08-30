From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 02/11] dt-bindings: phy-mtk-tphy: make the ref clock
 optional
Date: Fri, 30 Aug 2019 14:22:29 +0800
Message-ID: <1567146149.7317.40.camel@mhfsdcap03>
References: <e99c0d7a55869a4425250c601b80a3331c9d0976.1566542696.git.chunfeng.yun@mediatek.com>
 <a31d78484b64f853a16e7dcb16fae9fc0de45ebb.1566542696.git.chunfeng.yun@mediatek.com>
 <20190829192550.GA29881@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190829192550.GA29881@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2019-08-29 at 14:25 -0500, Rob Herring wrote:
> On Fri, Aug 23, 2019 at 03:00:09PM +0800, Chunfeng Yun wrote:
> > Make the ref clock optional, then we no need refer to a fixed-clock
> > in DTS anymore when the clock of USB3 PHY comes from oscillator
> > directly
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  .../devicetree/bindings/phy/phy-mtk-tphy.txt        | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> > index d5b327f85fa2..1c18bf10b2fe 100644
> > --- a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> > +++ b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> > @@ -34,12 +34,6 @@ Optional properties (controller (parent) node):
> >  
> >  Required properties (port (child) node):
> >  - reg		: address and length of the register set for the port.
> > -- clocks	: a list of phandle + clock-specifier pairs, one for each
> > -		  entry in clock-names
> > -- clock-names	: must contain
> > -		  "ref": 48M reference clock for HighSpeed analog phy; and 26M
> > -			reference clock for SuperSpeed analog phy, sometimes is
> > -			24M, 25M or 27M, depended on platform.
> >  - #phy-cells	: should be 1 (See second example)
> >  		  cell after port phandle is phy type from:
> >  			- PHY_TYPE_USB2
> > @@ -48,6 +42,13 @@ Required properties (port (child) node):
> >  			- PHY_TYPE_SATA
> >  
> >  Optional properties (PHY_TYPE_USB2 port (child) node):
> > +- clocks	: a list of phandle + clock-specifier pairs, one for each
> > +		  entry in clock-names
> > +- clock-names	: may contain
> > +		  "ref": 48M reference clock for HighSpeed anolog phy; and 26M
> > +			reference clock for SuperSpeed anolog phy, sometimes is
> > +			24M, 25M or 27M, depended on platform.
> 
> How do you know the frequency when it is not present?
It's always present, but sometimes it's always on by default (e.g. 48Mhz
of U2 PHY), or comes from oscillator directly  (e.g. 26Mhz of U3 PHY),
so not controlled by CCF, of course we can use a fixed-clock in latter
case, it's useful to make it optional for these two cases.

Thanks

> 
> > +
> >  - mediatek,eye-src	: u32, the value of slew rate calibrate
> >  - mediatek,eye-vrt	: u32, the selection of VRT reference voltage
> >  - mediatek,eye-term	: u32, the selection of HS_TX TERM reference voltage
> > -- 
> > 2.23.0
> > 
