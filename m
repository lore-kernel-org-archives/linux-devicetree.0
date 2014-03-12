From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] irqchip: sun4i: Fix irq 0 not working
Date: Wed, 12 Mar 2014 11:09:35 +0100
Message-ID: <20140312100935.GY2815@lukather>
References: <1394553060-30298-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ioq9Y4M6AeSMCjnH"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB7PEQCMQKGQELGL26ZI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394553060-30298-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Ioq9Y4M6AeSMCjnH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 11, 2014 at 04:51:00PM +0100, Hans de Goede wrote:
> SUN4I_IRQ_VECTOR_REG containing 0 can mean one of 2 things:
> 1) irq 0 pending
> 2) no more irqs pending
>=20
> So we must loop always atleast once to make irq 0 work, otherwise irq 0
> will never get serviced and we end up with a hard hang because
> sun4i_handle_irq gets re-entered constantly.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/irqchip/irq-sun4i.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
> index a5438d8..3761bf1 100644
> --- a/drivers/irqchip/irq-sun4i.c
> +++ b/drivers/irqchip/irq-sun4i.c
> @@ -140,10 +140,16 @@ static asmlinkage void __exception_irq_entry sun4i_=
handle_irq(struct pt_regs *re
>  {
>  	u32 irq, hwirq;
> =20
> +	/*
> +	 * hwirq =3D=3D 0 can mean one of 2 things:
> +	 * 1) irq 0 pending
> +	 * 2) no more irqs pending

3) spurious interrupt.

> +	 * So loop always atleast once to make irq 0 work.
> +	 */
>  	hwirq =3D readl(sun4i_irq_base + SUN4I_IRQ_VECTOR_REG) >> 2;
> -	while (hwirq !=3D 0) {
> +	do {

I'd at least lookup in the pending register to see if the interrupt 0
was actually triggered. Otherwise, you could end up with spurious
handler calls on the interrupt 0.

>  		irq =3D irq_find_mapping(sun4i_irq_domain, hwirq);
>  		handle_IRQ(irq, regs);
>  		hwirq =3D readl(sun4i_irq_base + SUN4I_IRQ_VECTOR_REG) >> 2;

And you end up with the same issue if there's a first !=3D 0 interrupt,
and then the interrupt 0.

What about something like:

while (1) {
	hwirq =3D readl(sun4i_irq_base + SUN4I_IRQ_VECTOR_REG) >> 2;
	if (!hwirq)
		if (!(readl(sun4i_irq_base + SUN4I_IRQ_PENDING_REG(0)) & BIT(0)))
			break;

	irq =3D irq_find_mapping(sun4i_irq_domain, hwirq);
	handle_IRQ(irq, regs);
}

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Ioq9Y4M6AeSMCjnH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTIDJfAAoJEBx+YmzsjxAgon0P/3+ttT/S68xtGVRLLeePAFPW
Mi4Olug2xNATm7xdi+XIgtjhZAMmHPQrjMmqK9x+NROmdWxi8jT/n1cDBw91yZmR
fYVHlkreX48OZDDambQxfsapyvM8Framd8orLHMdVIPLIYamQgy/MDYAUMdsX2DL
OAiSCBV/GTRskSQf7KROICHaiDYUxdd7OQSCPluzUTtmxvJMLXcxDrJ/qHz6+Q63
Y5f4medmdZTycS194gvw0dD1pABiLZShAm7FpY8d0488XKBLe9THsbwJq4NTFKIT
tx9VtI2942+c7ubdbX0x4LE1N/RdIUHOSxwbk6K4Z2I1XrxmKl6cItxC1GvGg5io
j8gFwU/3e6MS1zjGnJT6MBYqRz9L65oYT4rx9dirQKHpyoG6xDqwfojTBTjzMkLc
q8pzmfBLn7uovODS3aQRg+vzhXZYkIeF+rllK2SXqCBJDUgGaaft70HOwVGfM2Vx
60ltN3zbRgPx/qCXuf9zVylVU1PlZiPCNPUlyL27ygYP+ZLCfsFXp12wtk9SCsoR
uDcXua2ZKZnA/j3n7dgdyinsOWo2ybW0S1YtLCnJDCSuss3zSCBC3J9TA7iHuWxp
RjxkXDxu9GXgcXfthq/B1+7ohFHXC5gKQHJDbl1QwjAvuc6tUNNpFayq4mQj0FI/
rwLi7yGxOYitch7IO+FF
=KX9J
-----END PGP SIGNATURE-----

--Ioq9Y4M6AeSMCjnH--
