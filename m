From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 1/2] Documentation: bindings: add dt documentation for Rockchip PCIe PHY
Date: Thu, 16 Jun 2016 21:38:46 +0200
Message-ID: <5940136.iEYIQnlD9F@diego>
References: <1465865072-25833-1-git-send-email-shawn.lin@rock-chips.com> <CAD=FV=Ubm8goQ4J=T11mWmAZrP+J7YYWdxACGjAhdsONyzPdKQ@mail.gmail.com> <20160616184632.GA1112@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160616184632.GA1112@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Wenrui Li <wenrui.li@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 16. Juni 2016, 13:46:32 schrieb Rob Herring:
> On Tue, Jun 14, 2016 at 10:27:46AM -0700, Doug Anderson wrote:
> > Hi,
> > 
> > On Mon, Jun 13, 2016 at 5:44 PM, Shawn Lin <shawn.lin@rock-chips.com> 
wrote:
> > > This patch adds a binding that describes the Rockchip PCIe PHY
> > > found on Rockchip SoCs PCIe interface.
> > > 
> > > Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> > > 
> > > ---
> > > 
> > > Changes in v2:
> > > - add clk and reset description
> > > - remove unit-address
> > > 
> > >  .../devicetree/bindings/phy/rockchip-pcie-phy.txt  | 32
> > >  ++++++++++++++++++++++ 1 file changed, 32 insertions(+)
> > >  create mode 100644
> > >  Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt> > 
> > > diff --git a/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
> > > b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt new file
> > > mode 100644
> > > index 0000000..ad55c67
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
> > > @@ -0,0 +1,32 @@
> > > +Rockchip PCIE PHY
> > > +-----------------------
> > > +
> > > +Required properties:
> > > + - compatible: rockchip,rk3399-pcie-phy
> > > + - #phy-cells: must be 0
> > > + - clocks: Must contain an entry in clock-names.
> > > +       See ../clocks/clock-bindings.txt for details.
> > > + - clock-names: Must be "refclk"
> > > + - resets: Must contain an entry in reset-names.
> > > +       See ../reset/reset.txt for details.
> > > + - reset-names: Must be "phy"
> > > +
> > > +Example:
> > > +
> > > +grf: syscon@ff770000 {
> > > +       compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
> > > +       #address-cells = <1>;
> > > +       #size-cells = <1>;
> > > +
> > > +       ...
> > > +
> > > +       pcie-phy: phy {
> > 
> > Just calling this node "phy" isn't a good idea.  There will be
> > multiple PHYs under the GRF and they can't all have a subnode named
> > "phy".
> 
> There's no register range that can be associated with the phy?

The pcie phy control bits are sitting in a general (and shared) soc-control 
register inside the "General Register Files" (shared for example with some i2s 
control bits). As written in a previous version of this binding, my feeling is 
that a register range suggests some sort of exclusivity of the area (like the 
rk3399 emmc phy occupying a real subset of GRF area), but the pcie phy doesn't
have this.
