From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: bindings: add dt documentation for Rockchip PCIe PHY
Date: Wed, 08 Jun 2016 22:40:19 +0200
Message-ID: <1524911.R4OXTTYFIK@diego>
References: <1465370708-23619-1-git-send-email-shawn.lin@rock-chips.com> <20160608202900.GA25662@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160608202900.GA25662@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 8. Juni 2016, 15:29:00 schrieb Rob Herring:
> gOn Wed, Jun 08, 2016 at 03:25:08PM +0800, Shawn Lin wrote:
> > This patch adds a binding that describes the Rockchip PCIe PHY
> > found on Rockchip SoCs PCIe interface.
> > 
> > Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > ---
> > 
> >  .../devicetree/bindings/phy/rockchip-pcie-phy.txt  | 22
> >  ++++++++++++++++++++++ 1 file changed, 22 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt> 
> > diff --git a/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
> > b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt new file
> > mode 100644
> > index 0000000..ba8c406
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
> > @@ -0,0 +1,22 @@
> > +Rockchip PCIE PHY
> > +-----------------------
> > +
> > +Required properties:
> > + - compatible: rockchip,rk3399-pcie-phy
> > + - #phy-cells: must be 0
> > +
> > +Example:
> > +
> > +grf: syscon@ff770000 {
> > +	compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +
> > +	...
> > +
> > +	pcie_phy: phy@e220 {
> 
> unit-address needs a reg property or drop the unit address. I'd do the
> former if there's a register range you can describe here.

Hmm, I think I'd suggest going the other way - call the node pcie-phy .

While the General Register Files do contain some specific address ranges (like 
for the emmc phy, or some performance monitor things), the register at 0xe220 
is a shared register (GRF_SOC_CON8), containing both i2s and pcie setting 
bits.

Specifying register ranges suggests some form of exclusivity to me - which is 
just great for things like the emmc phy that has an actual range, but for a 
device being controlled from some shared register.


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
