From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/4] phy: rockchip-usb: use rockchip_usb_phy_reset to reset phy during wakeup
Date: Mon, 22 Aug 2016 15:00:42 +0200
Message-ID: <2546474.rLYzuqPxCa@diego>
References: <7ca3b54d-e9d8-a137-79b6-d24f0b7065c7@synopsys.com> <1471725140-3833-3-git-send-email-ayaka@soulik.info> <57BAE65D.2090303@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57BAE65D.2090303@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Randy Li <ayaka@soulik.info>, linux-usb@vger.kernel.org, johnyoun@synopsys.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, eddie.cai@rock-chips.com, randy.li@rock-chips.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Montag, 22. August 2016, 17:17:41 schrieb Kishon Vijay Abraham I:
> Hi,
> 
> On Sunday 21 August 2016 02:02 AM, Randy Li wrote:
> > It is a hardware bug in RK3288, the only way to solve it is to
> > reset the phy.
> > 
> > Signed-off-by: Randy Li <ayaka@soulik.info>
> > ---
> > 
> >  drivers/phy/phy-rockchip-usb.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/drivers/phy/phy-rockchip-usb.c
> > b/drivers/phy/phy-rockchip-usb.c index 2a7381f..734987f 100644
> > --- a/drivers/phy/phy-rockchip-usb.c
> > +++ b/drivers/phy/phy-rockchip-usb.c
> > @@ -29,6 +29,7 @@
> > 
> >  #include <linux/reset.h>
> >  #include <linux/regmap.h>
> >  #include <linux/mfd/syscon.h>
> > 
> > +#include <linux/delay.h>
> > 
> >  static int enable_usb_uart;
> > 
> > @@ -64,6 +65,7 @@ struct rockchip_usb_phy {
> > 
> >  	struct clk_hw	clk480m_hw;
> >  	struct phy	*phy;
> >  	bool		uart_enabled;
> > 
> > +	struct reset_control *reset;
> > 
> >  };
> >  
> >  static int rockchip_usb_phy_power(struct rockchip_usb_phy *phy,
> > 
> > @@ -144,9 +146,23 @@ static int rockchip_usb_phy_power_on(struct phy
> > *_phy)
> > 
> >  	return clk_prepare_enable(phy->clk480m);
> >  
> >  }
> > 
> > +static int rockchip_usb_phy_reset(struct phy *_phy)
> > +{
> > +	struct rockchip_usb_phy *phy = phy_get_drvdata(_phy);
> > +
> > +	if (phy->reset) {
> > +		reset_control_assert(phy->reset);
> > +		udelay(10);
> > +		reset_control_deassert(phy->reset);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > 
> >  static const struct phy_ops ops = {
> >  
> >  	.power_on	= rockchip_usb_phy_power_on,
> >  	.power_off	= rockchip_usb_phy_power_off,
> > 
> > +	.reset		= rockchip_usb_phy_reset,
> 
> why not just reuse the .init ops? reset can be done during initialization
> right?

The naming of power_on + power_off and init + exit probably suggests that they 
are supposed to be used in pairs. (aka module_init + module_exit and probably 
more)

But in fact I've seen different combinations so far (phy_init + phy_power_on 
... phy_power_off + phy_exit but also phy_power_on + phy_init ... phy_exit + 
phy_power_off), so I guess the semantics are not that strictly defined.
