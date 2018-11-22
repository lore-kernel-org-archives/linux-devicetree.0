From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH v3 05/17] irqchip/sun4i: add support for
 suniv interrupt controller
Date: Thu, 22 Nov 2018 16:59:44 +0100
Message-ID: <20181122155944.vkx2u4iwwedheor2@flea>
References: <cover.1542824904.git.mesihkilinc@gmail.com>
 <08b40429e46626f4caf8e4d2287b5c4d354e3b7f.1542824904.git.mesihkilinc@gmail.com>
 <20181122083547.srnopylueqx6p2qj@flea>
 <20181122150200.p6e22sp3v4npb42w@ThinkPad>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h2z3qr6y2agvh63m"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB65E3PPQKGQEH2CFWZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181122150200.p6e22sp3v4npb42w@ThinkPad>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--h2z3qr6y2agvh63m
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Nov 22, 2018 at 06:02:00PM +0300, Mesih Kilinc wrote:
> > > diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
> > > index e3e5b91..7ca4a4d 100644
> > > --- a/drivers/irqchip/irq-sun4i.c
> > > +++ b/drivers/irqchip/irq-sun4i.c
> > > @@ -28,11 +28,21 @@
> > >  #define SUN4I_IRQ_NMI_CTRL_REG		0x0c
> > >  #define SUN4I_IRQ_PENDING_REG(x)	(0x10 + 0x4 * x)
> > >  #define SUN4I_IRQ_FIQ_PENDING_REG(x)	(0x20 + 0x4 * x)
> > > -#define SUN4I_IRQ_ENABLE_REG(x)		(0x40 + 0x4 * x)
> > > -#define SUN4I_IRQ_MASK_REG(x)		(0x50 + 0x4 * x)
> > > +#define SUN4I_IRQ_ENABLE_REG(x)		(irq_ic_data->enable_req_offset + 0x4 * x)
> > > +#define SUN4I_IRQ_MASK_REG(x)		(irq_ic_data->mask_req_offset + 0x4 * x)
> > 
> > You shouldn't have all the values you use passed as argument, so
> > irq_ic_data should be one of them here.
> >
>
> Could you elaborate it a little bit?

You should change your macro to something like:

SUN4I_IRQ_ENABLE_REG(data, x) ((data)->enable_req_offset + 0x4 * x)

That way, you are transparent about the parameters that the macro
expects, and don't rely on some unwritten rule about the variable
name.

> > > +
> > > +static int __init suniv_ic_of_init(struct device_node *node,
> > > +				   struct device_node *parent)
> > > +{
> > > +	irq_ic_data = kzalloc(sizeof(struct sunxi_irq_chip_data), GFP_KERNEL);
> > > +	if (!irq_ic_data) {
> > > +		pr_err("kzalloc failed!\n");
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	irq_ic_data->enable_req_offset = SUNIV_IRQ_ENABLE_REG_OFFSET;
> > > +	irq_ic_data->mask_req_offset = SUNIV_IRQ_MASK_REG_OFFSET;
> > > +
> > > +	return sun4i_of_init(node, parent);
> > > +}
> > > +
> > > +IRQCHIP_DECLARE(allwinner_sunvi_ic, "allwinner,suniv-f1c100s-ic", suniv_ic_of_init);
> > 
> > You can even split that addition to a new patch as well.
> 
> OK. I will do 3 patches. First one will add a struct that holds only
> base and domain. Second one will add register offsets to that struct. 
> Third one will add f1c100s support. Is that ok?

Sounds perfect :)

Thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--h2z3qr6y2agvh63m--
