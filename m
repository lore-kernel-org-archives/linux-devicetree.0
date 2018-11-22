From: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v3 05/17] irqchip/sun4i: add support for
 suniv interrupt controller
Date: Thu, 22 Nov 2018 18:02:00 +0300
Message-ID: <20181122150200.p6e22sp3v4npb42w@ThinkPad>
References: <cover.1542824904.git.mesihkilinc@gmail.com>
 <08b40429e46626f4caf8e4d2287b5c4d354e3b7f.1542824904.git.mesihkilinc@gmail.com>
 <20181122083547.srnopylueqx6p2qj@flea>
Reply-To: mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDI4VHO5SYLBB24J3PPQKGQE72KJ3AI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181122083547.srnopylueqx6p2qj@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18/11/22 09:35, Maxime Ripard wrote:
> Hi Mesih,
> 
Hi!
> On Wed, Nov 21, 2018 at 09:30:38PM +0300, Mesih Kilinc wrote:
> > The new F-series SoCs (suniv) from Allwinner use an stripped version of
> > the interrupt controller in A10/A13
> > 
> > Add support for it in irq-sun4i driver.
> > 
> > Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/irqchip/irq-sun4i.c | 104 +++++++++++++++++++++++++++++++-------------
> >  1 file changed, 74 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
> > index e3e5b91..7ca4a4d 100644
> > --- a/drivers/irqchip/irq-sun4i.c
> > +++ b/drivers/irqchip/irq-sun4i.c
> > @@ -28,11 +28,21 @@
> >  #define SUN4I_IRQ_NMI_CTRL_REG		0x0c
> >  #define SUN4I_IRQ_PENDING_REG(x)	(0x10 + 0x4 * x)
> >  #define SUN4I_IRQ_FIQ_PENDING_REG(x)	(0x20 + 0x4 * x)
> > -#define SUN4I_IRQ_ENABLE_REG(x)		(0x40 + 0x4 * x)
> > -#define SUN4I_IRQ_MASK_REG(x)		(0x50 + 0x4 * x)
> > +#define SUN4I_IRQ_ENABLE_REG(x)		(irq_ic_data->enable_req_offset + 0x4 * x)
> > +#define SUN4I_IRQ_MASK_REG(x)		(irq_ic_data->mask_req_offset + 0x4 * x)
> 
> You shouldn't have all the values you use passed as argument, so
> irq_ic_data should be one of them here.
> 
Could you elaborate it a little bit?
> > +#define SUN4I_IRQ_ENABLE_REG_OFFSET	0x40
> > +#define SUN4I_IRQ_MASK_REG_OFFSET	0x50
> > +#define SUNIV_IRQ_ENABLE_REG_OFFSET	0x20
> > +#define SUNIV_IRQ_MASK_REG_OFFSET	0x30
> > +
> > +struct sunxi_irq_chip_data{
>                              ^ a space here
> 
> > +	void __iomem *irq_base;
> > +	struct irq_domain *irq_domain;
> > +	u32 enable_req_offset;
> > +	u32 mask_req_offset;
> 
> s/req/reg/ ?
> 
Oops sorry

...
> > +
> > +static int __init suniv_ic_of_init(struct device_node *node,
> > +				   struct device_node *parent)
> > +{
> > +	irq_ic_data = kzalloc(sizeof(struct sunxi_irq_chip_data), GFP_KERNEL);
> > +	if (!irq_ic_data) {
> > +		pr_err("kzalloc failed!\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	irq_ic_data->enable_req_offset = SUNIV_IRQ_ENABLE_REG_OFFSET;
> > +	irq_ic_data->mask_req_offset = SUNIV_IRQ_MASK_REG_OFFSET;
> > +
> > +	return sun4i_of_init(node, parent);
> > +}
> > +
> > +IRQCHIP_DECLARE(allwinner_sunvi_ic, "allwinner,suniv-f1c100s-ic", suniv_ic_of_init);
> 
> You can even split that addition to a new patch as well.

OK. I will do 3 patches. First one will add a struct that holds only
base and domain. Second one will add register offsets to that struct. 
Third one will add f1c100s support. Is that ok?

Mesih
