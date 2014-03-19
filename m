From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 0/3] ARM: sun7i/sun6i: irqchip: Irqchip
 driver for NMI controller
Date: Wed, 19 Mar 2014 13:32:41 +0100
Message-ID: <20140319123241.GI27873@lukather>
References: <1394890861-18347-1-git-send-email-carlo@caione.org>
 <alpine.DEB.2.02.1403191213240.18573@ionos.tec.linutronix.de>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NJ3lxSTgSwfmyg6j"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB6M5U2MQKGQET4WBDCY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1403191213240.18573-3cz04HxQygjZikZi3RtOZ1XZhhPuCNm+@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--NJ3lxSTgSwfmyg6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2014 at 12:13:56PM +0100, Thomas Gleixner wrote:
> On Sat, 15 Mar 2014, Carlo Caione wrote:
>=20
> > Allwinner A20/A31 SoCs have a special interrupt controller for managing=
 NMI.
> > Three register are present to (un)mask, control and acknowledge NMI.
> > These two patches add a new irqchip driver in cascade with GIC.
>=20
> If I get an ack for the DT parts, I'll pick it up.

I had some comments on it, so Carlo will probably resubmit it.

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--NJ3lxSTgSwfmyg6j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTKY5pAAoJEBx+YmzsjxAggFwQAKkYRM5PLlzz0dGZy8hfz0PL
I2jE67zZVZfcyHuwH4jFS1y5Ys5e1ikQx2hlXVtqLJ5LP/QOEgmqEjL3PR39QaYi
BPfemj/X5sNnFogau2SDyqZIhy04FuOvScEaXHwmBVmcXLEIBjvsZMAncy3ExzW2
vhMazP/5qj4sXM4tGm82RPjJhz2y9C5gIPJdj6mrmF6TfwGAB+Rg8rOQfnHbwkhg
NSecV0yIp3R+RoC+byLgMKSl3c9efe4zFbipe7PigSrgFLyMTVYW+kkT/IWdYqHc
/I2+IXEExCk48t528etwIAwxruWr6juldRabcdSIbtWrsB6Tpp5uhFqBwAVXiVvD
oWZU6sbQdE2WZs10Za+5Oq+i2Utobo0JO7ug8drI4gYxYvyCJfcnbCQaY8uruJWy
QR2vq31QkqxJ0RYbQGjRsDG6AGKZDkrR1FqUZjyK5A4QxpZhwezQ4aDIB3q0ZSZW
e34bHZQ89+Ht5VxxAeQU6YriHnvMIULTriThCJE3KIMBW11dfzWJ3XV79IqRGZ3+
bWk5MNg5C7ehQvNJPUFbzz25MQHpPRRwxJhaa16JorF0iMzSnKPCYWbGfBp/sSqV
+zaj6ldoyF0weCd8Lu+7Iag28lWp+ukRT9hGs6xL5Tb61LKBbyzXq4Tuh/mfCW/X
SU9dmAIiH8NJgpzHlmlU
=Gf83
-----END PGP SIGNATURE-----

--NJ3lxSTgSwfmyg6j--
