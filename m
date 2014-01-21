From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 04/15] watchdog: orion: Handle IRQ
Date: Tue, 21 Jan 2014 11:35:59 -0300
Message-ID: <20140121143558.GA24923@localhost>
References: <1390310774-20781-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390310774-20781-5-git-send-email-ezequiel.garcia@free-electrons.com>
 <52DE84A6.6090909@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52DE84A6.6090909-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 06:31:02AM -0800, Guenter Roeck wrote:
> On 01/21/2014 05:26 AM, Ezequiel Garcia wrote:
> > DT-enabled where an irqchip driver for the brigde interrupt control=
ler is
> > available can handle the watchdog IRQ properly. Therefore, we reque=
st
> > the interruption and add a dummy handler that merely calls panic().
> >
> > This is done in order to have an initial 'ack' of the interruption,
> > which clears the watchdog state.
> >
> > Furthermore, since some platforms don't have such IRQ, this commit
> > makes the interruption specification optional.
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >   .../devicetree/bindings/watchdog/marvel.txt        |  2 ++
> >   drivers/watchdog/orion_wdt.c                       | 22 +++++++++=
++++++++++++-
> >   2 files changed, 23 insertions(+), 1 deletion(-)
> >
>=20
> [ ... ]
>=20
> >   static int orion_wdt_probe(struct platform_device *pdev)
> >   {
> >   	struct resource *res;
> > -	int ret;
> > +	int ret, irq;
> >
> >   	clk =3D devm_clk_get(&pdev->dev, NULL);
> >   	if (IS_ERR(clk)) {
> > @@ -131,6 +138,19 @@ static int orion_wdt_probe(struct platform_dev=
ice *pdev)
> >   	if (!wdt_reg)
> >   		return -ENOMEM;
> >
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq > 0) {
>=20
> 0 is a valid interrupt number, and platform_get_irq returns an error =
code on errors.
> Should be >=3D 0.
>=20

Yes, indeed. I'll wait to see if there's any other feedback and then se=
nd a v4.

Thanks a lot!
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
