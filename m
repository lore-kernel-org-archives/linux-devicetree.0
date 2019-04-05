From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 5/5] ARM: dts: sun8i: tbs-a711: Enable
 UART2 (for NEO-6M GPS module)
Date: Fri, 5 Apr 2019 17:07:06 +0200
Message-ID: <20190405150706.jyeght2bbw7xgxf7@flea>
References: <20190401115616.21337-1-megous@megous.com>
 <20190401115616.21337-6-megous@megous.com>
 <20190404124322.aejij7qomgoco37u@core.my.home>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uwakmiup36vvgwaj"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBHO6TXSQKGQEANUKKHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190404124322.aejij7qomgoco37u-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: wens-jdAy2FN1RRM@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--uwakmiup36vvgwaj
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2019 at 02:43:22PM +0200, Ond=C5=99ej Jirman wrote:
> Hello Maxime,
>
> On Mon, Apr 01, 2019 at 01:56:16PM +0200, megous via linux-sunxi wrote:
> > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >
> > TBS A711 tablet contains u-blox NEO-6M module connected to UART2.
> > Enable UART2 to gain access to the module from userspace.
>
> Other GPS bits are now applied (thank you, Johan), so if this last bit
> can go in too via a sunxi tree, the series will be complete.

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--uwakmiup36vvgwaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKdvGgAKCRDj7w1vZxhR
xRxXAQC03Gta5to+qN1+5WtOWtjTcudQ9DDHqL2MXyLIF7+XngEAmb8woERoUW7A
2uUvjtVRFN+dv8zaqPe/H1grGjLfPQY=
=DaMZ
-----END PGP SIGNATURE-----

--uwakmiup36vvgwaj--
