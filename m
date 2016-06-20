From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: nand: sunxi: add reset line support
Date: Mon, 20 Jun 2016 14:51:56 +0200
Message-ID: <20160620145156.2f65cfd8@bbrezillon>
References: <20160619113739.30362-1-icenowy@aosc.xyz>
	<20160619113739.30362-2-icenowy@aosc.xyz>
	<20160619140652.07ab03c9@bbrezillon>
	<1466424354.6070.41.camel@pengutronix.de>
Reply-To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCK63FO5TUHRB3WNT65QKGQEQ72IVHA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1466424354.6070.41.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On Mon, 20 Jun 2016 14:05:54 +0200
Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

> Am Sonntag, den 19.06.2016, 14:06 +0200 schrieb Boris Brezillon:
> > +Philipp
> > 
> > On Sun, 19 Jun 2016 19:37:39 +0800
> > Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org> wrote:
> >   
> > > The NAND controller on some sun8i chips needs its reset line to be deasserted
> > > before they can enter working state. This commit added the reset line process
> > > to the driver.
> > > 
> > > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> > > ---
> > >  drivers/mtd/nand/sunxi_nand.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/mtd/nand/sunxi_nand.c b/drivers/mtd/nand/sunxi_nand.c
> > > index a83a690..1502748 100644
> > > --- a/drivers/mtd/nand/sunxi_nand.c
> > > +++ b/drivers/mtd/nand/sunxi_nand.c
> > > @@ -39,6 +39,7 @@
> > >  #include <linux/gpio.h>
> > >  #include <linux/interrupt.h>
> > >  #include <linux/iopoll.h>
> > > +#include <linux/reset.h>
> > >  
> > >  #define NFC_REG_CTL		0x0000
> > >  #define NFC_REG_ST		0x0004
> > > @@ -269,6 +270,7 @@ struct sunxi_nfc {
> > >  	void __iomem *regs;
> > >  	struct clk *ahb_clk;
> > >  	struct clk *mod_clk;
> > > +	struct reset_control *reset;
> > >  	unsigned long assigned_cs;
> > >  	unsigned long clk_rate;
> > >  	struct list_head chips;
> > > @@ -1871,6 +1873,18 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
> > >  	if (ret)
> > >  		goto out_ahb_clk_unprepare;
> > >  
> > > +	nfc->reset = devm_reset_control_get_optional(dev, "ahb");
> > > +	if (PTR_ERR(nfc->reset) == -EPROBE_DEFER)
> > > +		return PTR_ERR(nfc->reset);  
> > 
> > Actually you should test for != -ENOENT, because all error codes except
> > this one should stop the ->probe().
> > 
> > BTW, this devm_reset_control_get_optional() is really weird. While most
> > _optional() methods return NULL when the element is not defined in the
> > DT, this one returns -ENOTENT, which makes it impossible to
> > differentiate a real error from a undefined reset line (which is a
> > valid case for _optional()).  
> 
> Of course it's possible, -ENOENT is only returned if the reset line is
> not defined in the device tree.

Okay, testing for err != -ENOENT is the right thing to do here. Maybe
this could be documented.

> 
> Note that gpiod_get_(index_)optional do nothing more that replacing
> -ENOENT with NULL. And phydev_optional_get replaces -ENODEV with NULL.
> And regulator_get_optional, if I understand it correctly, never returns
> NULL.
> 
> > Philipp, is there a good reason for doing that?  
> 
> Historically, NULL has not been a valid value for rstc. I suppose we
> could add NULL checks to the reset_control_assert/deassert/reset/status
> functions and align the reset API a bit with gpiod. I just wouldn't want
> to see any IS_ERR_OR_NULL error handling in the drivers.

Well, returning NULL is mainly a convenient way to differentiate real
errors from missing optional reset lines (which are not errors). Now,
if you say checking for -ENOENT is the right thing to do here, I'm
fine with that.

Regards,

Boris
