From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] clk: mvebu: Add core-divider clock
Date: Thu, 26 Sep 2013 12:12:41 -0300
Message-ID: <20130926151240.GB4583@localhost>
References: <1380144502-24109-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130925213730.GA19371@localhost>
 <20130926082404.GA18244@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130926082404.GA18244-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <elopez93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2013 at 10:24:04AM +0200, Andrew Lunn wrote:
> Hi Ezequiel
>=20
> > +static int clk_corediv_enable(struct clk_hw *hwclk)
> > +{
> > +	struct clk_corediv *corediv =3D to_corediv_clk(hwclk);
> > +	struct clk_corediv_desc *desc =3D &corediv->desc;
> > +	u32 reg;
> > +
> > +	reg =3D readl(corediv->reg);
> > +	reg |=3D (BIT(desc->fieldbit) << CORE_CLOCK_DIVIDER_ENABLE_OFFSET=
);
> > +	writel(reg, corediv->reg);
> > +	return 0;
> > +}
>=20
> Shouldn't there be spinlocks around these register accesses? At least
> the core gate clk driver has a spinlock.
>=20

Indeed.

> > +static long clk_corediv_round_rate(struct clk_hw *hwclk, unsigned =
long rate,
> > +	     				          unsigned long *parent_rate)
> > +{
> > +	/* Valid ratio are 1:4, 1:5, 1:6 and 1:8 */
> > +	u32 div;
> > +
> > +	div =3D *parent_rate / rate;
> > +	if (div <=3D 4)
> > +	   div =3D 4;
> > +	   else if (div <=3D 5)
> > +	   	div =3D 5;
> > +		else if (div <=3D 6)
> > +		     div =3D 6;
> > +		     else
> > +			div =3D 8;
> > +
> > +	return *parent_rate / div;
> > +}
>=20
> This looks odd. Is not the following clearer?
>=20
> 	div =3D *parent_rate / rate;
> 	if (div < 5)
> 	   div =3D 4;
> 	   else if (div > 6)
> 		div =3D 8;
>=20
> The CodingStyle might require some {} here?
>=20

Mmmm... no, it's not at all clearer to me.
IMHO, the original construction explicitly show the possible ratios:

	/* If it's smaller than or equal to 4, set to 4 */
	if (div <=3D 4)
		div =3D 4;

	/* Otherwise, if it's between 4 and 5, set to 5 */
	else if (div <=3D 5)
	 	div =3D 5;

	/* Otherwise, if it's between 5 and 6, set to 6 */
	else if (div <=3D 6)
		div =3D 6;

	/* Otherwise, if it's bigger than 6, set to 8 */
	else
		div =3D 8;

(And I don't think we need any braces).

Is this not clear?

> +   /*
> +    * Wait for clocks to settle down, and then clear all the
> +     * ratios request and the reload request.
> +      */
> +      udelay(1000);
> +      reg &=3D ~(CORE_CLOCK_DIVIDER_RATIO_MASK | CORE_CLOCK_DIVIDER_=
RATIO_RELOAD);
> +      writel(reg, corediv->reg);
> +      udelay(1000);
>=20
>=20
> Documentation/timers/timers-howto.txt says:=20
>=20
>        SLEEPING FOR ~USECS OR SMALL MSECS ( 10us - 20ms):
>        		* Use usleep_range
>=20

Right, forgot about that as well...

Thanks for the feedback!
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
