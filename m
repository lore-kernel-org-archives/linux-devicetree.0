From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] irqchip: sun4i: Use
 handle_fasteoi_irq for all interrupts
Date: Mon, 17 Mar 2014 12:12:13 +0100
Message-ID: <20140317111213.GG27873@lukather>
References: <1394895894-8891-1-git-send-email-hdegoede@redhat.com>
 <1394895894-8891-2-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="svExV93C05KqedWb"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBOFSTOMQKGQERS6JUUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1394895894-8891-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--svExV93C05KqedWb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2014 at 04:04:53PM +0100, Hans de Goede wrote:
> Since the sun4i irq chip does not require any action and clears the inter=
rupt
> when the level goes back to inactive, we don't need to mask / unmask for
> non oneshot IRQs, to achieve this we make sun4i_irq_ack a nop for all irqs
> except irq 0 and use handle_fasteoi_irq for all interrupts.
>=20
> Now there might be a case when the device reactivates the interrupt
> before the RETI. But that does not matter as we run the primary
> interrupt handlers with interrupts disabled.
>=20
> This also allows us to get rid of needing to use 2 irq_chip structs, this
> means that the IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED will now inf=
luence
> all interrupts rather then just irq 0, but that does not matter as the eoi
> is now a nop anyways for all interrupts but irq 0.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/irqchip/irq-sun4i.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
> index a0ed1ea..6a8c88d 100644
> --- a/drivers/irqchip/irq-sun4i.c
> +++ b/drivers/irqchip/irq-sun4i.c
> @@ -45,6 +45,9 @@ static void sun4i_irq_ack(struct irq_data *irqd)
>  	int reg =3D irq / 32;
>  	u32 val;
> =20
> +	if (irq !=3D 0)
> +		return; /* Only IRQ 0 / the ENMI needs to be acked */
> +
>  	val =3D readl(sun4i_irq_base + SUN4I_IRQ_PENDING_REG(reg));
>  	writel(val | (1 << irq_off),
>  	       sun4i_irq_base + SUN4I_IRQ_PENDING_REG(reg));
> @@ -76,13 +79,6 @@ static void sun4i_irq_unmask(struct irq_data *irqd)
> =20
>  static struct irq_chip sun4i_irq_chip =3D {
>  	.name		=3D "sun4i_irq",
> -	.irq_mask	=3D sun4i_irq_mask,
> -	.irq_unmask	=3D sun4i_irq_unmask,
> -};
> -
> -/* IRQ 0 / the ENMI needs a late eoi call */
> -static struct irq_chip sun4i_irq_chip_enmi =3D {
> -	.name		=3D "sun4i_irq",
>  	.irq_eoi	=3D sun4i_irq_ack,
>  	.irq_mask	=3D sun4i_irq_mask,
>  	.irq_unmask	=3D sun4i_irq_unmask,
> @@ -92,13 +88,7 @@ static struct irq_chip sun4i_irq_chip_enmi =3D {
>  static int sun4i_irq_map(struct irq_domain *d, unsigned int virq,
>  			 irq_hw_number_t hw)
>  {
> -	if (hw =3D=3D 0)
> -		irq_set_chip_and_handler(virq, &sun4i_irq_chip_enmi,
> -					 handle_fasteoi_irq);
> -	else
> -		irq_set_chip_and_handler(virq, &sun4i_irq_chip,
> -					 handle_level_irq);
> -
> +	irq_set_chip_and_handler(virq, &sun4i_irq_chip, handle_fasteoi_irq);
>  	set_irq_flags(virq, IRQF_VALID | IRQF_PROBE);

Oh.. And you just did. Nevermind then.

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--svExV93C05KqedWb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTJtiNAAoJEBx+YmzsjxAgnWUQAJVpIv1p7UlC+mMdUP5m08H3
fZ6om3gihUeYOHxVfUhX7tahH3hnRn1du3sWjrO1A+DxQ7paFzI16NfwLH37/AI2
SO6Ze5ZlfFQzeIzRObPgNVcfN0O8Jgm6Z7VW/SYS8B4TimljqIvpMv34dslxWmnZ
D2QQQ5VdPPmx40cyHbG2glBHkvLd8aKcSWG2GEwRPnR6sZ+3+ct/sGsDF3Q0Mgpt
muuOjgo1H6A9FPYfu3qSHBRbL/uljHhfBxaedF1v1uu7xOY99LQgBiylalmTeSvn
uFA9kO44gTQOzPoJPfpl7He7PPvCrMhLuslz4+IpAhq+luk33kkSbfWkX0GceCby
ZvD13Xn5YyhS5bhr4vWdLN46FytHET2g3v290s39c/Blub+yMh5W2JBzI6toxyc2
sT4lhpGR/OErHHfYPURnzt0n0clwWcyzzXWnNBMLL+7EoLIH0ExQrdiKeHJ8bRa+
zpGngCnGOFk/yRgpXrx3Afgt5FwDdrjLR4pTuaSEppdeRNZU/wmYjE2dVVUJCyJH
oECbkIEBoeJQjiZhPYfdCHGGXJlJxMBViOvbZl2lHnbH1pf2d3NcxxAnWE/OVp9x
VXV/eY7sbDcixXIJ+xcdRaWIQDwpURQ/zdnXqAVtlv5gRdOYgElm3jiHVDTSNE42
TtN9cW5rYa5JGaxoDHjZ
=02tA
-----END PGP SIGNATURE-----

--svExV93C05KqedWb--
